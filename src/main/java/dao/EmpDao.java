package dao;

import java.sql.*;
import java.util.ArrayList;

import util.DBUtil;
import vo.Emp;

public class EmpDao { // outId 검사?
	public int insertEmp(Connection conn, Emp emp) throws Exception { // addEmp
		int row = 0;
		String sql = "INSERT INTO emp(emp_id, emp_pw, emp_name, active, auth_code, createdate) VALUES(?,PASSWORD(?),?,?,?,NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, emp.getEmpId());
		stmt.setString(2, emp.getEmpPw());
		stmt.setString(3, emp.getEmpName());
		stmt.setString(3, "N"); // 기본값 N
		stmt.setInt(4, 0); 		// 기본값 0
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	public int updateEmpPw(Connection conn, Emp emp) throws SQLException { // modifyEmpPw
		int row = 0;
		String sql = "UPDATE emp SET emp_pw = PASSWORD(?) WHERE emp_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, emp.getEmpPw());
		stmt.setString(2, emp.getEmpId());
		row = stmt.executeUpdate();
		return row;
	}
	public int updateEmpByAdmin(Connection conn, Emp emp) throws SQLException { // empList modifyEmpForm
		int row = 0;
		String sql = "UPDATE emp SET active=?, auth_code=? WHERE emp_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, emp.getActive());
		stmt.setInt(2, emp.getAuthCode());
		stmt.setString(3, emp.getEmpId());
		return row;
	}
	// ----------페이징, 정렬
	public ArrayList<Emp> selectEmpListByAdmin(Connection conn) throws SQLException{ // empList
		ArrayList<Emp> list = new ArrayList<Emp>();
		String sql = "SELECT emp_code empCode, emp_id empId, emp_name empName, active, auth_code authCode, createdate FROM emp";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Emp emp = new Emp(rs.getInt("empCode"),rs.getString("empId"),null,rs.getString("empName"),rs.getString("active"),rs.getInt("authCode"),rs.getString("createdate"));
			list.add(emp);
		}
		return list;
	}
}