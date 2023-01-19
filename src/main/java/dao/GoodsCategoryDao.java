package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DBUtil;
import vo.GoodsCategory;

public class GoodsCategoryDao {
	// SELECT
	// 상품 카테고리 리스트
	public ArrayList<GoodsCategory> selectGoodsCategoryList(Connection conn) throws Exception {
		ArrayList<GoodsCategory> list = new ArrayList<GoodsCategory>();
		String sql = "SELECT category_no categoryNo, category_kind categoryKind, category_name categoryName, createdate\r\n"
				+ "FROM goods_category";
		PreparedStatement stmt = conn.prepareStatement(sql);
		ResultSet rs = stmt.executeQuery();
		while(rs.next()) {
			GoodsCategory gc = new GoodsCategory();
			gc.setCategoryNo(rs.getInt("categoryNo"));
			gc.setCategoryKind(rs.getString("categoryKind"));
			gc.setCategoryName(rs.getString("categoryName"));
			gc.setCreatedate(rs.getString("createdate"));
			list.add(gc);
		}
		DBUtil.close(rs, stmt, null);
		
		return list;
	}
	
	// 상품 카테고리 종류 출력
	public String selectCategoryKind(Connection conn, int categoryNo) throws Exception {
		String categoryKind = null;
		String sql = "SELECT category_kind categoryKind"
				+ "		FROM goods_category"
				+ "		WHERE category_no = ?";
		PreparedStatement stmt = conn.prepareStatement(sql);
		stmt.setInt(1, categoryNo);
		ResultSet rs = stmt.executeQuery();
		if(rs.next()) {
			categoryKind = rs.getString("categoryKind");
		}
		return categoryKind;
	}
}
