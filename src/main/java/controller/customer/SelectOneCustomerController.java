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

@WebServlet("/customer/selectOneCustomer")
public class SelectOneCustomerController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer == null) { // 로그인 안된 상태
			response.sendRedirect(request.getContextPath() + "/customer/login");
			return;
		}
		
		String customerId = loginCustomer.getCustomerId();
		
		CustomerService customerService = new CustomerService();
		Customer selectOneCustomer = customerService.getSelectOneCustomer(customerId); 
		request.setAttribute("selectOneCustomer", selectOneCustomer);
		
		// view
		request.getRequestDispatcher("/WEB-INF/view/customer/myPage.jsp").forward(request, response);
	}
}
