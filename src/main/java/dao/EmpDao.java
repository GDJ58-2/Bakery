package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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

	// UPDATE 
	public int updateEmpPw(Connection conn, HashMap<String, Object> map) throws Exception { 
		int row = 0;
		String sql = "UPDATE emp SET emp_pw = PASSWORD(?) WHERE emp_code = ? AND emp_pw = PASSWORD(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, (String)map.get("newEmpPw"));
		stmt.setString(2, (String)map.get("empCode"));
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
	public ArrayList<HashMap<String, Object>> selectEmpListByAdmin(Connection conn, int beginRow, int rowPerPage, String search) throws Exception { 
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		String sql = "SELECT e.emp_code empCode, e.emp_id empId, e.emp_name empName, e.active, a.auth_code authCode, a.auth_memo authMemo, e.createdate"
				+ "		FROM emp e "
				+ "		INNER JOIN auth_info a"
				+ "		ON e.auth_code=a.auth_code "
				+ "		WHERE e.emp_name LIKE ?"
				+ "		ORDER BY active ASC, e.auth_code DESC"
				+ "		LIMIT ?,?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%"+search+"%");
		stmt.setInt(2, beginRow);
		stmt.setInt(3, rowPerPage);
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
	
	// 페이징 - 전체 행 수 
	public int selectEmpCount(Connection conn, String search) throws Exception {
		int count = 0;
		String sql = "SELECT COUNT(*) count FROM emp WHERE emp_name LIKE ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%"+search+"%");
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			count = rs.getInt("count");
		}
		DBUtil.close(rs, stmt, null);
		return count;
	}
	
	// 월별 매출
	public ArrayList<HashMap<String, Object>> selectMonthStats(Connection conn, String year) throws Exception {
		ArrayList<HashMap<String, Object>> list=new ArrayList<HashMap<String, Object>>();
		String sql="SELECT MONTH(createdate) month, SUM(order_price) price"
				+ " from orders"
				+ " WHERE YEAR(createdate) Like ?"
				+ " GROUP BY MONTH(createdate)"
				+ " ORDER BY MONTH(createdate) ASC";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%"+year+"%");
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("month", rs.getInt("month"));
			map.put("price", rs.getString("price"));
			list.add(map);
		}
		DBUtil.close(rs, stmt, null);
		return list;
	}
	
	// 연도별 매출
	public ArrayList<HashMap<String, Object>> selectYearStats(Connection conn) throws Exception {
		ArrayList<HashMap<String, Object>> list=new ArrayList<HashMap<String, Object>>();
		String sql="SELECT YEAR(createdate) year, SUM(order_price) price"
				+ " from orders"
				+ " GROUP BY year"
				+ " ORDER BY year ASC LIMIT 0, 5";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("year", rs.getInt("year"));
			map.put("price", rs.getString("price"));
			list.add(map);
		}
		DBUtil.close(rs, stmt, null);
		return list;
	}
	
	// 월별 상품랭킹
	public ArrayList<HashMap<String, Object>> selectProductRankingMonth(Connection conn, String year, String month) throws Exception {
		ArrayList<HashMap<String, Object>> list=new ArrayList<HashMap<String, Object>>();
		String sql="SELECT SUM(o.order_quantity) goodsCount"
				+ ", SUM(o.order_price) price"
				+ ", g.goods_name goodsName"
				+ " FROM orders o"
				+ " INNER JOIN goods g"
				+ " ON o.goods_code = g.goods_code"
				+ " WHERE YEAR(o.createdate) Like ? AND MONTH(o.createdate) Like ?"
				+ " GROUP BY MONTH(o.createdate), o.goods_code"
				+ " ORDER BY goodsCount DESC LIMIT 0, 5";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%"+year+"%");
		stmt.setString(2, "%"+month+"%");
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("goodsCount", rs.getInt("goodsCount"));
			map.put("price", rs.getString("price"));
			map.put("goodsName", rs.getString("goodsName"));
			list.add(map);
		}
		DBUtil.close(rs, stmt, null);
		return list;
	}
	
	// 연도별 카테고리 랭킹
	public ArrayList<HashMap<String, Object>> selectProductRankingCategory(Connection conn, String year, String categoryNo) throws Exception {
		ArrayList<HashMap<String, Object>> list=new ArrayList<HashMap<String, Object>>();
		String sql="SELECT SUM(o.order_quantity) goodsCount"
				+ ", SUM(o.order_price) price"
				+ ", g.goods_name goodsName"
				+ ", c.category_name categoryName"
				+ " FROM orders o"
				+ " INNER JOIN goods g"
				+ " ON o.goods_code = g.goods_code"
				+ " INNER JOIN goods_category c"
				+ " ON g.category_no = c.category_no"
				+ " WHERE YEAR(o.createdate) Like ? AND g.category_no Like ?"
				+ " GROUP BY MONTH(o.createdate), o.goods_code"
				+ " ORDER BY goodsCount DESC LIMIT 0, 5";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%"+year+"%");
		stmt.setString(2, "%"+categoryNo+"%");
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("goodsCount", rs.getInt("goodsCount"));
			map.put("price", rs.getString("price"));
			map.put("goodsName", rs.getString("goodsName"));
			map.put("categoryName", rs.getString("categoryName"));
			list.add(map);
		}
		DBUtil.close(rs, stmt, null);
		return list;
	}
}