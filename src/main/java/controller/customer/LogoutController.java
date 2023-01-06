package controller.customer;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Customer;

@WebServlet("/customer/logout")
public class LogoutController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션 확인
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer == null) { // 로그인 안된 상태
			response.sendRedirect(request.getContextPath() + "/customer/login");
			return;
		}
		
		request.getSession().invalidate();
		response.sendRedirect(request.getContextPath()+"/customer/login");
	}
}
