package service;

import java.io.File;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import dao.GoodsDao;
import dao.GoodsImgDao;
import util.DBUtil;
import vo.Goods;
import vo.GoodsImg;

public class GoodsService {
	private GoodsDao goodsDao;
	private GoodsImgDao goodsImgDao;
	
	// GET
	// 상품 리스트
	public ArrayList<HashMap<String, Object>> getGoodsList(int categoryNo) {
		ArrayList<HashMap<String, Object>> list = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			
			goodsDao = new GoodsDao();
			list = goodsDao.selectgoodsList(conn, categoryNo);
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
	
	// 상품 상세페이지
	public HashMap<String, Object> getGoodsOne(int goodsCode) {
		HashMap<String, Object> map = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			
			goodsDao = new GoodsDao();
			map = goodsDao.selectgoodsOne(conn, goodsCode);
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
		return map;
	}
	
	// ADD
	public void addGoods(Goods goods, GoodsImg goodsImg, String dir) {
		goodsDao = new GoodsDao();
		goodsImgDao = new GoodsImgDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			
			HashMap<String, Integer> map = goodsDao.insertGoods(conn, goods);
			
			int row = map.get("row");
			if(row == 1) {
				goodsImg.setGoodsCode(map.get("autoKey"));
				goodsImgDao.insertGoods(conn, goodsImg); // itemImg.getItemNo() --> 0
				System.out.println("서비스 실행 성공");							
			} else {
				System.out.println("서비스 실행 실패");					
			}
				conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
                // db작업에 실패시 이미 업로드되어 버린 파일을 불러와 삭제
				File f = new File(dir+"\\"+goodsImg.getFileName());
				if(f.exists()) {
					f.delete();
				}
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	// Modify
	public int modifyGoods(Goods goods, GoodsImg goodsImg, String dir) {
		goodsDao = new GoodsDao();
		goodsImgDao = new GoodsImgDao();
		Connection conn = null;
		int row = 0;
		try {
			conn = DBUtil.getConnection();
			row = goodsDao.updateGoods(conn, goods);
			if(row == 1) {
				row = goodsImgDao.updateGoods(conn, goodsImg);
				System.out.println("서비스 실행 성공");
			} else {
				System.out.println("서비스 실행 실패");
			}
			conn.commit();
		} catch (Exception e) {
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
		return row;
	}
	
	// Remove
	public int removeGoods(Goods goods, GoodsImg goodsImg) {
		goodsDao = new GoodsDao();
		goodsImgDao = new GoodsImgDao();
		Connection conn = null;
		int row = 0;
		try {
			conn = DBUtil.getConnection();
			row = goodsImgDao.deleteGoods(conn, goodsImg);
			if(row == 1) {
				row = goodsDao.deleteGoods(conn, goods);
				System.out.println("서비스 실행 성공");
			} else {
				System.out.println("서비스 실행 실패");
			}
			conn.commit();
		} catch (Exception e) {
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
		return row;
	}
}