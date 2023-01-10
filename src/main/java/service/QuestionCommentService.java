package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.QuestionCommentDao;
import util.DBUtil;
import vo.QuestionComment;

public class QuestionCommentService {
	private QuestionCommentDao questionCommentDao;
	public int addComment(QuestionComment qc) { // comment 추가
		int row = 0;
		this.questionCommentDao = new QuestionCommentDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = questionCommentDao.insertComment(conn, qc);
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
	public int modifyComment(QuestionComment qc) { // comment 수정
		int row = 0;
		this.questionCommentDao = new QuestionCommentDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = questionCommentDao.updateComment(conn, qc);
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
	public int removeComment(int commentCode) { // comment 삭제
		int row = 0;
		this.questionCommentDao = new QuestionCommentDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = questionCommentDao.deleteComment(conn, commentCode);
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
	public ArrayList<QuestionComment> getCommentList(int questionCode) { // comment 출력
		ArrayList<QuestionComment> list = null;
		this.questionCommentDao = new QuestionCommentDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			list = questionCommentDao.selectCommentList(conn, questionCode);
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