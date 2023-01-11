package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import dao.PointHistoryDao;
import util.DBUtil;

public class PointHistoryService {
	private PointHistoryDao pointHistoryDao;
	
	// SELECT
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
