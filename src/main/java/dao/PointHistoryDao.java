package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DBUtil;
import vo.PointHistory;

public class PointHistoryDao {
	
	public int insertPoint(Connection conn, PointHistory point) throws Exception { // addPoint
		int row = 0;
		String sql = "INSERT INTO point_history VALUES(?,?,?,NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, point.getOrderCode());
		stmt.setString(2, point.getPointKind());
		stmt.setInt(3, point.getPoint());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	public int deletePoint(Connection conn, int orderCode) throws Exception {
		int row = 0;
		String sql = "DELETE FROM point_history WHERE order_code=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, orderCode);
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
}