package controller.admin.customer;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CustomerService;
import vo.Customer;

@WebServlet("/admin/customer/removeCustomer")
public class RemoveCustomerByAdminController extends HttpServlet {
	private CustomerService customerService;
	// removeCustomer form
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String customerId = request.getParameter("customerId");
		// 파라메타값 유효성검사
		if(customerId==null||customerId.equals("")) {
			response.sendRedirect(request.getContextPath()+"/admin/customer/customerList");
		}
		request.setAttribute("customerId", customerId);
		request.getRequestDispatcher("/WEB-INF/view/admin/customer/removeCustomer.jsp").forward(request, response);
	}
	// removeCustomer action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
