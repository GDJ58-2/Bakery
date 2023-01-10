package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SiteCounterDao {
	// 오늘 첫번째 처음 접속자가 발생 insert : selectTodayCount() 호출의 결과가 0일 때
	public void insertCounter() throws Exception {
		Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/shop", "root", "java1234");
		String sql = "INSERT INTO site_counter(counter_date, counter_num) VALUES(CURDATE(), 1)";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.executeUpdate();
	}
	
	// 오늘 첫번째 접속자가 아닐때 update : selectTodayCount() 호출의 결과가 0이 아닐 때
	public void updateCounter() throws Exception {
		Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/shop", "root", "java1234");
		String sql = "UPDATE site_counter SET counter_num = counter_num + 1"
					+ "	WHERE counter_date = CURDATE()";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.executeUpdate();
	}
	
	// 오늘 접속자 수 확인 select
	public int selectTodayCount() throws Exception {
		int todayCount = 0;
		Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/shop", "root", "java1234");
		String sql = "SELECT counter_num counterNum FROM site_counter "
					+ "WHERE counter_date = CURDATE()";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			todayCount = rs.getInt("counterNum");
		}
		return todayCount;
	}
	
	// 전체 접속 수 확인 select
	public int selectTotalCount() throws Exception {
		int totalCount = 0;
		Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3306/shop", "root", "java1234");
		String sql = "SELECT SUM(counter_num) totalCount FROM site_counter";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			totalCount = rs.getInt("totalCount");
		}
		return totalCount;
	}
}