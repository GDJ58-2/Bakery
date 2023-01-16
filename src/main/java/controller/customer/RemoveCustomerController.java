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

@WebServlet("/customer/removeCustomer")
public class RemoveCustomerController extends HttpServlet {
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션 확인
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer == null) { // 로그인 안된 상태
			response.sendRedirect(request.getContextPath() + "/customer/login");
			return;
		}

		// View
		session.setAttribute("loginCustomer", loginCustomer);
	    request.getRequestDispatcher("/WEB-INF/view/customer/removeCustomer.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션 확인
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer == null) { // 로그인 안된 상태
			response.sendRedirect(request.getContextPath() + "/customer/login");
			return;
		}
	
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		Customer customer = new Customer();
		customer.setCustomerId(id);
		CustomerService customerService = new CustomerService();
		int result = customerService.removeCustomer(customer);
		if(result == 1) {
			System.out.println("RemoveCustomerController: 탈퇴완료");
			request.getSession().invalidate();
			response.sendRedirect(request.getContextPath() + "/customer/login");
		}
	}
}
