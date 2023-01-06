package dao;

import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;

import util.DBUtil;
import vo.Customer;

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
		stmt.close();
		rs.close();
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
		stmt.close();
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
		rs.close();
		stmt.close();
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
		stmt.close();
		return row;
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
		stmt.close();
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
		rs.close();
		stmt.close();
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
		stmt.close();
		return row;
	}
	
	// 비밀번호 이력 조회
	public boolean checkCustomerPw(Connection conn, String newPw) throws Exception {
		boolean result = false;
		String sql = "SELECT pw"
				+ " FROM pw_history"
				+ " WHERE pw = PASSWORD(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, newPw);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			result = true; // 변경 불가능한 비밀번호
		}
		rs.close();
		stmt.close();
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
		stmt.close();
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
		rs.close();
		stmt.close();
		return resultCnt;
	}
	
	// pw_history에 있는 데이터가 3개 이상이면 제일 오래된 데이터 삭제
	public int deletePwHistory(Connection conn, Customer customer) throws Exception {
		int row = 0;
		String sql = "DELETE FROM pw_history"
				+ "	WHERE createdate IN (SELECT MIN(createdate)"
				+ "						FROM pw_history"
				+ "						WHERE customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		row = stmt.executeUpdate();
		stmt.close();
		return row;
	}
	
	// 회원탈퇴
	public int customerDelete(Connection conn, Customer customer) throws Exception {
		int row = 0;
		String sql = "DELETE FROM customer"
				+ " WHERE customer_id = ? and customer_pw = PASSWORD(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		stmt.setString(2, customer.getCustomerPw());
		row = stmt.executeUpdate();
		stmt.close();
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
		stmt.close();
		return row;
	}
}
