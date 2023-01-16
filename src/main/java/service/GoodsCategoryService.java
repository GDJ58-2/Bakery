package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.GoodsCategoryDao;
import util.DBUtil;
import vo.GoodsCategory;

public class GoodsCategoryService {
	private GoodsCategoryDao goodsCategoryDao;
	// SELECT
	// 상품 카테고리 리스트
	public ArrayList<GoodsCategory> getGoodsCategoryList() {
		ArrayList<GoodsCategory> list = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			
			this.goodsCategoryDao = new GoodsCategoryDao();
			list = goodsCategoryDao.selectGoodsCategoryList(conn);
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}
