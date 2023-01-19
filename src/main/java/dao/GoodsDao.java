package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;

import util.DBUtil;
import vo.Goods;

public class GoodsDao {
	// SELECT
	// 페이징 전체 상품 개수
	public int selectGoodsCount(Connection conn) throws Exception {
		int count = 0;
		String sql = "SELECT COUNT(*) count FROM goods";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			count = rs.getInt("count");
		}
		DBUtil.close(rs, stmt, null);
		
		return count;
	}
	
	// 상품 리스트
	public ArrayList<HashMap<String, Object>> selectGoodsListByPage(Connection conn, String categoryKind, int categoryNo, int beginRow, int rowPerPage) throws Exception {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		if(categoryKind == null || categoryKind.equals("")) {
			if(categoryNo == 0) {
				String sql = "SELECT g.goods_code goodsCode, g.category_no categoryNo, g.goods_name goodsName, g.goods_price goodsPrice, g.goods_stock goodsStock, g.filename filename, gc.category_kind categoryKind, gc.category_name categoryName"
						+ "		FROM (SELECT g.goods_code, g.category_no, g.goods_name, g.goods_price, g.goods_stock, img.filename"
						+ "				FROM goods g INNER JOIN goods_img img"
						+ "					ON g.goods_code = img.goods_code) g INNER JOIN goods_category gc"
						+ "			ON g.category_no = gc.category_no"
						+ "		LIMIT ?, ?";
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, beginRow);
				stmt.setInt(2, rowPerPage);
				rs = stmt.executeQuery();
			} else {
				String sql = "SELECT g.goods_code goodsCode, g.category_no categoryNo, g.goods_name goodsName, g.goods_price goodsPrice, g.goods_stock goodsStock, g.filename filename, gc.category_kind categoryKind, gc.category_name categoryName"
						+ "		FROM (SELECT g.goods_code, g.category_no, g.goods_name, g.goods_price, g.goods_stock, img.filename"
						+ "				FROM goods g INNER JOIN goods_img img"
						+ "					ON g.goods_code = img.goods_code) g INNER JOIN goods_category gc"
						+ "			ON g.category_no = gc.category_no"
						+ "		WHERE g.category_no = ?"
						+ "		LIMIT ?, ?";
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, categoryNo);
				stmt.setInt(2, beginRow);
				stmt.setInt(3, rowPerPage);
				rs = stmt.executeQuery();
			}
		} else {
			if(categoryNo == 0) {
				String sql = "SELECT g.goods_code goodsCode, g.category_no categoryNo, g.goods_name goodsName, g.goods_price goodsPrice, g.goods_stock goodsStock, g.filename filename, gc.category_kind categoryKind, gc.category_name categoryName"
						+ "		FROM (SELECT g.goods_code, g.category_no, g.goods_name, g.goods_price, g.goods_stock, img.filename"
						+ "				FROM goods g INNER JOIN goods_img img"
						+ "					ON g.goods_code = img.goods_code) g INNER JOIN goods_category gc"
						+ "			ON g.category_no = gc.category_no"
						+ "		WHERE gc.category_kind = ?"
						+ "		LIMIT ?, ?";
				stmt = conn.prepareStatement(sql);
				stmt.setString(1, categoryKind);
				stmt.setInt(2, beginRow);
				stmt.setInt(3, rowPerPage);
				rs = stmt.executeQuery();
			} else {
				String sql = "SELECT g.goods_code goodsCode, g.category_no categoryNo, g.goods_name goodsName, g.goods_price goodsPrice, g.goods_stock goodsStock, g.filename filename, gc.category_kind categoryKind, gc.category_name categoryName"
						+ "		FROM (SELECT g.goods_code, g.category_no, g.goods_name, g.goods_price, g.goods_stock, img.filename"
						+ "				FROM goods g INNER JOIN goods_img img"
						+ "					ON g.goods_code = img.goods_code) g INNER JOIN goods_category gc"
						+ "			ON g.category_no = gc.category_no"
						+ "		WHERE g.category_no = ? OR gc.category_kind = ?"
						+ "		LIMIT ?, ?";
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, categoryNo);
				stmt.setString(2, categoryKind);
				stmt.setInt(3, beginRow);
				stmt.setInt(4, rowPerPage);
				rs = stmt.executeQuery();
			}
		}
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("goodsCode", rs.getInt("goodsCode"));
			m.put("categoryNo", rs.getInt("categoryNo"));
			m.put("categoryName", rs.getString("categoryName"));
			m.put("categoryKind", rs.getString("categoryKind"));
			m.put("goodsStock", rs.getString("goodsStock"));
			m.put("goodsName", rs.getString("goodsName"));
			m.put("goodsPrice", rs.getString("goodsPrice"));
			m.put("filename", rs.getString("filename"));
			list.add(m);
		}
		DBUtil.close(rs, stmt, null);
		
		return list;
	}
	
	// 연관 상품 추천 리스트
	public ArrayList<HashMap<String, Object>> selectGoodsList(Connection conn, String categoryName) throws Exception {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String sql = "SELECT g.goods_code goodsCode, g.category_no categoryNo, g.goods_name goodsName, g.goods_price goodsPrice, g.goods_stock goodsStock, g.filename filename, gc.category_kind categoryKind, gc.category_name categoryName"
				+ "		FROM (SELECT g.goods_code, g.category_no, g.goods_name, g.goods_price, g.goods_stock, img.filename"
				+ "				FROM goods g INNER JOIN goods_img img"
				+ "					ON g.goods_code = img.goods_code) g INNER JOIN goods_category gc"
				+ "			ON g.category_no = gc.category_no"
				+ "		WHERE gc.category_name = ?";
		stmt = conn.prepareStatement(sql);
		stmt.setString(1, categoryName);
		rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("goodsCode", rs.getInt("goodsCode"));
			m.put("categoryNo", rs.getInt("categoryNo"));
			m.put("categoryName", rs.getString("categoryName"));
			m.put("categoryKind", rs.getString("categoryKind"));
			m.put("goodsStock", rs.getString("goodsStock"));
			m.put("goodsName", rs.getString("goodsName"));
			m.put("goodsPrice", rs.getString("goodsPrice"));
			m.put("filename", rs.getString("filename"));
			list.add(m);
		}
		DBUtil.close(rs, stmt, null);
		
		return list;
	}
	
	// 상품 상세페이지
	public HashMap<String, Object> selectGoodsOne(Connection conn, int goodsCode) throws Exception {
		HashMap<String, Object> map = null;
		String sql = "SELECT g.goods_code goodsCode, g.category_no categoryNo, g.category_kind categoryKind, g.category_name categoryName, g.goods_name goodsName, g.goods_price goodsPrice, g.goods_content goodsContent, g.goods_stock goodsStock, g.emp_id empId, g.hit hit, g.createdate createdate, img.filename filename, img.origin_name originName"
				   + "	FROM (SELECT g.goods_code, g.category_no, g.goods_name, g.goods_price, g.goods_content, g.goods_stock, g.emp_id, g.hit, g.createdate, c.category_kind, c.category_name"
				   + "		FROM goods g INNER JOIN goods_category c"
				   + "		ON g.category_no = c.category_no) g INNER JOIN goods_img img"
				   + "	ON g.goods_code = img.goods_code"
				   + "	WHERE g.goods_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, goodsCode);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			map = new HashMap<String, Object>();
			map.put("goodsCode", rs.getInt("goodsCode"));
			map.put("categoryNo", rs.getInt("categoryNo"));
			map.put("categoryKind", rs.getString("categoryKind"));
			map.put("categoryName", rs.getString("categoryName"));
			map.put("goodsName", rs.getString("goodsName"));
			map.put("goodsPrice", rs.getInt("goodsPrice"));
			map.put("goodsContent", rs.getString("goodsContent"));
			map.put("goodsStock", rs.getInt("goodsStock"));
			map.put("empId", rs.getString("empId"));
			map.put("hit", rs.getInt("hit"));
			map.put("createdate", rs.getString("createdate"));
			map.put("filename", rs.getString("filename"));
			map.put("originName", rs.getString("originName"));
		}
		DBUtil.close(rs, stmt, null);
		
		return map;
	}
	
	// INSERT
	public HashMap<String, Integer> insertGoods(Connection conn, Goods goods) throws Exception {
		String sql = "INSERT INTO goods(category_no, goods_name, goods_price, goods_content, goods_stock, emp_id, hit, createdate) VALUES(?, ?, ?, ?, ?, ?, ?, NOW())";
		// PreparedStatement.RETURN_GENERATED_KEYS 쿼리실행 후 생성된 auto_increment값을 ResultSet에 반환
		PreparedStatement stmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
		stmt.setInt(1, goods.getCategoryNo());
		stmt.setString(2, goods.getGoodsName());
		stmt.setInt(3, goods.getGoodsPrice());
		stmt.setString(4, goods.getGoodsContent());
		stmt.setInt(5, goods.getGoodsStock());
		stmt.setString(6, goods.getEmpId());
		stmt.setInt(7, goods.getHit());
		int row = stmt.executeUpdate();
		ResultSet rs = stmt.getGeneratedKeys();
		int autoKey = 0;
		if(rs.next()) {
			autoKey = rs.getInt(1); // stmt.executeUpdate(); 생성된 auto_increment값이 대입
		}
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("row", row);
		map.put("autoKey", autoKey);
		
		DBUtil.close(rs, stmt, null);
		
		return map;
	}
	
	// UPDATE
	public int updateGoods(Connection conn, Goods goods) throws Exception {
		String sql = "UPDATE goods SET category_no = ?, goods_name = ?, goods_price = ?, goods_content = ?, goods_stock = ?, emp_id = ?, hit = ? WHERE goods_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, goods.getCategoryNo());
		stmt.setString(2, goods.getGoodsName());
		stmt.setInt(3, goods.getGoodsPrice());
		stmt.setString(4, goods.getGoodsContent());
		stmt.setInt(5, goods.getGoodsStock());
		stmt.setString(6, goods.getEmpId());
		stmt.setInt(7, goods.getHit());
		stmt.setInt(8, goods.getGoodsCode());
		int row = stmt.executeUpdate();
		
		DBUtil.close(null, stmt, null);
		
		return row;
	}
	
	// 재고 변경
	public int updateGoodsStock(Connection conn, Goods goods) throws Exception {
		int row = 0;
		String sql = "UPDATE goods SET goods_stock=? WHERE goods_code=?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, goods.getGoodsStock());
		stmt.setInt(2, goods.getGoodsCode());
		row = stmt.executeUpdate();
		DBUtil.close(null, stmt, null);
		return row;
	}
	
	// DELETE
	public int deleteGoods(Connection conn, Goods goods) throws Exception {
		String sql = "DELETE FROM goods WHERE goods_code =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, goods.getGoodsCode());
		int row = stmt.executeUpdate();
		
		DBUtil.close(null, stmt, null);
		
		return row;
	}
}