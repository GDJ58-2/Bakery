package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import util.DBUtil;
import vo.CustomerAddress;

public class CustomerAddressDao {
	public int insertAddress(Connection conn, CustomerAddress address) throws Exception{
		int addressCode = 0;
		String sql = "INSERT INTO customer_address(customer_id,address,createdate) VALUES(?,?,NOW())";
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
}