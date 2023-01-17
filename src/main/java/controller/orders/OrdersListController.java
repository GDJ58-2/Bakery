package controller.orders;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.OrdersService;
import vo.Customer;


@WebServlet("/orders/ordersList")
public class OrdersListController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 후에만 진입가능
		HttpSession session = request.getSession();
		
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer == null) { // 로그아웃 상태
			response.sendRedirect(request.getContextPath()+"/customer/login");
			return;
		}
		
		// 페이징
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		request.setAttribute("currentPage", currentPage);
		
		final int ROW_PER_PAGE = 5;
		int beginRow = (currentPage-1)*ROW_PER_PAGE;
		
		int count = 0;
		OrdersService ordersService = new OrdersService();
		count = ordersService.getOrdersCount(); // -> lastPage
		// System.out.println("count : " + count);
		
		int lastPage = (int)Math.ceil((double)count / (double)ROW_PER_PAGE); //마지막 페이지 번호 구하기
		// System.out.println("lastPage : " + lastPage);
		request.setAttribute("lastPage", lastPage);
		
		// 세션의 로그인 된 아이디
		String customerId = loginCustomer.getCustomerId();
		
		OrdersService orderService = new OrdersService();
		ArrayList<HashMap<String, Object>> list = orderService.getOrdersList(customerId, beginRow, ROW_PER_PAGE);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/view/orders/ordersList.jsp").forward(request, response);
	}
}
