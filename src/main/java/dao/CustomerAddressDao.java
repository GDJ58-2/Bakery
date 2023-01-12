package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import util.DBUtil;
import vo.CustomerAddress;

public class CustomerAddressDao {
	// SELECT
	// 집, 회사, 기타 주소 개수 파악
	public int selectAddressCount(Connection conn, String customerId, String addressKind) throws Exception {
		int count = 0;
		String sql = "SELECT COUNT(*) count\r\n"
				+ "FROM customer_address\r\n"
				+ "WHERE customer_id = ? AND address_kind = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customerId);
		stmt.setString(2, addressKind);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			count = rs.getInt("count");
	}
		return count;
	}
	
	public ArrayList<CustomerAddress> selectAddressList(Connection conn, String customerId) throws Exception {
		ArrayList<CustomerAddress> list = new ArrayList<CustomerAddress>();
		String sql = "SELECT address_code addressCode, customer_id customerId, address_kind addressKind, address, createdate\r\n"
					+ "FROM customer_address\r\n"
					+ "WHERE customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customerId);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			CustomerAddress ca = new CustomerAddress();
			ca.setAddressCode(rs.getInt("addressCode"));
			ca.setCustomerId(rs.getString("customerId"));
			ca.setAddressKind(rs.getString("addressKind"));
			ca.setAddress(rs.getString("address"));
			ca.setCreatedate(rs.getString("createdate"));
			list.add(ca);
		}
		return list;
	}
	
	public CustomerAddress selectAddressOne(Connection conn, int addressCode) throws Exception {
		CustomerAddress ca = null;
		String sql = "SELECT address_code addressCode, customer_id customerId, address_kind addressKind, address, createdate\r\n"
					+ "FROM customer_address\r\n"
					+ "WHERE address_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, addressCode);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			ca = new CustomerAddress();
			ca.setAddressCode(rs.getInt("addressCode"));
			ca.setCustomerId(rs.getString("customerId"));
			ca.setAddressKind(rs.getString("addressKind"));
			ca.setAddress(rs.getString("address"));
			ca.setCreatedate(rs.getString("createdate"));
		}
		return ca;
	}
	public int selectAddressCode(Connection conn, CustomerAddress address) throws Exception {
		int addressCode = 0;
		String sql = "SELECT address_code addressCode FROM customer_address WHERE address_kind=? AND customer_id=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, address.getAddressKind());
		stmt.setString(2, address.getCustomerId());
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			addressCode=rs.getInt("addressCode");
		}
		DBUtil.close(rs, stmt, null);
		return addressCode;
	}
	// INSERT
	public int insertAddress(Connection conn, CustomerAddress address) throws Exception {
		int addressCode = 0;
		String sql = "INSERT INTO customer_address(customer_id, address_kind, address, createdate) VALUES(?,?,?,NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS); // Statement.RETURN_GENERATED_KEYS : 쿼리 실행 후 생성된 auto_increment 값을 ResultSet에 반환
		stmt.setString(1, address.getCustomerId());
		stmt.setString(2, address.getAddressKind());
		stmt.setString(3, address.getAddress());
		stmt.executeUpdate();
		ResultSet rs = stmt.getGeneratedKeys();
		if(rs.next()) {
			addressCode = rs.getInt(1);
		}
		DBUtil.close(rs, stmt, null);
		return addressCode;
	}
	
	// UPDATE
	public int updateAddress(Connection conn, CustomerAddress address) throws Exception {
		int row = 0;
		String sql = "UPDATE customer_address SET address = ? WHERE address_code=?";
		PreparedStatement stmt = conn.prepareStatement(sql); 
		stmt.setString(1, address.getAddress());
		stmt.setInt(2, address.getAddressCode());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	
	// DELETE
	public int deleteAddress(Connection conn, int addressCode) throws Exception {
		int row = 0;
		String sql = "DELETE FROM customer_address WHERE address_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, addressCode);
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
}