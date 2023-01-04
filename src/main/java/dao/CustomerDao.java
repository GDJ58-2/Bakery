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
	public boolean checkCustomerId(Connection conn, Customer customer) throws Exception {
		boolean check = false;
		String sql = "SELECT customer_id"
				+ " FROM customer"
				+ " WHERE customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerId());
		ResultSet rs = stmt.executeQuery(); 
		if(rs.next()) { // ture 이면 아이디 중복
			check = true;
		}
		stmt.close();
		return check;
	}
	
	// 회원정보수정
	public int customerUpdate(Connection conn, Customer customer) throws Exception {
		int row = 0;
		String sql = "UPDATE customer SET customer_name customerName = ?"
				+ " WHERE customer_id = ? AND customer_pw = PASSWORD(?)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customer.getCustomerName());
		stmt.setString(2, customer.getCustomerId());
		stmt.setString(3, customer.getCustomerPw());
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
}
