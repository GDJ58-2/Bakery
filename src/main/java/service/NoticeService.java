package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.NoticeDao;
import util.DBUtil;
import vo.Notice;

public class NoticeService {
	private NoticeDao noticeDao;
	public int addNotice(Notice notice) { // notice 추가
		int row = 0;
		this.noticeDao = new NoticeDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = noticeDao.insertNotice(conn, notice);
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
	public int modifyNotice(Notice notice) { // notice 수정
		int row = 0;
		this.noticeDao = new NoticeDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = noticeDao.updateNotice(conn, notice);
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
	public int removeNotice(int noticeCode) { // notice 삭제
		int row = 0;
		this.noticeDao = new NoticeDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = noticeDao.deleteNotice(conn, noticeCode);
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
	public Notice getNoticeOne(int noticeCode) { // modifyNotice form
		Notice notice = null;
		this.noticeDao = new NoticeDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			notice = noticeDao.selectNoticeOne(conn, noticeCode);
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
		return notice;
	}
	public ArrayList<Notice> getNoticeList(String search, int currentPage, int rowPerPage) { // noticeList 출력
		ArrayList<Notice> list = null;
		this.noticeDao = new NoticeDao();
		Connection conn = null;
		if(search==null) {
			search="";
		}
		int beginRow = (currentPage-1)*rowPerPage;
		/*
		System.out.println(beginRow);
		System.out.println(currentPage);
		System.out.println(rowPerPage);
		*/
		try {
			conn = DBUtil.getConnection();
			list = noticeDao.selectNoticeList(conn, search, beginRow, rowPerPage);
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
}