package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import util.DBUtil;
import vo.Customer;
import vo.CustomerAddress;

public class CustomerDao {
	
	// 로그인
	public Customer loginCustomer(Connection conn, Customer customer) throws Exception {
		Customer resultCustomer = null;
		String sql = "SELECT customer_code customerCode"
				+ ", customer_id customerId"
				+ ", customer_name customerName"
				+ ", customer_phone customerPhone"
				+ ", point"
				+ " FROM customer"
				+ " WHERE customer_id = ? AND customer_pw = PASSWORD(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		stmt.setString(2, customer.getCustomerPw());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			resultCustomer = new Customer();
			resultCustomer.setCustomerCode(rs.getInt("customerCode"));
			resultCustomer.setCustomerId(rs.getString("customerId"));
			resultCustomer.setCustomerName(rs.getString("customerName"));
			resultCustomer.setCustomerPhone(rs.getString("customerPhone"));
			resultCustomer.setPoint(rs.getInt("point"));
		}
		DBUtil.close(rs, stmt, null);
		return resultCustomer;
	}
	
	// 회원가입
	public int insertCustomer(Connection conn, Customer customer) throws Exception {
		int row = 0;
		String sql = "INSERT INTO customer("
				+ "customer_id, customer_pw, customer_name, customer_phone, point, createdate"
				+ ") VALUES (?, PASSWORD(?), ?, ?, 0, NOW())"; // 가입시 포인트는 0
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		stmt.setString(2, customer.getCustomerPw());
		stmt.setString(3, customer.getCustomerName());
		stmt.setString(4, customer.getCustomerPhone());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	
	// 아이디중복검사
	public boolean checkCustomerId(Connection conn, Customer customer) throws Exception {
		boolean check = false;
		String sql = "SELECT i.id"
				+ " FROM (SELECT customer_id id"
				+ "			FROM customer"
				+ "			UNION"
				+ "			SELECT id"
				+ "			FROM outid"
				+ "			UNION"
				+ "			SELECT emp_id id"
				+ "			FROM emp) i"
				+ " WHERE i.id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		ResultSet rs = stmt.executeQuery(); 
		if(rs.next()) { // ture이면 아이디 중복
			check = true;
		}
		DBUtil.close(rs, stmt, null);
		return check;
	}
	
	// 가입시 pw_history 테이블에 데이터입력
	public int customerNewPwHistory(Connection conn, Customer customer) throws Exception {
		int row = 0;
		String sql = "INSERT INTO pw_history("
				+ "customer_id, pw, createdate"
				+ ") VALUES (?, PASSWORD(?), NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		stmt.setString(2, customer.getCustomerPw());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	
	// 가입시 customer_address 테이블에 데이터입력
	public int insertAddress(Connection conn, CustomerAddress address) throws Exception{
		int addressCode = 0;
		String sql = "INSERT INTO customer_address(customer_id, address, createdate) VALUES(?, ?, NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS); // Statement.RETURN_GENERATED_KEYS : 쿼리 실행 후 생성된 auto_increment 값을 ResultSet에 반환
		stmt.setString(1, address.getCustomerId());
		stmt.setString(2, address.getAddress());
		stmt.executeUpdate();
		ResultSet rs = stmt.getGeneratedKeys();
		if(rs.next()) {
			addressCode = rs.getInt(1);
		}
		DBUtil.close(rs, stmt, null);
		return addressCode;
	}
	
	// 비밀번호 수정시 pw_history 테이블에 데이터입력
		public int customerNewPwHistory(Connection conn, String newPw, Customer customer) throws Exception {
			int row = 0;
			String sql = "INSERT INTO pw_history("
					+ "customer_id, pw, createdate"
					+ ") VALUES (?, PASSWORD(?), NOW())";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, customer.getCustomerId());
			stmt.setString(2, newPw);
			row = stmt.executeUpdate();
			DBUtil.close(null, stmt, null);
			return row;
		}
	
	// 회원정보조회
	public Customer selectOneCustomer(Connection conn, String customerId) throws Exception {
		Customer resultCustomer = null;
		String sql = "SELECT customer_code customerCode"
				+ ", customer_id customerId"
				+ ", customer_name customerName"
				+ ", customer_phone customerPhone"
				+ ", point"
				+ " FROM customer"
				+ " WHERE customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customerId);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			resultCustomer = new Customer();
			resultCustomer.setCustomerCode(rs.getInt("customerCode"));
			resultCustomer.setCustomerId(rs.getString("customerId"));
			resultCustomer.setCustomerName(rs.getString("customerName"));
			resultCustomer.setCustomerPhone(rs.getString("customerPhone"));
			resultCustomer.setPoint(rs.getInt("point"));
		}
		DBUtil.close(rs, stmt, null);
		return resultCustomer;
	}
	
	// 회원정보수정
	public int customerUpdate(Connection conn, Customer customer) throws Exception {
		int row = 0;
		String sql = "UPDATE customer"
				+ " SET customer_name = ?"
				+ ", customer_phone = ?"
				+ " WHERE customer_id = ? AND customer_pw = PASSWORD(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerName());
		stmt.setString(2, customer.getCustomerPhone());
		stmt.setString(3, customer.getCustomerId());
		stmt.setString(4, customer.getCustomerPw());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	
	// 포인트 정보 업데이트
	public int customerPoint(Connection conn, Customer customer) throws Exception {
		int row = 0;
		String sql = "UPDATE customer"
				+ " SET point = ?"
				+ " WHERE customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, customer.getPoint());
		stmt.setString(2, customer.getCustomerId());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	
	// 비밀번호 이력 조회
	public boolean checkCustomerPw(Connection conn, String newPw, Customer customer) throws Exception {
		boolean result = false;
		String sql = "SELECT pw"
				+ " FROM pw_history"
				+ " WHERE pw = PASSWORD(?) AND customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, newPw);
		stmt.setString(2, customer.getCustomerId());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			result = true; // 변경 불가능한 비밀번호
		}
		DBUtil.close(rs, stmt, null);
		return result;
	}
	
	// 비밀번호 수정
	public int customerUpdatePw(Connection conn, String newPw, Customer customer) throws Exception {
		int row = 0;
		String sql = "UPDATE customer"
				+ " SET customer_pw = PASSWORD(?)"
				+ " WHERE customer_id = ? AND customer_pw = PASSWORD(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, newPw);
		stmt.setString(2, customer.getCustomerId());
		stmt.setString(3, customer.getCustomerPw());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	
	// pw_history에 등록되어있는 데이터 개수 조회
	public int cntPwhistory(Connection conn, Customer customer) throws Exception {
		int resultCnt = 0;
		String sql = "SELECT COUNT(*) cnt"
				+ "	FROM pw_history"
				+ " WHERE customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			resultCnt = rs.getInt("cnt");
		}
		//System.out.println("CustomerDao cnt: " + resultCnt);
		DBUtil.close(rs, stmt, null);
		return resultCnt;
	}
	
	// pw_history에 있는 데이터가 3개 이상이면 제일 오래된 데이터 삭제
	public int deletePwHistory(Connection conn, Customer customer) throws Exception {
		int row = 0;
		String sql = "DELETE FROM pw_history"
				+ "	WHERE createdate IN (SELECT MIN(createdate)"
				+ "						FROM pw_history"
				+ "						WHERE customer_id = ?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}

	// 회원탈퇴 전 삭제되어야 하는 db들 - cart(cartDao), point_history, pw_history
	// 1) point_history 삭제
	public int deleteCustomerPointHistory(Connection conn, Customer customer) throws Exception {
		int row = 0;
		String sql = "DELETE FROM point_history"
				+ " WHERE order_code IN (SELECT order_code FROM orders WHERE customer_id = ?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	
	// 2) pw_history 삭제 
	public int deletePwHistory(Connection conn, String customerId) throws Exception {
		int row = 0;
		String sql = "DELETE FROM pw_history WHERE customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customerId);
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	
	// 회원탈퇴
	public int customerDelete(Connection conn, Customer customer) throws Exception {
		int row = 0;
		String sql = "DELETE FROM customer"
				+ " WHERE customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	
	// 탈퇴아이디 등록
	public int insertOutid(Connection conn, Customer customer) throws Exception {
		int row = 0;
		String sql = "INSERT INTO outid("
				+ "id, createdate"
				+ ") VALUES (?, NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	
	// 고객목록 출력
	public ArrayList<Customer> selectCustomerListByAdmin(Connection conn, String search, int beginRow, int rowPerPage) throws Exception {
		ArrayList<Customer> list = new ArrayList<Customer>();
		String sql = "SELECT customer_code customerCode, customer_id customerId, customer_name customerName, customer_phone customerPhone, point, createdate FROM customer WHERE customer_id LIKE ? LIMIT ?,?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, search);
		stmt.setInt(2, beginRow);
		stmt.setInt(3, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			Customer c = new Customer(rs.getInt("customerCode"), rs.getString("customerId"),null, rs.getString("customerName"), rs.getString("customerPhone"), rs.getInt("point"), rs.getString("createdate"));
			list.add(c);
		}
		DBUtil.close(rs, stmt, null);
		return list;
	}
}