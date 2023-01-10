package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import util.DBUtil;
import dao.ReviewDao;
import vo.Review;
import vo.Orders;

public class ReviewService {
	private ReviewDao reviewDao;
	
	public int addReview(Review review) {
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.reviewDao = new ReviewDao();
			row = reviewDao.insertReview(conn, review);
			if(row == 1) {
				System.out.println("ReviewService: 리뷰작성완료");
			}
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch(SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return row; 
	}
	
	public ArrayList<HashMap<String, Object>> getReviewList(int goodsCode) {
		ArrayList<HashMap<String, Object>> list = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			list = new ArrayList<HashMap<String, Object>>();
			this.reviewDao = new ReviewDao();
			list = reviewDao.reviewList(conn, goodsCode);
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch(SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	
	public ArrayList<HashMap<String, Object>> getCustomerReviewList(String customerId) {
		ArrayList<HashMap<String, Object>> list = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			list = new ArrayList<HashMap<String, Object>>();
			this.reviewDao = new ReviewDao();
			list = reviewDao.customerReviewList(conn, customerId);
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch(SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public ArrayList<HashMap<String, Object>> getNoReviewList(String customerId) {
		ArrayList<HashMap<String, Object>> list = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			list = new ArrayList<HashMap<String, Object>>();
			this.reviewDao = new ReviewDao();
			list = reviewDao.noReviewList(conn, customerId);
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch(SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public HashMap<String, Object> orderReview(Orders orders) {
		HashMap<String, Object> map = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			map = new HashMap<String, Object>();
			this.reviewDao = new ReviewDao();
			map = reviewDao.orderReview(conn, orders);
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch(SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return map;
	}
	
	public HashMap<String, Object> reviewListOne(Orders orders) {
		HashMap<String, Object> map = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			map = new HashMap<String, Object>();
			this.reviewDao = new ReviewDao();
			map = reviewDao.reviewListOne(conn, orders);
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch(SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return map;
	}
	
	public int modifyReview(Review review) {
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.reviewDao = new ReviewDao();
			row = reviewDao.updateReviewList(conn, review);
			if(row == 1) {
				System.out.println("ReviewService: 리뷰수정완료");
			}
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch(SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return row; 
	}
	
	public int removeReview(int orderCode) {
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.reviewDao = new ReviewDao();
			row = reviewDao.deleteReviewList(conn, orderCode);
			if(row == 1) {
				System.out.println("ReviewService: 리뷰삭제완료");
			}
			conn.commit();
		} catch(Exception e) {
			try {
				conn.rollback();
			} catch(SQLException e1) {
				e1.printStackTrace();
			}
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch(SQLException e) {
				e.printStackTrace();
			}
		}
		return row; 
	}
}
