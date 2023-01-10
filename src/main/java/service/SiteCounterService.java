package service;

import java.sql.Connection;
import java.sql.SQLException;

import dao.SiteCounterDao;
import util.DBUtil;

public class SiteCounterService {
	private SiteCounterDao siteCounterDao;
	
	// GET
	// 오늘 접속자 수
	public int getTodayCount() {
		int todayCount = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			
			siteCounterDao = new SiteCounterDao();
			todayCount = siteCounterDao.selectTodayCount(conn);
			conn.commit();
		} catch(Exception e) {
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
		return todayCount;
	}
	
	// ADD
	// 전체 접속자 수
	public int getTotalCount() {
		int totalCount = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			
			siteCounterDao = new SiteCounterDao();
			totalCount = siteCounterDao.selectTotalCount(conn);
			conn.commit();
		} catch(Exception e) {
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
		return totalCount;
	}
	
	// ADD
	// 오늘 첫번째 처음 접속자가 발생 ADD : getTodayCount() 호출의 결과가 0일 때
	public int addCount() {
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			
			siteCounterDao = new SiteCounterDao();
			row = siteCounterDao.insertCount(conn);
			conn.commit();
		} catch(Exception e) {
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
	
	// MODIFY
	// 오늘 첫번째 접속자가 아닐때 MODIFY : getTodayCount() 호출의 결과가 0이 아닐 때
	public int modifyCount() {
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			
			siteCounterDao = new SiteCounterDao();
			row = siteCounterDao.updateCount(conn);
			conn.commit();
		} catch(Exception e) {
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
}
