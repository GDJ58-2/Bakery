package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import dao.CartDao;
import dao.CustomerAddressDao;
import dao.OrdersDao;
import dao.PointHistoryDao;
import util.DBUtil;
import vo.Cart;
import vo.CustomerAddress;
import vo.Orders;
import vo.PointHistory;

public class OrdersService {
	private PointHistoryDao pointHistoryDao;
	private OrdersDao ordersDao;
	private CustomerAddressDao customerAddressDao;
	private CartDao cartDao;
	
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
	public ArrayList<HashMap<String, Object>> getOrdersOneList(String createdate) {
		ArrayList<HashMap<String, Object>> list = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			
			this.ordersDao = new OrdersDao();
			list = ordersDao.selectOrdersOneList(conn, createdate);
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
	public int addOrders(ArrayList<Orders> ordersList, CustomerAddress address, int paramUsePoint) { // 주문
		int orderCode = 0;
		this.pointHistoryDao = new PointHistoryDao();
		this.customerAddressDao = new CustomerAddressDao();
		this.ordersDao = new OrdersDao();
		this.cartDao = new CartDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			// 주소추가
			int addressCode = 0;
			if(address.getAddressKind().equals("기타")) {
				addressCode = customerAddressDao.insertAddress(conn, address);
			} else {
				addressCode = customerAddressDao.selectAddressCode(conn, address);
			}
			System.out.println(addressCode+"<--OrdersService addressCode");
			// 주문추가
			for(Orders o : ordersList) {
				o.setAddressCode(addressCode);
				orderCode = ordersDao.insertOrders(conn, o);
				System.out.println(orderCode+"<--OrdersService orderCode");
				// 장바구니 삭제
				Cart cart = new Cart(o.getGoodsCode(), o.getCustomerId(), o.getOrderQuantity(), null);
				cartDao.deleteCartList(conn, cart);
				// 포인트 내역 추가
				PointHistory usePoint = new PointHistory(orderCode, "사용", paramUsePoint, null);
				if(paramUsePoint!=0) {
					pointHistoryDao.insertPoint(conn, usePoint);
				}
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
		return orderCode;
	}
	
	// UPDATE
	public int modifyOrdersByAdmin(Orders orders) { // 주문수정-관리자
		int row = 0;
		this.ordersDao = new OrdersDao();
		this.pointHistoryDao = new PointHistoryDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = ordersDao.updateOrdersByAdmin(conn, orders);
			if(orders.getOrderState().equals("취소")) {
				pointHistoryDao.deletePoint(conn, orders.getOrderCode());
			} else if(orders.getOrderState().equals("구매확정")) {
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
	
	public int modifyOrdersByCustomer(Orders orders) { // 주문수정- 고객
		int row = 0;
		this.ordersDao = new OrdersDao();
		this.pointHistoryDao = new PointHistoryDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = ordersDao.updateOrdersByAdmin(conn, orders);
			if(orders.getOrderState().equals("취소")) {
				pointHistoryDao.deletePoint(conn, orders.getOrderCode());
			} else if(orders.getOrderState().equals("구매확정")) {
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
}