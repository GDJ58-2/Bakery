package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import util.DBUtil;
import vo.Goods;
import vo.GoodsImg;

public class GoodsImgDao {
	//INSERT
	public int insertGoods(Connection conn, GoodsImg goodsImg) throws Exception {
		int row = 0;
		String sql = "INSERT INTO goods_img(goods_code, filename, origin_name, content_type, createdate) VALUES(?, ?, ?, ?, NOW())";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, goodsImg.getGoodsCode());
		stmt.setString(2, goodsImg.getFileName());
		stmt.setString(3, goodsImg.getOriginName());
		stmt.setString(4, goodsImg.getContentType());
		row = stmt.executeUpdate();
		return row;
	}
	
	// UPDATE
	public int updateGoods(Connection conn, GoodsImg goodsImg) throws Exception {
		String sql = "UPDATE goods_img SET filename = ?, origin_name = ?, content_type = ? WHERE goods_code =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setString(1, goodsImg.getFileName());
		stmt.setString(2, goodsImg.getOriginName());
		stmt.setString(3, goodsImg.getContentType());
		stmt.setInt(4, goodsImg.getGoodsCode());
		int row = stmt.executeUpdate();
		// System.out.println("row : " + row);
		DBUtil.close(null, stmt, null);
		
		return row;
	}
	
	// DELETE
	public int deleteGoods(Connection conn, GoodsImg goodsImg) throws Exception {
		String sql = "DELETE FROM goods_img WHERE goods_code =?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, goodsImg.getGoodsCode());
		int row = stmt.executeUpdate();
		
		DBUtil.close(null, stmt, null);
		
		return row;
	}
}