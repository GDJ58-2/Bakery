package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import util.DBUtil;
import vo.Orders;

public class OrdersDao {
	// SELECT
	// 페이징 전체 주문 개수
	public int selectOrdersCount(Connection conn) throws Exception {
		int count = 0;
		String sql = "SELECT COUNT(*) count FROM orders";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			count = rs.getInt("count");
		}
		DBUtil.close(rs, stmt, null);
		
		return count;
	}
	
	// 회원의 주문 내역
	public ArrayList<HashMap<String, Object>> selectOrdersList(Connection conn, String customerId, int beginRow, int rowPerPage) throws Exception {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		String sql = "SELECT o.order_code orderCode, o.goods_code goodsCode, o.customer_Id customerId, o.address_code addressCode, o.order_quantity orderQuantity, o.order_price orderPrice, o.order_state orderState, o.createdate createdate, g.goods_name goodsName, g.filename filename, g.origin_name originName\r\n"
				+ "	FROM orders o INNER JOIN (SELECT g.goods_code, g.goods_name, img.filename, img.origin_name\r\n"
				+ "										FROM goods g INNER JOIN goods_img img\r\n"
				+ "											ON g.goods_code = img.goods_code) g\r\n"
				+ "		ON o.goods_code = g.goods_code\r\n"
				+ "WHERE customer_id = ?\r\n"
				+ "ORDER BY createdate DESC\r\n"
				+ "LIMIT ?, ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, customerId);
		stmt.setInt(2, beginRow);
		stmt.setInt(3, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("orderCode", rs.getInt("orderCode"));
			map.put("goodsCode", rs.getInt("goodsCode"));
			map.put("customerId", rs.getString("customerId"));
			map.put("addressCode", rs.getInt("addressCode"));
			map.put("orderQuantity", rs.getInt("orderQuantity"));
			map.put("orderPrice", rs.getInt("orderPrice"));
			map.put("orderState", rs.getString("orderState"));
			map.put("createdate", rs.getString("createdate"));
			map.put("goodsName", rs.getString("goodsName"));
			map.put("filename", rs.getString("filename"));
			map.put("originName", rs.getString("originName"));
			list.add(map);
		}
		DBUtil.close(rs, stmt, null);
		return list;
	}
	
	// 회원의 날짜별 주문 상세보기
	public ArrayList<HashMap<String, Object>> selectOrdersOneList(Connection conn, String createdate, String customerId) throws Exception {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		String sql = "SELECT o.order_code orderCode, o.goods_code goodsCode, o.customer_Id customerId, o.address_code addressCode, o.order_quantity orderQuantity, o.order_price orderPrice, o.order_state orderState, o.createdate createdate, o.customer_code customerCode, o.customer_name customerName, o.customer_phone customerPhone, o.category_no categoryNo, o.category_kind categoryKind, o.category_name categoryName, o.goods_name goodsName, o.goods_price goodsPrice, o.goods_content goodsContent, o.goods_stock goodsStock, o.emp_id empId, o.hit hit, o.filename filename, o.origin_name originName, ca.address_code addressCode, ca.address_kind addressKind, ca.address address\r\n"
				+ "	FROM(SELECT o.order_code, o.goods_code, o.customer_Id, o.address_code, o.order_quantity, o.order_price, o.order_state, o.createdate, o.customer_code, o.customer_name, o.customer_phone, g.category_no, g.category_kind, g.category_name, g.goods_name, g.goods_price, g.goods_content, g.goods_stock, g.emp_id, g.hit, g.filename, g.origin_name\r\n"
				+ "			FROM (SELECT o.order_code, o.goods_code, o.customer_Id, o.address_code, o.order_quantity, o.order_price, o.order_state, o.createdate, c.customer_code, c.customer_name, c.customer_phone\r\n"
				+ "						FROM (SELECT customer_code, customer_id, customer_name, customer_phone\r\n"
				+ "									FROM customer ) c INNER JOIN orders o \r\n"
				+ "										ON	o.customer_id = c.customer_id) o INNER JOIN (SELECT g.goods_code, g.category_no, g.category_kind, g.category_name, g.goods_name, g.goods_price, g.goods_content, g.goods_stock, g.emp_id, g.hit, img.filename, img.origin_name\r\n"
				+ "																											FROM (SELECT g.goods_code, g.category_no, g.goods_name, g.goods_price, g.goods_content, g.goods_stock, g.emp_id, g.hit, g.createdate, c.category_kind, c.category_name\r\n"
				+ "				   																									FROM goods g INNER JOIN goods_category c\r\n"
				+ "				   																										ON g.category_no = c.category_no) g INNER JOIN goods_img img\r\n"
				+ "																										 	  	ON g.goods_code = img.goods_code) g \r\n"
				+ "				ON o.goods_code = g.goods_code) o INNER JOIN customer_address ca\r\n"
				+ "		ON o.address_code = ca.address_code		\r\n"
				+ "	WHERE o.createdate LIKE ? AND o.customer_id = ?";	
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%"+createdate+"%");
		stmt.setString(2, customerId);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("orderCode", rs.getInt("orderCode"));
			map.put("goodsCode", rs.getInt("goodsCode"));
			map.put("customerId", rs.getString("customerId"));
			map.put("addressCode", rs.getInt("addressCode"));
			map.put("orderQuantity", rs.getInt("orderQuantity"));
			map.put("orderPrice", rs.getInt("orderPrice"));
			map.put("orderState", rs.getString("orderState"));
			map.put("createdate", rs.getString("createdate"));
			map.put("customerCode", rs.getInt("customerCode"));
			map.put("customerName", rs.getString("customerName"));
			map.put("customerPhone", rs.getString("customerPhone"));
			map.put("address", rs.getString("address"));
			map.put("addressKind", rs.getString("addressKind"));
			map.put("categoryNo", rs.getInt("categoryNo"));
			map.put("categoryName", rs.getString("categoryName"));
			map.put("goodsName", rs.getString("goodsName"));
			map.put("goodsPrice", rs.getString("goodsPrice"));
			map.put("goodsStock", rs.getInt("goodsStock"));
			map.put("empId", rs.getString("empId"));
			map.put("hit", rs.getInt("hit"));
			map.put("filename", rs.getString("filename"));
			map.put("originName", rs.getString("originName"));
			list.add(map);
		}
		DBUtil.close(rs, stmt, null);
		return list;
	}
	
	// 회원의 주문 상세보기 (수정 목적)
	public HashMap<String, Object> selectOrdersOne(Connection conn, int orderCode) throws Exception {
		HashMap<String, Object> map = null;
		String sql = "SELECT o.order_code orderCode, o.goods_code goodsCode, o.customer_Id customerId, o.address_code addressCode, o.order_quantity orderQuantity, o.order_price orderPrice, o.order_state orderState, o.createdate createdate, o.customer_code customerCode, o.customer_name customerName, o.customer_phone customerPhone, o.category_no categoryNo, o.category_kind categoryKind, o.category_name categoryName, o.goods_name goodsName, o.goods_price goodsPrice, o.goods_content goodsContent, o.goods_stock goodsStock, o.emp_id empId, o.hit hit, o.filename filename, o.origin_name originName, ca.address_code addressCode, ca.address_kind addressKind, ca.address address\r\n"
				+ "	FROM(SELECT o.order_code, o.goods_code, o.customer_Id, o.address_code, o.order_quantity, o.order_price, o.order_state, o.createdate, o.customer_code, o.customer_name, o.customer_phone, g.category_no, g.category_kind, g.category_name, g.goods_name, g.goods_price, g.goods_content, g.goods_stock, g.emp_id, g.hit, g.filename, g.origin_name\r\n"
				+ "			FROM (SELECT o.order_code, o.goods_code, o.customer_Id, o.address_code, o.order_quantity, o.order_price, o.order_state, o.createdate, c.customer_code, c.customer_name, c.customer_phone\r\n"
				+ "						FROM (SELECT customer_code, customer_id, customer_name, customer_phone\r\n"
				+ "									FROM customer ) c INNER JOIN orders o \r\n"
				+ "										ON	o.customer_id = c.customer_id) o INNER JOIN (SELECT g.goods_code, g.category_no, g.category_kind, g.category_name, g.goods_name, g.goods_price, g.goods_content, g.goods_stock, g.emp_id, g.hit, img.filename, img.origin_name\r\n"
				+ "																											FROM (SELECT g.goods_code, g.category_no, g.goods_name, g.goods_price, g.goods_content, g.goods_stock, g.emp_id, g.hit, g.createdate, c.category_kind, c.category_name\r\n"
				+ "				   																									FROM goods g INNER JOIN goods_category c\r\n"
				+ "				   																										ON g.category_no = c.category_no) g INNER JOIN goods_img img\r\n"
				+ "																										 	  	ON g.goods_code = img.goods_code) g \r\n"
				+ "				ON o.goods_code = g.goods_code) o INNER JOIN customer_address ca\r\n"
				+ "		ON o.address_code = ca.address_code		\r\n"
				+ "	WHERE o.order_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, orderCode);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			map = new HashMap<String, Object>();
			map.put("orderCode", rs.getInt("orderCode"));
			map.put("goodsCode", rs.getInt("goodsCode"));
			map.put("customerId", rs.getString("customerId"));
			map.put("addressCode", rs.getInt("addressCode"));
			map.put("orderQuantity", rs.getInt("orderQuantity"));
			map.put("orderPrice", rs.getInt("orderPrice"));
			map.put("orderState", rs.getString("orderState"));
			map.put("createdate", rs.getString("createdate"));
			map.put("customerCode", rs.getInt("customerCode"));
			map.put("customerName", rs.getString("customerName"));
			map.put("customerPhone", rs.getString("customerPhone"));
			map.put("address", rs.getString("address"));
			map.put("addressKind", rs.getString("addressKind"));
			map.put("categoryNo", rs.getInt("categoryNo"));
			map.put("categoryName", rs.getString("categoryName"));
			map.put("goodsName", rs.getString("goodsName"));
			map.put("goodsPrice", rs.getString("goodsPrice"));
			map.put("goodsStock", rs.getInt("goodsStock"));
			map.put("empId", rs.getString("empId"));
			map.put("hit", rs.getInt("hit"));
			map.put("filename", rs.getString("filename"));
			map.put("originName", rs.getString("originName"));
		}
		DBUtil.close(rs, stmt, null);
		return map;
	}
	
	// INSERT
	public HashMap<String, Object> insertOrders(Connection conn, Orders orders) throws Exception { // addOrders		
		HashMap<String, Object> map = new HashMap<String, Object>();
		int row = 0;
		int orderCode = 0;
		String sql = "INSERT INTO orders(goods_code,customer_id,address_code,order_quantity,order_price,order_state,createdate) VALUES(?,?,?,?,?,?,NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
		stmt.setInt(1, orders.getGoodsCode());
		stmt.setString(2, orders.getCustomerId());
		stmt.setInt(3, orders.getAddressCode());
		stmt.setInt(4, orders.getOrderQuantity());
		stmt.setInt(5, orders.getOrderPrice());
		stmt.setString(6, "결제");
		row = stmt.executeUpdate();
		ResultSet rs = stmt.getGeneratedKeys();
		if(rs.next()) {
			orderCode = rs.getInt(1);
		}
		map.put("row", row);
		map.put("orderCode", orderCode);
		DBUtil.close(null, stmt, null);
		return map;
	}
	
	// UPDATE
	public int updateOrders(Connection conn, Orders orders) throws Exception { // 주문자 취소, 구매확정
		int row = 0;
		String sql = "UPDATE orders SET order_state=? WHERE order_code=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, orders.getOrderState());
		stmt.setInt(2, orders.getOrderCode());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	
	// DELETE
	public int deleteOrders(Connection conn, String createdate) throws Exception { // 주문 삭제
		int row = 0;
		String sql = "DELETE FROM orders WHERE createdate LIKE ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, "%"+createdate+"%");
		row = stmt.executeUpdate();
		// System.out.println("dao row : " + row);
		DBUtil.close(null, stmt, null);
		return row;
	}
	
	// 관리자 주문내역 보기 
	public ArrayList<HashMap<String, Object>> selectOrdersListByAdmin(Connection conn, String searchKind, String search, String startDate, String endDate, String orderState, int beginRow, int rowPerPage) throws Exception {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		String sql ="	SELECT o.order_code orderCode, o.goods_code goodsCode, c.customer_name customerName, c.customer_phone customerPhone, o.order_quantity orderQuantity, o.order_price orderPrice, o.order_state orderState, o.createdate createdate, g.goods_name goodsName"
				+ "		  FROM orders o"
				+ " INNER JOIN (SELECT g.goods_code, g.goods_name"
				+ "				  FROM goods g) g"
				+ "			ON o.goods_code = g.goods_code"
				+ " INNER JOIN (SELECT c.customer_id, c.customer_name, c.customer_phone"
				+ "				FROM customer c) c"
				+ "			ON o.customer_id = c.customer_id"
				+ "		 WHERE DATE_FORMAT(o.createdate, '%Y-%m-%d') BETWEEN ? AND ?"
				+ "		   AND o.order_state LIKE ?"
				+ "		   AND " + searchKind + " LIKE ?" // 검색
				+ "	  ORDER BY (case when o.order_state LIKE '결제' then 5"
				+ "					 when o.order_state LIKE '배송중' then 4"
				+ "					 when o.order_state LIKE '배송완료' then 3"
				+ "					 when o.order_state LIKE '구매확정' then 2"
				+ "					 ELSE 1 END) DESC, o.createdate DESC"
				+ "		 LIMIT ?,?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, startDate);
		stmt.setString(2, endDate);
		stmt.setString(3, orderState);
		stmt.setString(4, search);
		stmt.setInt(5, beginRow);
		stmt.setInt(6, rowPerPage);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("orderCode", rs.getInt("orderCode"));
			map.put("goodsCode", rs.getInt("goodsCode"));
			map.put("customerName", rs.getString("customerName"));
			map.put("customerPhone", rs.getString("customerPhone"));
			map.put("orderQuantity", rs.getInt("orderQuantity"));
			map.put("orderPrice", rs.getInt("orderPrice"));
			map.put("orderState", rs.getString("orderState"));
			map.put("createdate", rs.getString("createdate"));
			map.put("goodsName", rs.getString("goodsName"));
			list.add(map);
		}
		DBUtil.close(rs, stmt, null);
		return list;
	}
	
	// 관리자 기능 - 배송상태 별 건수 확인
	public ArrayList<HashMap<String, Object>> selectCountByOrderState(Connection conn, String date) throws Exception {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		String sql = "SELECT order_state orderState, COUNT(order_state) cnt "
				+ "		FROM orders "
				+ "		WHERE DATE_FORMAT(createdate, '%Y-%m-%d') LIKE ?"
				+ "		GROUP BY order_state";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, date);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("orderState", rs.getString("orderState"));
			map.put("count", rs.getInt("cnt"));
			list.add(map);
		}
		DBUtil.close(rs, stmt, null);
		return list;
	}
}