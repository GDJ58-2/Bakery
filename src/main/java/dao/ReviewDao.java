package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import vo.Review;
import vo.Orders;
import util.DBUtil;

public class ReviewDao {
	
	// 상품목록에 띄울 리뷰
	public ArrayList<HashMap<String, Object>> reviewList(Connection conn, int goodsCode) throws Exception {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		String sql = "SELECT r.review_memo reviewMemo"
				+ ", o.customer_id customerId"
				+ ", g.goods_name goodsName"
				+ " FROM review r"
				+ " INNER JOIN orders o"
				+ " ON r.order_code = o.order_code"
				+ " INNER JOIN goods g"
				+ " ON o.goods_code = g.goods_code"
				+ " WHERE g.goods_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, goodsCode);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("reviewMemo", rs.getString("reviewMemo"));
			m.put("goodsName", rs.getString("goodsName"));
			m.put("customerId", rs.getString("customerId"));
			list.add(m);
		}
		DBUtil.close(rs, stmt, null);
		return list;		
	}
	
	// 리뷰글 불러오기
	public ArrayList<HashMap<String, Object>> customerReviewList(Connection conn, String customerId) throws Exception {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		String sql = "SELECT r.order_code orderCode"
				+ ", r.review_memo reviewMemo"
				+ ", g.goods_name goodsName"
				+ " FROM review r"
				+ " INNER JOIN orders o"
				+ " ON r.order_code = o.order_code"
				+ " INNER JOIN goods g"
				+ " ON o.goods_code = g.goods_code"
				+ " WHERE o.customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customerId);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("orderCode", rs.getInt("orderCode"));
			m.put("reviewMemo", rs.getString("reviewMemo"));
			m.put("goodsName", rs.getString("goodsName"));
			list.add(m);
		}
		DBUtil.close(rs, stmt, null);
		return list;		
	}
	
	// 특정 주문정보 불러오기
	public HashMap<String, Object> orderReview(Connection conn, Orders orders) throws Exception {
		HashMap<String, Object> map = null;
		String sql = "SELECT o.order_code orderCode"
				+ ", g.goods_name goodsName"
				+ " FROM orders o"
				+ " INNER JOIN goods g"
				+ " ON o.goods_code = g.goods_code"
				+ " WHERE o.customer_id = ?"
				+ " AND o.order_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, orders.getCustomerId());
		stmt.setInt(2, orders.getOrderCode());
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			map = new HashMap<String, Object>();
			map.put("orderCode", rs.getInt("orderCode"));
			map.put("goodsName", rs.getString("goodsName"));
		}
		DBUtil.close(rs, stmt, null);
		return map;		
	}
	
	
	
	// 특정 리뷰글 불러오기
	public HashMap<String, Object> reviewListOne(Connection conn, Orders orders) throws Exception {
		HashMap<String, Object> map = null;
		String sql = "SELECT r.order_code orderCode"
				+ ", r.review_memo reviewMemo"
				+ ", g.goods_name goodsName"
				+ " FROM review r"
				+ " INNER JOIN orders o"
				+ " ON r.order_code = o.order_code"
				+ " INNER JOIN goods g"
				+ " ON o.goods_code = g.goods_code"
				+ " WHERE o.customer_id = ?"
				+ " AND r.order_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, orders.getCustomerId());
		stmt.setInt(2, orders.getOrderCode());
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			map = new HashMap<String, Object>();
			map.put("orderCode", rs.getInt("orderCode"));
			map.put("reviewMemo", rs.getString("reviewMemo"));
			map.put("goodsName", rs.getString("goodsName"));
		}
		DBUtil.close(rs, stmt, null);
		return map;		
	}
	
	// 리뷰글 작성
	public int insertReview(Connection conn, Review review) throws Exception {
		int row = 0;
		String sql = "INSERT INTO review ("
				+ "order_code, review_memo, createdate"
				+ ") VALUES (?, ?, NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, review.getOrderCode());
		stmt.setString(2, review.getReviewMemo());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	
	// 구매확정목록 불러오기
	public ArrayList<HashMap<String, Object>> noReviewList(Connection conn, String customerId) throws Exception {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		String sql = "SELECT o.order_code orderCode"
				+ ", g.goods_name goodsName"
				+ " FROM orders o"
				+ " INNER JOIN goods g"
				+ " ON o.goods_code = g.goods_code"
				+ " LEFT OUTER JOIN review r"
				+ " ON o.order_code = r.order_code"
				+ " WHERE o.customer_id = ?"
				+ " AND o.order_state = '구매확정'"
				+ " AND r.order_code IS NULL";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customerId);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("orderCode", rs.getInt("orderCode"));
			m.put("goodsName", rs.getString("goodsName"));
			list.add(m);
		}
		DBUtil.close(rs, stmt, null);
		return list;		
	}
	
	// 리뷰 수정
	public int updateReviewList(Connection conn, Review review) throws Exception {
		int row = 0;
		String sql = "UPDATE review SET review_memo = ?"
				+ " WHERE order_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, review.getReviewMemo());
		stmt.setInt(2, review.getOrderCode());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	
	// 리뷰 삭제
	public int deleteReviewList(Connection conn, int orderCode) throws Exception {
		int row = 0;
		String sql = "DELETE from review WHERE order_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, orderCode);
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
}
