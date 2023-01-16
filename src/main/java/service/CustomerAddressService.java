package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import dao.CustomerAddressDao;
import util.DBUtil;
import vo.CustomerAddress;

public class CustomerAddressService {
	private CustomerAddressDao customerAddressDao;
	// GET
	// 집, 회사, 기타 주소 개수 파악
	public int getAddressCount(String customerId, String addressKind) {
		int count = 0;
		this.customerAddressDao = new CustomerAddressDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			count = customerAddressDao.selectAddressCount(conn, customerId, addressKind);
			System.out.println("count : " + count);
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
	
	// 리스트
	public ArrayList<CustomerAddress> getAddressList(String customerId) {
		ArrayList<CustomerAddress> list = null;
		this.customerAddressDao = new CustomerAddressDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			list = customerAddressDao.selectAddressList(conn, customerId);
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
	
	// 열 값 한 개
	public CustomerAddress getAddressOne(int addressCode) {
		CustomerAddress ca = null;
		this.customerAddressDao = new CustomerAddressDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			ca = customerAddressDao.selectAddressOne(conn, addressCode);
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
		return ca;
	}

	public int getAddressCode(CustomerAddress address) {
		int addressCode = 0;
		this.customerAddressDao = new CustomerAddressDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			addressCode = customerAddressDao.selectAddressCode(conn, address);
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
				DBUtil.close(null, null, conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return addressCode;
	}
	
	// ADD
	public int addAddressOne(CustomerAddress address) {
		int row = 0;
		this.customerAddressDao = new CustomerAddressDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = customerAddressDao.insertAddressOne(conn, address);
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
				DBUtil.close(null, null, conn);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return row;
	}
		
	// addressKind(집, 회사, 기타)별로 한개씩만 입력가능 
	public int addAddress(CustomerAddress address) {
		int addressCode = 0;
		this.customerAddressDao = new CustomerAddressDao();
		Connection conn = null;
		System.out.println(address);
		try {
			conn = DBUtil.getConnection();
			int count = customerAddressDao.selectAddressCount(conn, address.getCustomerId(), address.getAddressKind());
			System.out.println(count+"<--<--CustomerAddressService count");
			if(count==0) {
				addressCode=customerAddressDao.insertAddress(conn, address);
			} else {
				addressCode=customerAddressDao.selectAddressCode(conn, address);
				if(address.getAddressKind().equals("기타")) { // 기타선택시 업데이트
					System.out.println(address.getAddressKind()+"<--CustomerAddressService getAddressKind()");
					System.out.println(addressCode+"<--CustomerAddressService addressCode");
					address.setAddressCode(addressCode);
					int row = customerAddressDao.updateAddress(conn, address);
					System.out.println(row+"<--<--CustomerAddressService row");
				}
			}
			System.out.print(addressCode+"<--CustomerAddressService addressCode");
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
		return addressCode;
	}
	
	// MODIFY
	public int modifyAddress(CustomerAddress address) {
		int row = 0;
		this.customerAddressDao = new CustomerAddressDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = customerAddressDao.updateAddress(conn, address);
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
	
	// REMOVE
	public int removeAddress(int addressCode) {
		int row = 0;
		this.customerAddressDao = new CustomerAddressDao();
		Connection conn = null;
		try {
			conn = DBUtil.getConnection();
			row = customerAddressDao.deleteAddress(conn, addressCode);
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
