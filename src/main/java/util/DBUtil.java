package util;

import java.sql.*;

public class DBUtil {

	public static Connection getConnection() throws Exception {
		String driver	= "org.mariadb.jdbc.Driver";
		String dbUrl	= "jdbc:mariadb://localhost:3306/shop";
		String dbUser	= "root";
		String dbPw		= "java1234";
		Class.forName(driver); // 외부 드라이브 로딩
		Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPw); // db 연결
		//System.out.println("연결 성공");
		conn.setAutoCommit(false);
		return conn;
	}
	
	public static void close(ResultSet rs, PreparedStatement stmt, Connection conn) throws Exception {
		if(rs != null) {
			rs.close();
		}
		if(stmt!=null) {
			stmt.close();
		}
		if(conn!=null) {
			conn.close();
		}
	}
}