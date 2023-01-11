package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import util.DBUtil;
import vo.Cart;
import dao.CartDao;

public class CartService {
	private CartDao cartDao;
	
	// 장바구니에 담기
	public int addCart(Cart cart) {
		int row = 0;
		boolean duplResult = false;
		int updateQuantity = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.cartDao = new CartDao();
			duplResult = cartDao.duplGoods(conn, cart); // 같은 상품이 담겨있는지 확인
			if(duplResult == false) {
				row = cartDao.insertCart(conn, cart);
				if(row == 1) { // 선택한 상품이 장바구니에 없음
					System.out.println("CartService: 장바구니 담기 완료");
				}
			} else { // 선택한 상품이 장바구니에 있음
				updateQuantity = cartDao.updateGoodsQuantity(conn, cart);
				if(updateQuantity == 1) {
					System.out.println("CartService: 수량변경완료");
				}
			row = 1;
			}
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch(SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return row; 
	}
	
	// 장바구니 목록 불러오기 
	public ArrayList<HashMap<String, Object>> selectCartList(String customerId) {
		ArrayList<HashMap<String, Object>> list = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			list = new ArrayList<HashMap<String, Object>>();
			this.cartDao = new CartDao();
			list = cartDao.selectCartList(conn, customerId);
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch(SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public int removeCartList(Cart cart) {
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.cartDao = new CartDao();
			row = cartDao.deleteCartList(conn, cart);
			if(row == 1) {
				System.out.println("CartService: 장바구니 삭제완료");
			}
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch(SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return row; 
	}
}
