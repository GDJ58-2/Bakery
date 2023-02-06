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
public class CustomerOneController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer == null) { // 로그인 안된 상태
			response.sendRedirect(request.getContextPath() + "/customer/login");
			return;
		}
		
		String customerId = loginCustomer.getCustomerId();
		
		// 비밀번호 변경 완료 메시지
		String checkPw=request.getParameter("checkPw");
		if(checkPw != null) {
			request.setAttribute("checkPw", checkPw);
		} 
		
		// 회원정보 수정 완료 메시지
		String checkInfo=request.getParameter("checkInfo");
		if(checkInfo != null) {
			request.setAttribute("checkInfo", checkInfo);
		} 
		
		CustomerService customerService = new CustomerService();
		Customer selectOneCustomer = customerService.getSelectOneCustomer(customerId); 
		request.setAttribute("selectOneCustomer", selectOneCustomer);
		
		// view
		request.getRequestDispatcher("/WEB-INF/view/customer/myPage.jsp").forward(request, response);
	}
}
