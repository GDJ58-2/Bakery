package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import dao.EmpDao;
import dao.NoticeDao;
import util.DBUtil;
import vo.Notice;

public class NoticeService {
	private NoticeDao noticeDao;
	// add
	public HashMap<String, Object> addNotice(Notice notice) { 
		HashMap<String, Object> map = null;
		this.noticeDao = new NoticeDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			map = noticeDao.insertNotice(conn, notice);
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
		return map;
	}
	
	// modify
	public int modifyNotice(Notice notice) { 
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
	
	// remove
	public int removeNotice(int noticeCode) { 
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
	
	// 상세보기
	public HashMap<String, Object> getNoticeOne(int rownum, String search) { // modifyNotice form
		HashMap<String, Object> map = null;
		this.noticeDao = new NoticeDao();
		Connection conn = null;
		if(search==null) {
			search="";
		}
		try {
			conn = DBUtil.getConnection();
			map = noticeDao.selectNoticeOne(conn, rownum, search);
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
		return map;
	}
	
	// list 출력
	public ArrayList<HashMap<String, Object>> getNoticeList(String search, int currentPage, int rowPerPage) { 
		ArrayList<HashMap<String, Object>> list = null;
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
	
	// 페이징 - 전체 행수
	public int getNoticeCount(String search) {
		int count = 0;
		this.noticeDao = new NoticeDao();
		Connection conn = null;
		if(search==null) {
			search = "";
		}
		try {
			conn = DBUtil.getConnection();
			count = noticeDao.selectNoticeCount(conn, search);
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
		return count;
	}
}