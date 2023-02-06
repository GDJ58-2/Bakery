package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import dao.CustomerDao;
import dao.PointHistoryDao;
import util.DBUtil;
import vo.Customer;
import vo.PointHistory;

public class PointHistoryService {
	private PointHistoryDao pointHistoryDao;
	private CustomerDao customerDao;
	
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
	
	// 총 포인트 계산 
	public int totalPoint(String customerId) {
		this.pointHistoryDao = new PointHistoryDao();
		this.customerDao = new CustomerDao();
		String pKind = null;
		int plusPoint = 0;
		int minusPoint = 0;
		int totalPoint = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			// 포인트 내역 출력
			ArrayList<HashMap<String, Object>> pHistory = pointHistoryDao.selectPointHistory(conn, customerId);
			for(HashMap<String, Object> map : pHistory) { // 적립 -> + , 사용 -> -
				pKind = (String)map.get("pointKind");
				if(pKind.equals("적립")) {
					plusPoint = (int)map.get("point");
					minusPoint = 0;
				} else {
					minusPoint = (int)map.get("point");
					plusPoint = 0;
				}
				totalPoint = totalPoint + (plusPoint - minusPoint);
			}
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
		return totalPoint;
	}

	// insert
	public int addPointHistory(String customerId, PointHistory point) {
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.pointHistoryDao = new PointHistoryDao();
			row = pointHistoryDao.insertPoint(conn, point);
			
			// 내역 추가 시 customer 테이블 point 컬럼값도 변경
			int totalPoint = this.totalPoint(customerId);
			System.out.println(totalPoint+"<-- totalPoint PointHistoryService");
			if(row==1) {
				Customer customerPoint = new Customer();
				customerPoint.setCustomerId(customerId);
				customerPoint.setPoint(totalPoint);
				customerDao.customerPoint(conn, customerPoint); 
			}
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
		return row; // point_history 에 insert row 리턴
	}
	
	// delete 
	public int removePointHistory(String customerId, int orderCode) {
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.pointHistoryDao = new PointHistoryDao();
			row = pointHistoryDao.deletePoint(conn, orderCode); // 포인트 내역 삭제
			
			// 내역 삭제 시 customer 테이블 point 컬럼값도 변경
			int totalPoint = this.totalPoint(customerId);
			System.out.println(totalPoint+"<-- totalPoint PointHistoryService");
			if(row==1) {
				Customer customerPoint = new Customer();
				customerPoint.setCustomerId(customerId);
				customerPoint.setPoint(totalPoint);
				customerDao.customerPoint(conn, customerPoint); 
			}
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
		return row; // point_history 에 delete row 리턴 --> 구매확정 시 취소불가, 취소 시 구매확정 불가 설정으로 row는 2가 리턴될 수 없음.
	}
}
