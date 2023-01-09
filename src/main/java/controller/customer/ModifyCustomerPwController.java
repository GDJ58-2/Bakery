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

@WebServlet("/customer/modifyCustomerPw")
public class ModifyCustomerPwController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer == null) { // 로그인 안된 상태
			response.sendRedirect(request.getContextPath() + "/customer/login");
			return;
		}
		
		// view
		request.getRequestDispatcher("/WEB-INF/view/customer/modifyCustomerPw.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer == null) { // 로그인 안된 상태
			response.sendRedirect(request.getContextPath() + "/customer/login");
			return;
		}
		
		request.setCharacterEncoding("utf-8");
		String pw = request.getParameter("pw");
		String newPw = request.getParameter("newPw");
		
		//System.out.println("pw: " + pw);
		//System.out.println("newPw: " + newPw);
		
		Customer customer = new Customer();
		customer.setCustomerId(loginCustomer.getCustomerId());
		customer.setCustomerPw(pw);
		
		//System.out.println(customer);
		
		CustomerService customerService = new CustomerService();
		customerService.modifyCustomerPw(newPw, customer);
		//System.out.println("ModifyCustomerPwController: pw수정 완료");
		response.sendRedirect(request.getContextPath() + "/customer/selectOneCustomer");
	}
}
