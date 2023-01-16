package controller.customerAddress;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CustomerAddressService;
import vo.CustomerAddress;

@WebServlet("/customerAddress/addCustomerAddress")
public class AddCustomerAddressController extends HttpServlet {
	private CustomerAddressService customerAddressService;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 후에만 진입가능
		/*
		HttpSession session = request.getSession();
		
		HashMap<String, Object> loginMember = (HashMap<String, Object>)session.getAttribute("loginMember");
		if(loginMember == null) { // 로그아웃 상태
			response.sendRedirect(request.getContextPath()+"/customer/login");
			return;
		}
		*/
		
		// 메시지가 있을 경우
		request.setCharacterEncoding("UTF-8");
		String msg = null;
		if(request.getParameter("msg") != null) {
			msg = request.getParameter("msg");
		}
		request.setAttribute("msg", msg);
		
		// 세션의 로그인 된 아이디로 수정 예정
		String customerId = "test";
		request.setAttribute("customerId", customerId);
		
		// View
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/customerAddress/addCustomerAddress.jsp");
		
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		// 로그인 후에만 진입가능
		HttpSession session = request.getSession();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 로그아웃 상태
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
		*/
		
		// 파라미터 값 받기
		request.setCharacterEncoding("UTF-8");
		
		String customerId = null;
		String addressKind = null;
		String address = null;
		
		// 방어코드
		if(request.getParameter("customerId") == null || (request.getParameter("customerId")).equals("")) {
			response.sendRedirect(request.getContextPath()+"/customerAddress/customerAddressList");
			return;
		} else {
			customerId = request.getParameter("customerId");
		}
		if(request.getParameter("addressKind") == null || (request.getParameter("addressKind")).equals("")) {
			response.sendRedirect(request.getContextPath()+"/customerAddress/customerAddressList");
			return;
		} else {
			addressKind = request.getParameter("addressKind");
		}
		if(request.getParameter("address") == null || (request.getParameter("address")).equals("")) {
			response.sendRedirect(request.getContextPath()+"/customerAddress/customerAddressList");
			return;
		} else {
			address = request.getParameter("address");
		}
		/*
		if(addressKind.equals("집")) {
			this.customerAddressService = new CustomerAddressService();
			int count = customerAddressService.getAddressCount(customerId, addressKind);
			if(count == 1) {
				String msg = URLEncoder.encode("집 주소는 1개만 입력 가능합니다.", "utf-8");
				response.sendRedirect(request.getContextPath()+"/customerAddress/customerAddressList?msg="+msg);
				return;
			}
		} 
		if(addressKind.equals("회사")) {
			this.customerAddressService = new CustomerAddressService();
			int count = customerAddressService.getAddressCount(customerId, addressKind);
			if(count == 1) {
				String msg = URLEncoder.encode("회사 주소는 1개만 입력 가능합니다.", "utf-8");
				response.sendRedirect(request.getContextPath()+"/customerAddress/customerAddressList?msg="+msg);
				return;
			}
		}
		if(addressKind.equals("기타")) {
			this.customerAddressService = new CustomerAddressService();
			int count = customerAddressService.getAddressCount(customerId, addressKind);
			if(count == 1) {
				String msg = URLEncoder.encode("기타 주소는 1개만 입력 가능합니다.", "utf-8");
				response.sendRedirect(request.getContextPath()+"/customerAddress/customerAddressList?msg="+msg);
				return;
			}
		}
		*/
		CustomerAddress customerAddress = new CustomerAddress();
		customerAddress.setCustomerId(customerId);
		customerAddress.setAddressKind(addressKind);
		customerAddress.setAddress(address);
		
		// 디버깅 코드
		System.out.println("customerId : " + customerId);
		System.out.println("addressKind : " + addressKind);
		System.out.println("address : " + address);
		
		this.customerAddressService = new CustomerAddressService();
		HashMap<String, Object> map = customerAddressService.addAddress(customerAddress);
		int row = (Integer)map.get("row");
		if(row == 1){
			System.out.println("입력성공");
	    	
	    	String msg = URLEncoder.encode("주소가 입력되었습니다.", "utf-8");
	    	
	    	// View
	    	response.sendRedirect(request.getContextPath()+"/customerAddress/customerAddressList?msg="+msg);
	    } else {
	    	System.out.println("입력실패");
	    	
	    	String msg = URLEncoder.encode("주소 입력에 실패하였습니다.", "utf-8");
	    	
	    	// View
	    	response.sendRedirect(request.getContextPath()+"/customerAddress/customerAddressList?msg="+msg);
	    }
	}

}
