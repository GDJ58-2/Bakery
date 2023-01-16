package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

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
	
	// 아이디 중복확인
	public boolean checkId(String empId) {
		boolean checkId = false;
		this.empDao = new EmpDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			checkId = empDao.selectId(conn, empId);
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
		return checkId;
	}
	
	 // 회원가입 - emp
	public int addEmp(Emp emp) {
		int row = 0;
		boolean checkId = false;
		this.empDao = new EmpDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			checkId = empDao.selectId(conn, emp.getEmpId());
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
		if(emp.getActive().equals("N")) { // 비활성화상태라면 관리자권한도 비활성화(0)
			emp.setAuthCode(0);
		}
		if(emp.getAuthCode()==0) { 
			emp.setActive("N");
		}
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
	public ArrayList<HashMap<String, Object>> getEmpListByAdmin() { 
		ArrayList<HashMap<String, Object>> list = null;
		this.empDao = new EmpDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			list = empDao.selectEmpListByAdmin(conn);
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