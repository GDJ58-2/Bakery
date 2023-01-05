package service;

import java.sql.Connection;
import java.sql.SQLException;

import dao.EmpDao;
import util.DBUtil;
import vo.Emp;

public class EmpService {
	private EmpDao empDao;
	public int addEmp(Emp emp) { // 직원 등록
		int row = 0;
		this.empDao = new EmpDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = this.empDao.insertEmp(conn, emp);
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
	public int modifyEmpPw(Emp emp) { // 직원 비밀번호 변경 
		int row = 0;
		this.empDao = new EmpDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = this.empDao.updateEmpPw(conn, emp);
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
}