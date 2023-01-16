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

@WebServlet("/customerAddress/modifyCustomerAddress")
public class ModifyCustomerAddressController extends HttpServlet {
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
		
		int addressCode = 0;
		// 방어코드
		if(request.getParameter("addressCode") != null){
			addressCode = Integer.parseInt(request.getParameter("addressCode"));
			System.out.println("addressCode : " + addressCode);
		} 
		
		CustomerAddress ca = new CustomerAddress();
		this.customerAddressService = new CustomerAddressService();
		
		ca = customerAddressService.getAddressOne(addressCode);
		
		request.setAttribute("ca", ca);
		
		// View
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/customerAddress/modifyCustomerAddress.jsp");
		
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
		
		String customerId = "test";
		
		// 파라미터 값 받기
		request.setCharacterEncoding("UTF-8");
		
		int addressCode = 0;
		String address = null;
		String addressKind = null;
		
		// 방어코드
		if(request.getParameter("addressCode") == null || (request.getParameter("addressCode")).equals("")) {
			response.sendRedirect(request.getContextPath()+"/customerAddress/modifyCustomerAddress?addressCode="+addressCode);
			return;
		} else {
			addressCode = Integer.parseInt(request.getParameter("addressCode"));
		}
		if(request.getParameter("address") == null || (request.getParameter("address")).equals("")) {
			response.sendRedirect(request.getContextPath()+"/customerAddress/modifyCustomerAddress?addressCode="+addressCode);
			return;
		} else {
			address = request.getParameter("address");
		}
		if(request.getParameter("addressKind") == null || (request.getParameter("addressKind")).equals("")) {
			response.sendRedirect(request.getContextPath()+"/customerAddress/modifyCustomerAddress?addressCode="+addressCode);
			return;
		} else {
			addressKind = request.getParameter("addressKind");
		}
		
		CustomerAddress customerAddress = new CustomerAddress();
		// customerAddress.setAddressCode(addressCode);
		customerAddress.setAddress(address);
		customerAddress.setAddressKind(addressKind);
		customerAddress.setCustomerId(customerId);
		
		// 디버깅 코드
		// System.out.println("addressCode : " + addressCode);
		System.out.println("address : " + address);
		System.out.println("addressKind : " + addressKind);
		System.out.println("customerId : " + customerId);
		
		this.customerAddressService = new CustomerAddressService();
		HashMap<String, Object> map = customerAddressService.addAddress(customerAddress);
		int row = (Integer)map.get("row");
		if(row == 1){
			System.out.println("입력성공");
	    	
	    	String msg = URLEncoder.encode("주소가 수정되었습니다.", "utf-8");
	    	
	    	// View
	    	response.sendRedirect(request.getContextPath()+"/customerAddress/customerAddressList?msg="+msg);
	    } else {
	    	System.out.println("입력실패");
	    	
	    	String msg = URLEncoder.encode("주소 수정에 실패하였습니다.", "utf-8");
	    	
	    	// View
	    	response.sendRedirect(request.getContextPath()+"/customerAddress/customerAddressList?msg="+msg);
	    }
	}

}
