package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import util.DBUtil;
import vo.Question;

public class QuestionDao {
	// SELECT
	// 리스트
	public ArrayList<HashMap<String, Object>> selectQuestionList(Connection conn, String customerId) throws Exception {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		String sql = "SELECT q.question_code questionCode, q.category category, q.question_memo questionMemo, q.createdate, qc.comment_code commentCode, o.customer_id customerId, o.order_state orderState, o.order_code orderCode"
				+ "		FROM question q"
				+ "	LEFT JOIN question_comment qc"
				+ "		ON q.question_code=qc.question_code"
				+ "		INNER JOIN orders o"
				+ "		WHERE o.customer_id LIKE ?"	
				+ "		GROUP BY q.question_code "
				+ "		ORDER BY qc.createdate ASC, q.createdate DESC";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customerId);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("questionCode", rs.getInt("questionCode"));
			map.put("category", rs.getString("category"));
			map.put("questionMemo", rs.getString("questionMemo"));
			map.put("createdate", rs.getString("createdate"));
			map.put("commentCode", rs.getInt("commentCode"));
			map.put("customerId", rs.getString("customerId"));
			map.put("orderState", rs.getString("orderState"));
			map.put("orderCode", rs.getInt("orderCode"));
			list.add(map);
		}
		DBUtil.close(rs, stmt, null);
		return list;
	}
	
	// 상세정보
	public Question selectQuestionOne(Connection conn, int questionCode) throws Exception {
		Question question = null;
		String sql = "SELECT question_code questionCode, order_code orderCode, category, question_memo questionMemo, createdate FROM question WHERE question_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, questionCode);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			question = new Question();
			question.setQuestionCode(rs.getInt("questionCode"));
			question.setOrderCode(rs.getInt("orderCode"));
			question.setCategory(rs.getString("category"));
			question.setQuestionMemo(rs.getString("questionMemo"));
			question.setCreatedate(rs.getString("createdate"));
		}
		DBUtil.close(rs, stmt, null);
		return question;
	}
	
	//INSERT
	public int insertQuestion(Connection conn, Question question) throws Exception {
		int row = 0;
		String sql = "INSERT into question(order_code, category, question_memo, createdate) VALUES(?, ?, ?, NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, question.getOrderCode());
		stmt.setString(2, question.getCategory());
		stmt.setString(3, question.getQuestionMemo());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	
	// UPDATE
	public int updateQuestion(Connection conn, Question question) throws Exception {
		int row = 0;
		String sql = "UPDATE question SET order_code = ?, category = ?, question_memo = ? WHERE question_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, question.getOrderCode());
		stmt.setString(2, question.getCategory());
		stmt.setString(3, question.getQuestionMemo());
		stmt.setInt(4, question.getQuestionCode());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	
	// DELETE
	public int deleteQuestion(Connection conn, int questionCode) throws Exception {
		int row = 0;
		String sql = "DELETE FROM question WHERE question_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, questionCode);
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	
	// 문의가능 주문목록 불러오기
		public ArrayList<HashMap<String, Object>> ordersCodeList(Connection conn, String customerId) throws Exception {
			ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
			HashMap<String, Object> map = null;
			String sql = "SELECT o.order_code orderCode"
					+ ", o.goods_code goodsCode"
					+ ", o.order_quantity orderQuantity"
					+ ", g.goods_name goodsName"
					+ " FROM orders o"
					+ " INNER JOIN goods g"
					+ " ON o.goods_code = g.goods_code"
					+ " WHERE order_state = '결제' OR order_state = '배송중' AND customer_id = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, customerId);
			ResultSet rs = stmt.executeQuery();
			while(rs.next()) {
				map = new HashMap<String, Object>();
				map.put("orderCode", rs.getInt("orderCode"));
				map.put("goodsCode", rs.getInt("goodsCode"));
				map.put("orderQuantity", rs.getInt("orderQuantity"));
				map.put("goodsName", rs.getString("goodsName"));
				list.add(map);
			}
			DBUtil.close(rs, stmt, null);
			return list;
		}
}