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

@WebServlet("/customer/modifyCustomer")
public class ModifyCustomerController extends HttpServlet {
	private CustomerService customerService;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer == null) { // 로그인 안된 상태
			response.sendRedirect(request.getContextPath() + "/customer/login");
			return;
		}
		
		String customerId = loginCustomer.getCustomerId();
		this.customerService = new CustomerService();
		Customer selectCustomer = customerService.getSelectOneCustomer(customerId);
		request.setAttribute("selectCustomer", selectCustomer);
		
		// view
		request.getRequestDispatcher("/WEB-INF/view/customer/modifyCustomer.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer == null) { // 로그인 안된 상태
			response.sendRedirect(request.getContextPath() + "/customer/login");
			return;
		}
		
		request.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String pw = request.getParameter("pw");
		
		Customer customer = new Customer();
		customer.setCustomerName(name);
		customer.setCustomerPhone(phone);
		customer.setCustomerPw(pw);
		customer.setCustomerId(loginCustomer.getCustomerId());
		
		this.customerService = new CustomerService();
		int modifyResult = customerService.modifyCustomer(customer);
		if(modifyResult == 1) {
			System.out.println("ModifyCustomerController: 회원정보수정완료");
			loginCustomer.setCustomerName(name);
		}
		
		session.setAttribute("loginCustomer", loginCustomer);
		response.sendRedirect(request.getContextPath() + "/customer/selectOneCustomer");
	}
}
