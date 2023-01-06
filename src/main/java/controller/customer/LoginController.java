package controller.customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Customer;
import service.CustomerService;

@WebServlet("/customer/login")
public class LoginController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    HttpSession session = request.getSession();// 로그인 전에만 진입가능
	    Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
	    if(loginCustomer != null) { // 이미 로그인 상태
	    	response.sendRedirect(request.getContextPath()+"/customer/home");
	        return;
	    }
	 
	    // View
	    request.getRequestDispatcher("/WEB-INF/view/customer/login.jsp").forward(request, response);
	}

	// login Action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
	    Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
	    if(loginCustomer != null) { // 이미 로그인 상태
	    	response.sendRedirect(request.getContextPath()+"/customer/home");
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
		response.sendRedirect(request.getContextPath() + "/customer/home");
	}
}
