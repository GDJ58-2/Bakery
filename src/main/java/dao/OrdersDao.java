package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import util.DBUtil;
import vo.Orders;

public class OrdersDao {
	public int insertOrders(Connection conn, Orders orders) throws Exception { // addOrders
		int orderCode = 0;
		String sql = "INSERT INTO orders(goods_code,customer_id,address_code,order_quantity,order_price,order_state,createdate) VALUES(?,?,?,?,?,?,NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		stmt.setInt(1, orders.getGoodsCode());
		stmt.setString(2, orders.getCustomerId());
		stmt.setInt(3, orders.getAddressCode());
		stmt.setInt(4, orders.getOrderQuantity());
		stmt.setInt(5, orders.getOrderPrice());
		stmt.setString(6, "결제");
		stmt.executeUpdate();
		ResultSet rs = stmt.getGeneratedKeys();
		if(rs.next()) {
			orderCode = rs.getInt(1);
		}
		DBUtil.close(null, stmt, null);
		return orderCode;
	}
	public int updateOrdersByCustomer(Connection conn, Orders orders) throws Exception { // 주문자 취소, 구매확정
		int row = 0;
		String sql = "UPDATE orders SET order_state=? WHERE order_code=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, orders.getOrderState());
		stmt.setInt(2, orders.getOrderCode());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	public int updateOrdersByAdmin(Connection conn, Orders orders) throws Exception { // modifyOrders
		int row = 0;
		String sql = "UPDATE orders SET order_quantity=?, order_price=? order_state=? WHERE order_code=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, orders.getOrderQuantity());
		stmt.setInt(2, orders.getOrderPrice());
		stmt.setString(3, orders.getOrderState());
		stmt.setInt(4, orders.getOrderCode());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
}