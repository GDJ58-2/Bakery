package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import dao.PointHistoryDao;
import util.DBUtil;
import vo.PointHistory;

public class PointHistoryService {
	private PointHistoryDao pointHistoryDao;
	
	// SELECT
	// 페이징 전체 포인트 내역 개수
	public int getPointHistoryCount() {
		int count = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			
			this.pointHistoryDao = new PointHistoryDao();
			count = pointHistoryDao.selectPointHistoryCount(conn);
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
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return count;	
	}
	
	// 포인트 내역 조회
	public ArrayList<HashMap<String, Object>> getPointHistoryByPage(String customerId, int beginRow, int rowPerPage) {
		ArrayList<HashMap<String, Object>> list = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.pointHistoryDao = new PointHistoryDao();
			list = pointHistoryDao.selectPointHistoryByPage(conn, customerId, beginRow, rowPerPage);
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
		return list;
	}
	
	// 포인트 내역 조회
	public ArrayList<HashMap<String, Object>> getPointHistory(String customerId) {
		ArrayList<HashMap<String, Object>> list = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.pointHistoryDao = new PointHistoryDao();
			list = pointHistoryDao.selectPointHistory(conn, customerId);
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
		return list;
	}
}
