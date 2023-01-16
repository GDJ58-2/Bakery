package service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import util.DBUtil;
import vo.Customer;
import dao.CustomerDao;
import dao.CartDao;
import dao.PointHistoryDao;

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
			PointHistoryDao pointHistoryDao = new PointHistoryDao();
			this.customerDao = new CustomerDao();
			// 포인트정보 업데이트
			ArrayList<HashMap<String, Object>> pHistory = pointHistoryDao.selectPointHistory(conn, customerId);
			String pKind = null;
			int plusPoint = 0;
			int minusPoint = 0;
			int totalPoint = 0;
			for(HashMap<String, Object> map : pHistory) {
				pKind = (String)map.get("pointKind");
				if(pKind.equals("적립")) {
					plusPoint = (int)map.get("point");
					minusPoint = 0;
				} else {
					minusPoint = (int)map.get("point");
					plusPoint = 0;
				}
				totalPoint = totalPoint + (plusPoint - minusPoint);
			}
			Customer customerPoint = new Customer();
			customerPoint.setCustomerId(customerId);
			customerPoint.setPoint(totalPoint);
			int row = customerDao.customerPoint(conn, customerPoint);
			if(row == 1) {
				customer = customerDao.selectOneCustomer(conn, customerId);
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
		
			boolean checkPw = customerDao.checkCustomerPw(conn, newPw, customer);
			if(checkPw == true) { // pw 중복확인 : true이면 변경 불가한 비밀번호임
				System.out.println("CustomerService: pw 변경불가");
			} else {
				row = customerDao.customerUpdatePw(conn, newPw, customer); // 회원비밀번호 수정
				if(row == 1) {
					System.out.println("CustomerService: pw 수정완료");
					int insertHistory = customerDao.customerNewPwHistory(conn, newPw, customer); // 비밀번호이력 입력
					System.out.println("CustomerService insertHistory: " + insertHistory);
				}
			}
			
			// pw_history 데이터 3개 이상이면 제일 오래된 데이터 삭제
			int cnt = customerDao.cntPwhistory(conn, customer);
			//System.out.println("CustomerService cnt: " + cnt);
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
			CartDao cartDao = new CartDao();
			int pointHistory = customerDao.deleteCustomerPointHistory(conn, customer);
			int deleteCartList = cartDao.deleteCartList(conn, customer.getCustomerId());
			// 디버깅
			if(pointHistory == 1) {
				System.out.println("CustomerService: point_history 삭제완료");
			} else {
				System.out.println("CustomerService: point_history 내역없음");
			}
			if(deleteCartList == 1) {
				System.out.println("CustomerService: cartList 삭제완료");
			} else {
				System.out.println("CustomerService: cartList 내역없음");
			}
			int pwHistory = customerDao.deletePwHistory(conn, customer.getCustomerId());
			//System.out.println(pointHistory+","+pwHistory+","+deleteCartList);
			if(pointHistory == 0 || pointHistory == 1 || pwHistory == 0 || pwHistory == 1 
					|| deleteCartList == 0 || deleteCartList == 1) {
				row = customerDao.customerDelete(conn, customer);
				if(row == 1) {
					customerDao.insertOutid(conn, customer);
					System.out.println("CustomerService: 탈퇴완료");
				} else {
					System.out.println("CustomerService: 탈퇴실패");
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
	
	// 고객목록 출력 - 관리자 기능
	public ArrayList<Customer> getCustomerListByAdmin(String search, int currentPage, int rowPerPage) {
		ArrayList<Customer> list = null;
		Connection conn = null;
		if(search==null) { // 검색어
			search="%%";
		}
		int beginRow = (currentPage-1)*rowPerPage;
		try {
			conn = DBUtil.getConnection();
			this.customerDao = new CustomerDao();
			list = customerDao.selectCustomerListByAdmin(conn,search,beginRow,rowPerPage);
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
				DBUtil.close(null, null, conn);
			} catch (Exception e) {
				e.printStackTrace();
			}	
		}
		return list;
	}
}