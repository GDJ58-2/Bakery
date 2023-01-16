package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import dao.CartDao;
import dao.CustomerAddressDao;
import dao.GoodsDao;
import dao.OrdersDao;
import dao.PointHistoryDao;
import util.DBUtil;
import vo.Cart;
import vo.CustomerAddress;
import vo.Goods;
import vo.Orders;
import vo.PointHistory;

public class OrdersService {
	private PointHistoryDao pointHistoryDao;
	private OrdersDao ordersDao;
	private CartDao cartDao;
	private GoodsDao goodsDao;
	private CustomerAddressDao customerAddressDao;
	
	// GET
	// 회원의 주문 내역
	public ArrayList<HashMap<String, Object>> getOrdersList(String customerId){
		ArrayList<HashMap<String, Object>> list = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.ordersDao = new OrdersDao();
			list = ordersDao.selectOrdersList(conn, customerId);
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
		this.pointHistoryDao = new PointHistoryDao();
		this.customerAddressDao = new CustomerAddressDao();
		this.ordersDao = new OrdersDao();
		this.cartDao = new CartDao();
		this.goodsDao = new GoodsDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			// 주소추가
			int addressCode = 0;
			if(address.getAddress()==null||address.getAddress().equals("")) { // 직접입력하지 않음(->이미 사용했던 주소 중 선택)
				addressCode = customerAddressDao.selectAddressCode(conn, address);
			} else {
				HashMap<String, Object> addressMap = customerAddressDao.insertAddress(conn, address);
				addressCode = (int)addressMap.get("addressCode");
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
					PointHistory usePoint = new PointHistory((int)map.get("orderCode"), "사용", paramUsePoint, null);
					pointHistoryDao.insertPoint(conn, usePoint);
				}
				// goods 재고 변경
				HashMap<String, Object> stock = this.goodsDao.selectgoodsOne(conn, o.getGoodsCode());
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
		this.ordersDao = new OrdersDao();
		this.pointHistoryDao = new PointHistoryDao();
		this.goodsDao = new GoodsDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = ordersDao.updateOrders(conn, orders);
			if(orders.getOrderState().equals("취소")) {
				// 포인트 내역 삭제
				pointHistoryDao.deletePoint(conn, orders.getOrderCode());
				// 재고 변경
				HashMap<String, Object> stock = this.goodsDao.selectgoodsOne(conn, orders.getGoodsCode());
				Goods goods = new Goods();
				goods.setGoodsCode(orders.getGoodsCode());
				goods.setGoodsStock((int)stock.get("goodsStock")+orders.getOrderQuantity());
			} else if(orders.getOrderState().equals("구매확정")) {
				// 포인트 내역 추가 (적립)
				System.out.print((int)(orders.getOrderPrice()*0.05));
				PointHistory p = new PointHistory(orders.getOrderCode(),"적립", (int)(orders.getOrderPrice()*0.05),null);
				pointHistoryDao.insertPoint(conn, p);
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
		return row;
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
	public ArrayList<HashMap<String, Object>> getOrdersListByAdmin() {
		ArrayList<HashMap<String, Object>> list = null;
		this.ordersDao = new OrdersDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			list = ordersDao.selectOrdersListByAdmin(conn);
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