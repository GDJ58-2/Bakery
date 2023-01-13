package controller.customerAddress;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CustomerAddressService;
import vo.CustomerAddress;

@WebServlet("/customerAddress/customerAddressList")
public class CustomerAddressListController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 후에만 진입가능
		/*
		HttpSession session = request.getSession();
		
		HashMap<String, Object> loginMember = (HashMap<String, Object>)session.getAttribute("loginMember");
		if(loginMember == null) { // 로그아웃 상태
			response.sendRedirect(request.getContextPath()+"/customer/login");
			return;
		}
		*/
		
		// 메시지가 있을 경우
		request.setCharacterEncoding("UTF-8");
		String msg = null;
		if(request.getParameter("msg") != null) {
			msg = request.getParameter("msg");
		}
		request.setAttribute("msg", msg);
		
		// 세션의 로그인 된 아이디로 수정 예정
		String customerId = "test";
		
		CustomerAddressService customerAddressService = new CustomerAddressService();
		ArrayList<CustomerAddress> list = customerAddressService.getAddressList(customerId);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/view/customerAddress/customerAddressList.jsp").forward(request, response);
	}
}
