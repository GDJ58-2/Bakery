package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import util.DBUtil;
import vo.PointHistory;

public class PointHistoryDao {
	// SELECT
	// 포인트 내역 조회
	public ArrayList<HashMap<String, Object>> selectPointHistory(Connection conn, String customerId) throws Exception {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		String sql = "SELECT o.order_code orderCode, o.customer_id customerId, p.point_kind pointKind, p.point point, p.createdate createdate\r\n"
				+ "	FROM orders o INNER JOIN point_history p\r\n"
				+ "		ON o.order_code = p.order_code\r\n"
				+ "WHERE customer_id = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customerId);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("orderCode", rs.getInt("orderCode"));
			map.put("customerId", rs.getString("customerId"));
			map.put("pointKind", rs.getString("pointKind"));
			map.put("point", rs.getInt("point"));
			map.put("createdate", rs.getString("createdate"));
			list.add(map);
		}
		DBUtil.close(rs, stmt, null);
		return list;
	}
	
	// INSERT
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
	
	// DELETE
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