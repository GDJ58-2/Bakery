package service;

import java.sql.Connection;
import java.sql.SQLException;

import util.DBUtil;
import vo.Customer;
import dao.CustomerDao;

public class CustomerService {
	private CustomerDao customerDao;
	
	// 로그인
	public Customer getLoginCustomer(Customer customer) {
		Customer loginCustomer = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.customerDao = new CustomerDao();
			loginCustomer = customerDao.loginCustomer(conn, customer);
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
		return loginCustomer;
	}
	
	// 회원가입
	public int addCustomer(Customer customer) { // 아이디 중복검사, pw_history db입력
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.customerDao = new CustomerDao();
			boolean checkId = customerDao.checkCustomerId(conn, customer);
			if(checkId == true) { // 아이디 중복확인

			} else {
				row = customerDao.insertCustomer(conn, customer); // 새 회원 db 입력
				int resultInsert = customerDao.customerNewPwHistory(conn, customer); // 비밀번호이력 db 입력 
				if(resultInsert == 1) {
					System.out.println("CustomerService: new pw_history 입력성공");
				}
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
	
	// 회원정보조회
	public Customer getSelectOneCustomer(String customerId) {
		Customer customer = null;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.customerDao = new CustomerDao();
			customer = customerDao.selectOneCustomer(conn, customerId);
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
		return customer;
	}
	
	// 회원정보수정
	public int modifyCustomer(Customer customer) { // 이름, 전화번호 변경
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.customerDao = new CustomerDao();
			row = customerDao.customerUpdate(conn, customer);
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
	
	// 회원 비밀번호 수정
	public int modifyCustomerPw(String newPw, Customer customer) {
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.customerDao = new CustomerDao();
		
			boolean checkPw = customerDao.checkCustomerPw(conn, newPw);
			if(checkPw == true) { // pw 중복확인 : true이면 변경 불가한 비밀번호임
				System.out.println("CustomerService: true");
			} else {
				row = customerDao.customerUpdatePw(conn, newPw, customer); // 회원비밀번호 수정
				if(row == 1) {
					System.out.println("CustomerService: pw 수정완료");
					customerDao.customerNewPwHistory(conn, newPw, customer); // 비밀번호이력 입력
				}
			}
			
			// pw_history 데이터 3개 이상이면 제일 오래된 데이터 삭제
			int cnt = customerDao.cntPwhistory(conn, customer);
			if(cnt > 3) {
				int deleteHistory = customerDao.deletePwHistory(conn, customer);
				if(deleteHistory == 1) {
					System.out.println("CustomerService: pw_history 삭제성공");
				}
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
	
	// 회원탈퇴
	public int removeCustomer(Customer customer) {
		int row = 0;
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			this.customerDao = new CustomerDao();
			row = customerDao.customerDelete(conn, customer);
			if(row == 1) {
				customerDao.insertOutid(conn, customer);
				System.out.println("CustomerService: 탈퇴완료");
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
