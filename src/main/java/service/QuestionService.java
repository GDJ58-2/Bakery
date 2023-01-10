package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.QuestionDao;
import util.DBUtil;
import vo.Question;

public class QuestionService {
	private QuestionDao questionDao;
	// GET
	// 리스트
	public ArrayList<Question> getQuestionList() {
		ArrayList<Question> list = null;
		this.questionDao = new QuestionDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			list = questionDao.selectQuestionList(conn);
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
				DBUtil.close(null, null, conn); // db 자원반납
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	// 상세정보
	public Question getQuestionOne(int questionCode) {
		Question question = null;
		this.questionDao = new QuestionDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			question = questionDao.selectQuestionOne(conn, questionCode);
			conn.commit();
		} catch (Exception e) {
			e.printStackTrace();
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				DBUtil.close(null, null, conn); // db자원 반납
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return question;
	}
	
	// ADD
	public int addQuestion(Question question) {
		int row = 0;
		this.questionDao = new QuestionDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = questionDao.insertQuestion(conn, question);
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
				DBUtil.close(null, null, conn); // db자원 반납
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	// MODIFY
	public int modifyQuestion(Question question) {
		int row = 0;
		this.questionDao = new QuestionDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = questionDao.updateQuestion(conn, question);
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
				DBUtil.close(null, null, conn); // db자원 반납
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	// REMOVE
	public int removeQuestion(int questionCode) {
		int row = 0;
		this.questionDao = new QuestionDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = questionDao.deleteQuestion(conn, questionCode);
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
				DBUtil.close(null, null, conn); // db자원 반납
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return row;
	}
}
