package dao;

import java.sql.PreparedStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import vo.Customer;

public class CustomerDao {
	
	// 로그인
	public int loginCustomer(Connection conn, Customer customer) throws Exception {
		int row = 0;
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
		row = stmt.executeUpdate();
		stmt.close();
		return row;
	}
	
	// 회원가입
	public int insertCustomer(Connection conn, Customer customer) throws Exception {
		int row = 0;
		String sql = "INSERT INTO customer("
				+ "customer_id, customer_pw, customer_name, customer_phone, point, createdate"
				+ ") VALUES (?, ?, ?, ?, 0, CURDATE())"; // 가입시 포인트는 0
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		stmt.setString(2, customer.getCustomerPw());
		stmt.setString(3, customer.getCustomerName());
		stmt.setString(4, customer.getCustomerPhone());
		row = stmt.executeUpdate();
		stmt.close();
		return row;
	}
	
	// pw변경이력 테이블에 정보등록
	public int customerNewPwHistory(Connection conn, Customer customer) throws Exception {
		int row = 0;
		String sql = "INSERT INTO pw_history("
				+ "customer_id, pw, createdate"
				+ ") VALUES (?, ?, CURDATE())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		stmt.setString(2, customer.getCustomerPw());
		row = stmt.executeUpdate();
		stmt.close();
		return row;
	}
	
	// 아이디중복검사(customer table)
	public boolean checkCustomerId(Connection conn, Customer customer) throws Exception {
		boolean check = false;
		String sql = "SELECT customer_id"
				+ " FROM customer"
				+ " WHERE customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		ResultSet rs = stmt.executeQuery(); 
		if(rs.next()) { // ture이면 아이디 중복
			check = true;
		}
		stmt.close();
		return check;
	}
	
	// 아이디 중복검사(emp table)
	public boolean checkEmpId(Connection conn, Customer customer) throws Exception {
		boolean check = false;
		String sql = "SELECT emp_id"
				+ " FROM emp"
				+ " WHERE emp_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		ResultSet rs = stmt.executeQuery(); 
		if(rs.next()) { // ture이면 아이디 중복
			check = true;
		}
		stmt.close();
		return check;
	}
	
	// 아이디 중복검사(outid table)
	public boolean checkOutId(Connection conn, Customer customer) throws Exception {
		boolean check = false;
		String sql = "SELECT id"
				+ " FROM outid"
				+ " WHERE id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		ResultSet rs = stmt.executeQuery(); 
		if(rs.next()) { // ture이면 아이디 중복
			check = true;
		}
		stmt.close();
		return check;
	}
	
	// 회원정보조회
	public Customer selectCustomer(Connection conn, String customerId) throws Exception {
		Customer resultCustomer = null;
		String sql = "SELECT customer_code customerCode"
				+ ", customer_id customerId"
				+ ", customer_name customerName"
				+ ", customer_phone customerPhone"
				+ ", point"
				+ " FROM cusotmer"
				+ " WHERE customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customerId);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			resultCustomer = new Customer();
			resultCustomer.setCustomerCode(rs.getInt("customerCode"));
			resultCustomer.setCustomerId(rs.getString("customerId"));
			resultCustomer.setCustomerName("customerName");
			resultCustomer.setCustomerPhone(rs.getString("customerPhone"));
			resultCustomer.setPoint(rs.getInt("point"));
		}
		stmt.close();
		rs.close();
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
		stmt.setString(2, customer.getCustomerId());
		stmt.setString(3, customer.getCustomerPw());
		row = stmt.executeUpdate();
		stmt.close();
		return row;
	}
	
	// 비밀번호 이력 조회
	public boolean chechCustomerPw(Connection conn, Customer customer) throws Exception {
		boolean result = false;
		String sql = "SELECT pw"
				+ " FROM pw_history"
				+ " WHERE customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			result = true; 
		}
		return result;
	}
	
	
	// 비밀번호 수정
	public int customerUpdatePw(Connection conn, String newPw, Customer customer) throws Exception {
		int row = 0;
		String sql = "UPDATE customer"
				+ " INNER JOIN pw_history h"
				+ "	ON c.customer_id = h.customer_id"
				+ " SET c.customer_pw = PASSWORD(?)"
				+ ", h.pw = PASSWORD(?)"
				+ " WHERE c.customer_id = ? AND c.customer_pw = PASSWORD(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, newPw);
		stmt.setString(2, newPw);
		stmt.setString(3, customer.getCustomerId());
		stmt.setString(4, customer.getCustomerPw());
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
	public int insertOutid(Connection conn, String customerId) throws Exception {
		int row = 0;
		String sql = "INSERT INTO outid("
				+ "id, createdate"
				+ ") VALUES (?, CURDATE())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customerId);
		row = stmt.executeUpdate();
		stmt.close();
		return row;
	}
}
