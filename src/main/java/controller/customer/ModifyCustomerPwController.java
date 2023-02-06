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
		// 비밀번호 변경 실패 메시지
		String checkPw=request.getParameter("checkPw");
		//System.out.println(check);
		if(checkPw != null) {
			request.setAttribute("checkPw", checkPw);
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
		
		System.out.println("pw: " + pw);
		System.out.println("newPw: " + newPw);
		
		Customer customer = new Customer();
		customer.setCustomerId(loginCustomer.getCustomerId());
		customer.setCustomerPw(pw);
		
		//System.out.println(customer);
		String checkPw=null;
		CustomerService customerService = new CustomerService();
		int row=customerService.modifyCustomerPw(newPw, customer);
		if(row == 0) {
			checkPw="N";
			response.sendRedirect(request.getContextPath() + "/customer/modifyCustomerPw?checkPw="+checkPw);
		} else {
			//System.out.println("ModifyCustomerPwController: pw수정 완료");
			checkPw="Y";
			response.sendRedirect(request.getContextPath() + "/customer/selectOneCustomer?checkPw="+checkPw);
		}
	}
}
