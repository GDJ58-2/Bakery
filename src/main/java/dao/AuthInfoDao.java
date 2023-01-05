package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBUtil;
import vo.AuthInfo;

public class AuthInfoDao {
	public int insertAuthInfo(Connection conn, AuthInfo authInfo) throws Exception { // addAuthInfo
		int row = 0;
		String sql = "INSERT INTO auth_info(auth_code, auth_memo, createdate) VALUES(?,?,NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, authInfo.getAuthCode());
		stmt.setString(2, authInfo.getAuthMemo());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	public int updateAuthInfo(Connection conn, AuthInfo authInfo) throws Exception { // modifyAuthInfo
		int row = 0;
		String sql = "UPDATE auth_info SET auth_memo = ? WHERE auth_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, authInfo.getAuthMemo());
		stmt.setInt(2, authInfo.getAuthCode());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	public int deleteAuthInfo(Connection conn, int authCode) throws Exception { // removeAuthInfo
		int row = 0;
		String sql = "DELETE FROM auth_info WHERE auth_code=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, authCode);
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	public AuthInfo selectAuthInfoOne(Connection conn, int authCode) throws Exception { // modifyAuthInfo form
		AuthInfo authInfo = null;
		String sql = "SELECT auth_code authCode, auth_memo authMemo, createdate FROM auth_info WHERE auth_code=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, authCode);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			authInfo = new AuthInfo(rs.getInt("authCode"),rs.getString("authMemo"),rs.getString("createdate"));
		}
		DBUtil.close(rs, stmt, null);
		return authInfo;
	}
	public ArrayList<AuthInfo> selectAuthInfoList(Connection conn) throws Exception { // authInfoList, modifyEmpByAdmin Form
		ArrayList<AuthInfo> list = new ArrayList<AuthInfo>();
		String sql = "SELECT auth_code authCode, auth_memo authMemo, createdate FROM auth_info ORDER BY auth_code ASC";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			AuthInfo autoInfo = new AuthInfo(rs.getInt("authCode"),rs.getString("authMemo"),rs.getString("createdate"));
			list.add(autoInfo);
		}
		DBUtil.close(rs, stmt, null);
		return list;
	}
}