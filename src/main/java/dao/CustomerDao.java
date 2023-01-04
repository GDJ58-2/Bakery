package dao;

import java.sql.PreparedStatement;
import java.sql.Connection;
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
				+ ") VALUES (?, ?, ?, ?, ?, CURDATE())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		stmt.setString(2, customer.getCustomerPw());
		stmt.setString(3, customer.getCustomerName());
		stmt.setString(4, customer.getCustomerPhone());
		stmt.setInt(5, customer.getPoint());
		row = stmt.executeUpdate();
		stmt.close();
		return row;
	}
	
	// 아이디중복검사
	public int checkCustomerId(Connection conn, Customer customer) throws Exception {
		int row = 0;
		String sql = "SELECT customer_id"
				+ " FROM customer"
				+ " WHERE customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		row = stmt.executeUpdate(); // 1이면 아이디 중복
		stmt.close();
		return row;
	}
	
	// 회원정보수정
	
	
	// 회원탈퇴
}
