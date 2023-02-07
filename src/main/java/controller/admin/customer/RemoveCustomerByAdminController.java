package controller.admin.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.CustomerService;
import vo.Customer;
import vo.Emp;

@WebServlet("/admin/customer/removeCustomer")
public class RemoveCustomerByAdminController extends HttpServlet {
	private CustomerService customerService;
	// removeCustomer action
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 세션 검사 
		HttpSession session = request.getSession();
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		if(loginEmp==null) {
			response.sendRedirect(request.getContextPath()+"/admin/emp/loginEmp");
			return;
		}
		// 관리자 권한 검사 
		if(loginEmp.getAuthCode()<1) { 
			response.sendRedirect(request.getContextPath()+"/index");
			return;
		}
		
		String customerId = request.getParameter("customerId");
		// 파라메타값 유효성검사
		if(customerId==null||customerId.equals("")) {
			response.sendRedirect(request.getContextPath()+"/admin/customer/customerList");
		}
		Customer c = new Customer();
		c.setCustomerId(customerId);
		 
		this.customerService = new CustomerService();
		int row = customerService.removeCustomer(c);
		System.out.println(row+"<--RemoveCustomerByAdminController row");
		
		response.sendRedirect(request.getContextPath()+"/admin/customer/customerList");
	}
}