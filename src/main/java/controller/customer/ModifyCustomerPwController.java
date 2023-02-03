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
		// 비밀번호를 변경할 수 없을 때 메시지 넘기기
		String check=request.getParameter("msg");
		//System.out.println(check);
		if(check != null || check != "") {
			request.setAttribute("check", check);
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
		String msg="";
		CustomerService customerService = new CustomerService();
		int row=customerService.modifyCustomerPw(newPw, customer);
		if(row == 0) {
			msg="denied";
			response.sendRedirect(request.getContextPath() + "/customer/modifyCustomerPw?msg="+msg);
		} else {
			//System.out.println("ModifyCustomerPwController: pw수정 완료");
			response.sendRedirect(request.getContextPath() + "/customer/selectOneCustomer");
		}
	}
}
