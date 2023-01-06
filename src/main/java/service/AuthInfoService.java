package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.AuthInfoDao;
import util.DBUtil;
import vo.AuthInfo;

public class AuthInfoService {
	private AuthInfoDao authInfoDao;
	public int addAuthInfo(AuthInfo authInfo) { // authInfo 추가
		int row = 0;
		this.authInfoDao = new AuthInfoDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = authInfoDao.insertAuthInfo(conn, authInfo);
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
	public int modifyAuthInfo(AuthInfo authInfo) { // authInfo 수정
		int row = 0;
		this.authInfoDao = new AuthInfoDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = authInfoDao.updateAuthInfo(conn, authInfo);
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
	public int removeAuthInfo(int authCode) { // authInfo 삭제
		int row = 0;
		this.authInfoDao = new AuthInfoDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = authInfoDao.deleteAuthInfo(conn, authCode);
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
	public AuthInfo getAuthInfoOne(int authCode) { // modifyAuthInfo form 
		AuthInfo authInfo = null;
		this.authInfoDao = new AuthInfoDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			authInfo = authInfoDao.selectAuthInfoOne(conn, authCode);
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
		return authInfo;
	}
	public ArrayList<AuthInfo> getAuthInfoList() { // authInfoList 출력
		ArrayList<AuthInfo> list = null;
		this.authInfoDao = new AuthInfoDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			list = authInfoDao.selectAuthInfoList(conn);
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
