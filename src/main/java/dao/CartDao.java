package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import util.DBUtil;
import vo.Cart;
import vo.Goods;

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
				+ ", i.filename filename"
				+ ", c.customer_id customerId"
				+ ", c.cart_quantity cartQuantity"
				+ ", c.createdate"
				+ " FROM cart c"
				+ " INNER JOIN goods g"
				+ " ON c.goods_code = g.goods_code"
				+ " INNER JOIN goods_img i"
				+ " ON g.goods_code = i.goods_code"
				+ " WHERE c.customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customerId);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("goodsCode", rs.getInt("goodsCode"));
			m.put("goodsName", rs.getString("goodsName"));
			m.put("goodsPrice", rs.getInt("goodsPrice"));
			m.put("filename", rs.getString("filename"));
			m.put("customerId", rs.getString("customerId"));
			m.put("cartQuantity", rs.getInt("cartQuantity"));
			m.put("createdate", rs.getString("createdate"));
			list.add(m);
		}
		DBUtil.close(rs, stmt, null);
		return list;
	}
	   
	// 비회원 장바구니 이미지 불러오기
	public String getGoodsImg(Connection conn, int goodsCode) throws Exception {
		String result = null;
		String sql = "SELECT filename FROM goods_img WHERE goods_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, goodsCode);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			result = rs.getString("filename");
		}
		DBUtil.close(rs, stmt, null);
		return result;
	}
	   
	
	// 이미 담겨있는 상품인지 확인하기
	public boolean duplGoods(Connection conn, Cart cart) throws Exception {
		boolean result = false;
		String sql = "SELECT goods_code goodsCode"
				+ " FROM cart"
				+ " WHERE customer_id = ? AND goods_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, cart.getCustomerId());
		stmt.setInt(2, cart.getGoodsCode());
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			result = true;
		}
		DBUtil.close(rs, stmt, null);
		return result;
	}
	
	// 담겨있는 상품 수량변경하기
	public int updateGoodsQuantity(Connection conn, Cart cart) throws Exception {
		int row = 0;
		String sql = "UPDATE cart SET cart_quantity = cart_quantity + ?"
				+ " WHERE customer_id = ? AND goods_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, cart.getCartQuantity());
		stmt.setString(2, cart.getCustomerId());
		stmt.setInt(3, cart.getGoodsCode());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	public int updateCartsQuantity(Connection conn, Cart cart) throws Exception {
		int row = 0;
		String sql = "UPDATE cart SEt cart_quantity=? WHERE customer_id=? AND goods_code=?";
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
		DBUtil.close(null, stmt, null);
		return row;
	}
	
	// 장바구니 전체 삭제
	public int deleteCartList(Connection conn, String customerId) throws Exception {
		int row = 0;
		String sql = "DELETE FROM cart WHERE customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customerId);
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	
	// 최종적으로 결제하기 전 주문리스트
	public ArrayList<HashMap<String, Object>> selectCartList(Connection conn, String customerId, int[] goodsCode) throws Exception {
		ArrayList<HashMap<String, Object>> list= new ArrayList<HashMap<String, Object>>();
		String sql = "SELECT c.goods_code goodsCode"
				+ "			, g.goods_name goodsName"
				+ "			, g.goods_price goodsPrice"
				+ "			, c.customer_id customerId"
				+ "			, c.cart_quantity cartQuantity"
				+ "			, c.createdate"
				+ "		FROM cart c"
				+ "		INNER JOIN goods g"
				+ "		ON c.goods_code = g.goods_code"
				+ "		WHERE c.customer_id = ?"
				+ "		AND c.goods_code = ?";
		String sqlWhere = " OR c.goods_code=?";
		for(int i=0; i<goodsCode.length-1; i++) {
			sql+=sqlWhere;
		}
		System.out.println(sql);
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customerId);
		for(int i=0; i<goodsCode.length; i++) {
			stmt.setInt(i+2, goodsCode[i]);
			System.out.println(i+2+","+ goodsCode[i]);
		}
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("goodsCode", rs.getInt("goodsCode"));
			map.put("goodsName", rs.getString("goodsName"));
			map.put("goodsPrice", rs.getInt("goodsPrice"));
			map.put("customerId", rs.getString("customerId"));
			map.put("cartQuantity", rs.getInt("cartQuantity"));
			map.put("createdate", rs.getString("createdate"));
			list.add(map);
		}
		DBUtil.close(rs, stmt, null);
		return list;
	}
	
	// 재고조회
	public int getGoodsStock(Connection conn, int goodsCode) throws Exception {
		int stock = 0;
		String sql = "SELECT goods_stock goodsStock FROM goods WHERE goods_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, goodsCode);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			stock = rs.getInt("goodsStock");
		}
		DBUtil.close(rs, stmt, null);
		return stock;
	}
}
