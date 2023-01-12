package controller.orders;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.OrdersService;

@WebServlet("/orders/ordersOne")
public class OrdersOneController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인 후에만 진입가능
		/*
		HttpSession session = request.getSession();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 로그아웃 상태
			response.sendRedirect(request.getContextPath()+"/member/login");
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
		
		// 주문 상세보기
		int orderCode = 0;
		String createdate = null;
		
		if(request.getParameter("orderCode") == null || request.getParameter("orderCode").equals("")){
			response.sendRedirect(request.getContextPath()+"/orders/ordersList");
			return;
		} else {
			orderCode = Integer.parseInt(request.getParameter("orderCode"));
		}
		if(request.getParameter("createdate") == null || request.getParameter("createdate").equals("")){
			response.sendRedirect(request.getContextPath()+"/orders/ordersList");
			return;
		} else {
			createdate = request.getParameter("createdate");
			createdate = createdate.substring(0, 10);
		}
		// 디버깅 코드
		// System.out.println("orderCode : " + orderCode);
		// System.out.println("createdate : " + createdate);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		OrdersService ordersService = new OrdersService();
		map = ordersService.getOrdersOne(orderCode);
		list = ordersService.getOrdersOneList(createdate);
		
		request.setAttribute("map", map);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/view/orders/ordersOne.jsp").forward(request, response);
	}
}