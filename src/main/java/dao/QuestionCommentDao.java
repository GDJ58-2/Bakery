package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBUtil;
import vo.QuestionComment;


public class QuestionCommentDao {
	public int insertComment(Connection conn, QuestionComment qc) throws Exception { // addQuestionComment
		int row = 0;
		String sql = "INSERT INTO question_comment(question_code,comment_memo,createdate) VALUES(?,?,NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, qc.getQuestionCode());
		stmt.setString(2, qc.getCommentMemo());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	public int updateComment(Connection conn, QuestionComment qc) throws Exception { // modifyQuestionComment
		int row = 0;
		String sql = "UPDATE question_comment SET comment_memo=? WHERE comment_code=? AND question_code=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, qc.getCommentMemo());
		stmt.setInt(2, qc.getCommentCode());
		stmt.setInt(3, qc.getQuestionCode());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	public int deleteComment(Connection conn, int commentCode) throws Exception { // removeQuestionComment
		int row = 0;
		String sql = "DELETE FROM question_comment WHERE comment_code=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, commentCode);
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	public int selectCommentCount(Connection conn, int questionCode) throws Exception {
		int count = 0;
		String sql = "SELECT COUNT(*) count FROM question_comment WHERE question_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, questionCode);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			count = rs.getInt("count");
		}
		return count;
	}
	public ArrayList<QuestionComment> selectCommentList(Connection conn, int questionCode) throws Exception { // commentList
		ArrayList<QuestionComment> list = new ArrayList<QuestionComment>();
		String sql = "SELECT question_code questionCode, comment_code commentCode, comment_memo commentMemo, createdate FROM question_comment WHERE question_code=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, questionCode);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			QuestionComment qc = new QuestionComment();
			qc.setCommentCode(rs.getInt("commentCode"));
			qc.setQuestionCode(rs.getInt("questionCode"));
			qc.setCommentMemo(rs.getString("commentMemo"));
			qc.setCreatedate(rs.getString("createdate"));
			list.add(qc);
		}
		DBUtil.close(rs, stmt, null);
		return list;
	}
}
