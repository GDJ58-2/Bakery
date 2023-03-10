package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import dao.CartDao;
import dao.CustomerAddressDao;
import dao.GoodsDao;
import dao.OrdersDao;
import util.DBUtil;
import vo.Cart;
import vo.CustomerAddress;
import vo.Goods;
import vo.Orders;
import vo.PointHistory;

public class OrdersService {
	private PointHistoryService pointHistoryService;
	private OrdersDao ordersDao;
	private CartDao cartDao;
	private GoodsDao goodsDao;
	private CustomerAddressDao customerAddressDao;
	
	// GET
	// 페이징 전체 상품 개수
	public int getOrdersCount() {
		int count = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			
			ordersDao = new OrdersDao();
			count = ordersDao.selectOrdersCount(conn);
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return count;
	}
	
	// 회원의 주문 내역
	public ArrayList<HashMap<String, Object>> getOrdersList(String customerId, int beginRow, int rowPerPage){
		ArrayList<HashMap<String, Object>> list = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.ordersDao = new OrdersDao();
			list = ordersDao.selectOrdersList(conn, customerId, beginRow, rowPerPage);
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				DBUtil.close(null, null, conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	// 회원의 날짜별 주문 상세보기
	public ArrayList<HashMap<String, Object>> getOrdersOneList(String createdate, String customerId) {
		ArrayList<HashMap<String, Object>> list = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			
			this.ordersDao = new OrdersDao();
			list = ordersDao.selectOrdersOneList(conn, createdate, customerId);
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	// 회원의 주문 상세보기 (수정 목적)
	public HashMap<String, Object> getOrdersOne(int orderCode) {
		HashMap<String, Object> map = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			
			this.ordersDao = new OrdersDao();
			map = ordersDao.selectOrdersOne(conn, orderCode);
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return map;
	}
	
	// ADD
	public HashMap<String, Object> addOrders(ArrayList<Orders> ordersList, CustomerAddress address, int paramUsePoint) { // 주문
		HashMap<String, Object> map = null;	
		this.pointHistoryService = new PointHistoryService();
		this.customerAddressDao = new CustomerAddressDao();
		this.ordersDao = new OrdersDao();
		this.cartDao = new CartDao();
		this.goodsDao = new GoodsDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			// 주소추가
			int addressCode = 0;
			if(address.getAddressKind().equals("직접입력")) {
				address.setAddressKind("기타");
				HashMap<String, Object> addressMap = customerAddressDao.insertAddress(conn, address);
				addressCode = (int)addressMap.get("addressCode");
			} else {
				addressCode = customerAddressDao.selectAddressCode(conn, address);
			}
			System.out.println(addressCode+"<--OrdersService addressCode");
			
			// 주문추가 
			for(Orders o : ordersList) {
				o.setAddressCode(addressCode);
				map = ordersDao.insertOrders(conn, o);
				// 장바구니 삭제
				Cart cart = new Cart(o.getGoodsCode(), o.getCustomerId(), o.getOrderQuantity(), null);
				cartDao.deleteCartList(conn, cart);
				// 포인트 사용 내역 추가 -> 적립은 구매확정 후 
				if(paramUsePoint!=0) {
					PointHistory usePoint = new PointHistory((int)map.get("orderCode"), "사용", paramUsePoint/(ordersList.size()) , null);
					pointHistoryService.addPointHistory(address.getCustomerId(), usePoint);
				}
				// goods 재고 변경
				HashMap<String, Object> stock = this.goodsDao.selectGoodsOne(conn, o.getGoodsCode());
				Goods goods = new Goods();
				goods.setGoodsCode(o.getGoodsCode());
				goods.setGoodsStock((int)stock.get("goodsStock")-o.getOrderQuantity());
				goodsDao.updateGoodsStock(conn, goods);
			}
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				DBUtil.close(null, null, conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return map; // (int)map.get("row")==1 -> 추가 성공
	}
	
	// UPDATE
	public int modifyOrders(Orders orders) { // 주문 상태 수정
		int row = 0;
		int point = 0;
		this.ordersDao = new OrdersDao();
		this.pointHistoryService = new PointHistoryService();
		this.goodsDao = new GoodsDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = ordersDao.updateOrders(conn, orders);
			if(row!=1) {
				return -1;
			}
			
			if(orders.getOrderState().equals("취소")) { // 주문을 취소하면 그 주문에 대한 포인트내역 삭제(적립/사용)
				// 포인트 내역 삭제
				point = pointHistoryService.removePointHistory(orders.getCustomerId(), orders.getOrderCode());
				// 재고 변경
				HashMap<String, Object> stock = goodsDao.selectGoodsOne(conn, orders.getGoodsCode());
				Goods goods = new Goods();
				goods.setGoodsCode(orders.getGoodsCode());
				goods.setGoodsStock((int)stock.get("goodsStock")+orders.getOrderQuantity());
				goodsDao.updateGoodsStock(conn, goods);
				
			} else if(orders.getOrderState().equals("구매확정")) {
				// 포인트 내역 추가 (적립)
				PointHistory p = new PointHistory(orders.getOrderCode(),"적립", (int)(orders.getOrderPrice()*0.05),null);
				point = pointHistoryService.addPointHistory(orders.getCustomerId(), p);
				
			}
			
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				DBUtil.close(null, null, conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return point;
	}
	
	// REMOVE
	public int removeOrders(String createdate) { // 주문 삭제
		int row = 0;
		this.ordersDao = new OrdersDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = ordersDao.deleteOrders(conn, createdate);
			// System.out.println("service row : " + row);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				DBUtil.close(null, null, conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	// 관리자 기능 - 모든 주문내역 보기 
	public ArrayList<HashMap<String, Object>> getOrdersListByAdmin(String searchKind, String search, String startDate, String endDate, String orderState, int currentPage, int rowPerPage) {
		ArrayList<HashMap<String, Object>> list = null;
		this.ordersDao = new OrdersDao();
		Connection conn = null;
		if(startDate==null||startDate.equals("")) {
			startDate="%%";
		}
		if(endDate==null||endDate.equals("")) {
			endDate="%%";
		}
		if(orderState==null||orderState.equals("")) {
			orderState="%%";
		}
		if(search==null||search.equals("")) {
			search="";
		}
		if(searchKind==null||searchKind.equals("")) {
			searchKind="o.order_code";
		}
		int beginRow = (currentPage-1)*rowPerPage;
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startDate", startDate);
		paramMap.put("endDate", endDate);
		paramMap.put("orderState", orderState);
		paramMap.put("searchKind", searchKind);
		paramMap.put("search", search);
		paramMap.put("beginRow", beginRow);
		paramMap.put("rowPerPage", rowPerPage);
		try {
			conn = DBUtil.getConnection();
			list = ordersDao.selectOrdersListByAdmin(conn, paramMap);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				DBUtil.close(null, null, conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	// 페이징 - 관리자
	public int getOrdersCount(String searchKind, String search, String startDate, String endDate, String orderState) {
		int count = 0;
		this.ordersDao = new OrdersDao();
		Connection conn = null;
		if(startDate==null||startDate.equals("")) {
			startDate="%%";
		}
		if(endDate==null||endDate.equals("")) {
			endDate="%%";
		}
		if(orderState==null||orderState.equals("")) {
			orderState="%%";
		}
		if(searchKind == null || searchKind.equals("")) {
			searchKind = "o.order_code";
		}
		if(search==null) {
			search = "";
		}
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startDate", startDate);
		paramMap.put("endDate", endDate);
		paramMap.put("orderState", orderState);
		paramMap.put("searchKind", searchKind);
		paramMap.put("search", search);
		
		try {
			conn = DBUtil.getConnection();
			count = ordersDao.selectOrdersCount(conn, paramMap);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				DBUtil.close(null, null, conn); // db 자원반납
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return count;
	} 
	
	// 관리자 기능 - 배송상태 별 개수 확인
	public ArrayList<HashMap<String, Object>> getCountByOrderState(String startDate, String endDate) {
		ArrayList<HashMap<String, Object>> list = null;
		this.ordersDao = new OrdersDao();
		Connection conn = null;
		if(startDate==null||startDate.equals("")) {
			startDate="%%";
		}
		if(endDate==null||endDate.equals("")) {
			endDate="%%";
		}
		HashMap<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("startDate", startDate);
		paramMap.put("endDate", endDate);
		try {
			conn = DBUtil.getConnection();
			list = ordersDao.selectOrdersCountByOrderState(conn, paramMap);
			conn.commit();
		} catch (Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				DBUtil.close(null, null, conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}