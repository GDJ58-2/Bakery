package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import dao.CustomerDao;
import dao.EmpDao;
import util.DBUtil;
import vo.Emp;

public class EmpService {
	private EmpDao empDao;
	// login
	public Emp loginByEmp(Emp paramEmp) { 
		Emp returnEmp = null;
		this.empDao = new EmpDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			returnEmp = empDao.selectIdPwByEmp(conn, paramEmp);
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
				DBUtil.close(null, null, conn); // db 자원반납
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return returnEmp;
	}
	
	// 회원가입 - emp
	public int addEmp(Emp emp) {
		int row = 0;
		boolean checkId = false;
		this.empDao = new EmpDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			if(checkId) { 
				return row;
			}
			row = empDao.insertEmp(conn, emp);
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
				DBUtil.close(null, null, conn); // db 자원반납
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	// 비밀번호 변경 - emp
	public int modifyEmpPw(HashMap<String, Object> map) { 
		int row = 0;
		this.empDao = new EmpDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = empDao.updateEmpPw(conn, map);
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
				DBUtil.close(null, null, conn); // db 자원반납
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	// 상세보기 
	public Emp getEmpOne(int empCode) { 
		Emp emp = null;
		this.empDao = new EmpDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			emp = empDao.selectEmpOne(conn, empCode);
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
				DBUtil.close(null, null, conn); // db 자원반납
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return emp;
	}
	
	// 권한, 활성상태 수정
	public int modifyEmpByAdmin(Emp emp) {
		int row = 0;
		this.empDao = new EmpDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = empDao.updateEmpByAdmin(conn, emp);
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
				DBUtil.close(null, null, conn); // db 자원반납
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return row;
	}
	
	// empList 출력
	public ArrayList<HashMap<String, Object>> getEmpListByAdmin(int currentPage, int rowPerPage, String search) { 
		ArrayList<HashMap<String, Object>> list = null;
		this.empDao = new EmpDao();
		Connection conn = null;
		if(search==null) {
			search="";
		}
		int beginRow = (currentPage-1)*rowPerPage;
		try {
			conn = DBUtil.getConnection();
			list = empDao.selectEmpListByAdmin(conn, beginRow, rowPerPage, search);
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
				DBUtil.close(null, null, conn); // db 자원반납
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	// 페이징 - 전체 행수
	public int getEmpCount(String search) {
		int count = 0;
		this.empDao = new EmpDao();
		Connection conn = null;
		if(search==null) {
			search="";
		}
		try {
			conn = DBUtil.getConnection();
			count = empDao.selectEmpCount(conn, search);
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
				DBUtil.close(null, null, conn); // db 자원반납
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return count;
	}
	
	// 통계:월별
	public ArrayList<HashMap<String, Object>> getSelectMonthStats(String year) {
		ArrayList<HashMap<String, Object>> list = null;
		this.empDao = new EmpDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			list = empDao.selectMonthStats(conn, year);
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
				DBUtil.close(null, null, conn); // db 자원반납
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	// 통계:연도별
	public ArrayList<HashMap<String, Object>> getSelectYearStats() {
		ArrayList<HashMap<String, Object>> list = null;
		this.empDao = new EmpDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			list = empDao.selectYearStats(conn);
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
				DBUtil.close(null, null, conn); // db 자원반납
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	// 통계:상품랭킹
	public ArrayList<HashMap<String, Object>> getSelectProductRankingMonth(String year, String month) {
		ArrayList<HashMap<String, Object>> list = null;
		this.empDao = new EmpDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			list = empDao.selectProductRankingMonth(conn, year, month);
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
				DBUtil.close(null, null, conn); // db 자원반납
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
	
	// 통계:상품랭킹
	public ArrayList<HashMap<String, Object>> getSelectProductRankingCategory(String year, String categoryNo) {
		ArrayList<HashMap<String, Object>> list = null;
		this.empDao = new EmpDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			list = empDao.selectProductRankingCategory(conn, year, categoryNo);
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
				DBUtil.close(null, null, conn); // db 자원반납
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return list;
	}
}