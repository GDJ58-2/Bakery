package controller.customer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Customer;
import vo.Emp;
import service.CustomerService;

@WebServlet("/customer/login")
public class LoginController extends HttpServlet {
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession();// 로그인 전에만 진입가능
	    Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
	    Emp loginEmp = (Emp)session.getAttribute("loginEmp");
	    if(loginCustomer != null) { // 이미 로그인된 회원
	    	response.sendRedirect(request.getContextPath()+"/customer/myHome");
	        return;
	    } else if (loginEmp != null) { // 이미 로그인 된 관리자
	    	response.sendRedirect(request.getContextPath()+"/index");
	    	return;
	    }
	    
	    // 회원가입 완료 메시지
	    String addMsg = request.getParameter("addMsg");
	    if(addMsg != null) {
	    	System.out.println(addMsg);
	    	request.setAttribute("addMsg", addMsg);
	    }
	    // 로그인 실패 메시지
	    String loginMsg=request.getParameter("loginMsg");
	    if(loginMsg != null) {
	    	request.setAttribute("loginMsg", loginMsg);
	    }
	    
	    // 탈퇴 완료 메시지
 		String removeMsg=request.getParameter("removeMsg");
 		if(removeMsg != null) {
 			request.setAttribute("removeMsg", removeMsg);
 		}

	    
	    // View
	    request.getRequestDispatcher("/WEB-INF/view/customer/login.jsp").forward(request, response);
	}

	// login Action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
	    Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
	    Emp loginEmp = (Emp)session.getAttribute("loginEmp");
	    if(loginCustomer != null) { // 이미 로그인 된 회원
	    	response.sendRedirect(request.getContextPath()+"/customer/myHome");
	        return;
	    } else if (loginEmp != null) { // 이미 로그인 된 관리자
	    	response.sendRedirect(request.getContextPath()+"/index");
	    	return;
	    }
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		if(id.equals("") || pw.equals("")) {
			response.sendRedirect(request.getContextPath()+"/customer/login");
			return;
		}
		
		Customer customer = new Customer();
		customer.setCustomerId(id);
		customer.setCustomerPw(pw);
		customer.setCustomerName(name);
		customer.setCustomerPhone(phone);
		
		CustomerService customerService = new CustomerService();
		Customer returnCustomer = customerService.getLoginCustomer(customer);
		
		String loginMsg = "check";
		if(returnCustomer == null) { // 로그인 실패
			response.sendRedirect(request.getContextPath() + "/customer/login?loginMsg=" + loginMsg);
			return;
		}
		
		session.setAttribute("loginCustomer", returnCustomer); // 세션에 로그인 정보 저장
		response.sendRedirect(request.getContextPath() + "/index");
	}
}
