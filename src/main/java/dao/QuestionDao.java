package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBUtil;
import vo.Question;

public class QuestionDao {
	// SELECT
	// 리스트
	public ArrayList<Question> selectQuestionList(Connection conn) throws Exception {
		ArrayList<Question> list = new ArrayList<Question>();
		String sql = "SELECT question_code questionCode, order_code orderCode, category, question_memo questionMemo, createdate FROM question";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Question question = new Question();
			question.setQuestionCode(rs.getInt("questionCode"));
			question.setOrderCode(rs.getInt("orderCode"));
			question.setCategory(rs.getString("category"));
			question.setQuestionMemo(rs.getString("questionMemo"));
			question.setCreatedate(rs.getString("createdate"));
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
}