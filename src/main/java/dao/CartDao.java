package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import vo.Cart;
import util.DBUtil;

public class CartDao {
	
	// 장바구니에 담기
	public int insertCart(Connection conn, Cart cart) throws Exception {
		int row = 0;
		String sql = "INSERT INTO cart ("
				+ "goods_code, customer_id, cart_quantity, createdate"
				+ ") VALUES (?, ?, ?, NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, cart.getGoodsCode());
		stmt.setString(2, cart.getCustomerId());
		stmt.setInt(3, cart.getCartQuantity());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	
	// 장바구니 목록 불러오기 
	public ArrayList<HashMap<String, Object>> selectCartList(Connection conn, String customerId) throws Exception {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		String sql = "SELECT c.goods_code goodsCode"
				+ ", g.goods_name goodsName"
				+ ", g.goods_price goodsPrice"
				+ ", c.customer_id customerId"
				+ ", c.cart_quantity cartQuantity"
				+ ", c.createdate"
				+ " FROM cart c"
				+ " INNER JOIN goods g"
				+ " ON c.goods_code = g.goods_code"
				+ " WHERE c.customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customerId);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("goodscode", rs.getInt("goodsCode"));
			m.put("goodsName", rs.getString("goodsName"));
			m.put("goodsPrice", rs.getInt("goodsPrice"));
			m.put("customerId", rs.getString("customerId"));
			m.put("cartQuantity", rs.getInt("cartQuantity"));
			m.put("createdate", rs.getString("createdate"));
			list.add(m);
		}
		DBUtil.close(rs, stmt, null);
		return list;
	}
	
	// 이미 담겨있는 상품인지 확인하기
	public int duplGoods(Connection conn, Cart cart) throws Exception {
		int row = 0;
		String sql = "SELECT goods_code goodsCode"
				+ " FROM cart"
				+ " WHERE customer_id = ? AND goods_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, cart.getCustomerId());
		stmt.setInt(2, cart.getGoodsCode());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	
	// 담겨있는 상품 수량변경하기
	public int updateGoodsQuantity(Connection conn, Cart cart) throws Exception {
		int row = 0;
		String sql = "UPDATE cart SET cart_quantity = ?"
				+ " WHERE customer_id = ? AND goods_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, cart.getCartQuantity());
		stmt.setString(2, cart.getCustomerId());
		stmt.setInt(3, cart.getGoodsCode());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	
	// 장바구니 삭제하기
	public int deleteCartList(Connection conn, Cart cart) throws Exception {
		int row = 0;
		String sql = "DELETE FROM cart WHERE customer_id = ? AND goods_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, cart.getCustomerId());
		stmt.setInt(2, cart.getGoodsCode());
		row = stmt.executeUpdate();
		return row;
	}
}