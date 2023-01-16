package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import util.DBUtil;
import vo.Emp;

public class EmpDao { 
	// login
	public Emp selectIdPwByEmp(Connection conn, Emp paramEmp) throws Exception {
		Emp returnEmp = null;
		String sql = "SELECT emp_code empCode, emp_id empId, emp_name empName, auth_code authCode, active FROM emp WHERE emp_id=? AND emp_pw = PASSWORD(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, paramEmp.getEmpId());
		stmt.setString(2, paramEmp.getEmpPw());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			returnEmp = new Emp(rs.getInt("empCode"),rs.getString("empId"),null,rs.getString("empName"),rs.getString("active"),rs.getInt("authCode"),null);
		}
		DBUtil.close(rs, stmt, null);
		return returnEmp;
	}
	
	// insert
	public int insertEmp(Connection conn, Emp emp) throws Exception { // addEmp
		int row = 0;
		String sql = "INSERT INTO emp(emp_id, emp_pw, emp_name, active, auth_code, createdate) VALUES(?,PASSWORD(?),?,?,?,NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, emp.getEmpId());
		stmt.setString(2, emp.getEmpPw());
		stmt.setString(3, emp.getEmpName());
		stmt.setString(4, "N"); // 기본값 N
		stmt.setInt(5, 0); 		// 기본값 0
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}

	// id 중복 검사
	public boolean selectId(Connection conn, String empId) throws Exception { 
		boolean check = false;
		String sql = "SELECT t.userId"
				+ "		FROM("
				+ "			SELECT customer_id userId FROM customer UNION"
				+ "			SELECT emp_id userId FROM emp UNION"
				+ "			SELECT id userId FROM outid) t"
				+ "		WHERE userId = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, empId);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) { // 사용 불가 -> true
			check = true;
		}
		System.out.print(check);
		DBUtil.close(rs, stmt, null);
		return check;
	}
	
	// UPDATE 
	public int updateEmpPw(Connection conn, HashMap<String, Object> map) throws Exception { 
		int row = 0;
		String sql = "UPDATE emp SET emp_pw = PASSWORD(?) WHERE emp_id = ? AND emp_pw = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, (String)map.get("newEmpPw"));
		stmt.setString(2, (String)map.get("empId"));
		stmt.setString(3, (String)map.get("empPw"));
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	
	public int updateEmpByAdmin(Connection conn, Emp emp) throws Exception { // modifyEmp
		int row = 0;
		String sql = "UPDATE emp SET active=?, auth_code=? WHERE emp_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, emp.getActive());
		stmt.setInt(2, emp.getAuthCode());
		stmt.setString(3, emp.getEmpId());
		row=stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	
	// 상세보기
	public Emp selectEmpOne(Connection conn, int empCode) throws Exception { 
		Emp emp = null;
		String sql = "SELECT emp_code empCode, emp_id empId, emp_name empName, active, auth_code authCode, createdate FROM emp WHERE emp_code=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, empCode);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			emp = new Emp(rs.getInt("empCode"),rs.getString("empId"),null,rs.getString("empName"),rs.getString("active"),rs.getInt("authCode"),rs.getString("createdate"));
		}
		DBUtil.close(rs, stmt, null);
		return emp;
	}
	
	// empList 
	public ArrayList<HashMap<String, Object>> selectEmpListByAdmin(Connection conn) throws Exception { 
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		String sql = "SELECT e.emp_code empCode, e.emp_id empId, e.emp_name empName, e.active, a.auth_code authCode, a.auth_memo authMemo, e.createdate FROM emp e INNER JOIN auth_info a ON e.auth_code=a.auth_code ORDER BY active ASC, e.auth_code DESC";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("empCode", rs.getInt("empCode"));
			map.put("empId", rs.getString("empId"));
			map.put("empName", rs.getString("empName"));
			map.put("active", rs.getString("active"));
			map.put("authCode", rs.getInt("authCode"));
			map.put("authMemo", rs.getString("authMemo"));
			map.put("createdate", rs.getString("createdate"));
			list.add(map);
		}
		DBUtil.close(rs, stmt, null);
		return list;
	}
}