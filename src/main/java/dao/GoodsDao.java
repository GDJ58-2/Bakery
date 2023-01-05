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
	// 상품 리스트
	public ArrayList<HashMap<String, Object>> selectgoodsList(Connection conn) throws Exception {
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String,Object>>();
		String sql = "SELECT g.goods_code goodsCode, g.goods_name goodsName, img.filename filename"
				   + "	FROM goods g INNER JOIN goods_img img"
				   + "	ON g.goods_code = img.goods_code";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			HashMap<String, Object> m = new HashMap<String, Object>();
			m.put("goodsCode", rs.getInt("goodsCode"));
			m.put("goodsName", rs.getString("goodsName"));
			m.put("filename", rs.getString("filename"));
			list.add(m);
		}
		DBUtil.close(rs, stmt, null);
		
		return list;
	}
	
	// 상품 상세페이지
	public HashMap<String, Object> selectgoodsOne(Connection conn, int goodsCode) throws Exception {
		HashMap<String, Object> map = null;
		String sql = "SELECT g.goods_code goodsCode, g.goods_name goodsName, g.goods_price goodsPrice, g.goods_stock goodsStock, g.emp_id empId, g.hit hit, g.createdate createdate, img.filename filename, img.origin_name originName"
				   + "	FROM goods g INNER JOIN goods_img img"
				   + "	ON g.goods_code = img.goods_code"
				   + "	WHERE  g.goods_code = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, goodsCode);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			map = new HashMap<String, Object>();
			map.put("goodsCode", rs.getInt("goodsCode"));
			map.put("goodsName", rs.getString("goodsName"));
			map.put("goodsPrice", rs.getInt("goodsPrice"));
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
		String sql = "INSERT INTO goods(goods_name, goods_price, goods_stock, emp_id, hit, createdate) VALUES(?, ?, ?, ?, ?, NOW())";
		// PreparedStatement.RETURN_GENERATED_KEYS 쿼리실행 후 생성된 auto_increment값을 ResultSet에 반환
		PreparedStatement stmt = conn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
		stmt.setString(1, goods.getGoodsName());
		stmt.setInt(2, goods.getGoodsPrice());
		stmt.setInt(3, goods.getGoodsStock());
		stmt.setString(4, goods.getEmpId());
		stmt.setInt(5, goods.getHit());
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
		String sql = "UPDATE goods SET goods_name = ?, goods_price = ?, goods_stock = ?, emp_id = ?, hit = ? WHERE goods_code =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, goods.getGoodsName());
		stmt.setInt(2, goods.getGoodsPrice());
		stmt.setInt(3, goods.getGoodsStock());
		stmt.setString(4, goods.getEmpId());
		stmt.setInt(5, goods.getHit());
		stmt.setInt(6, goods.getGoodsCode());
		int row = stmt.executeUpdate();
		
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