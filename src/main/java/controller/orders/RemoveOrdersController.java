package controller.orders;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.OrdersService;

@WebServlet("/orders/removeOrders")
public class RemoveOrdersController extends HttpServlet {
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
		
		// 세션의 로그인 된 아이디로 수정 예정
		String customerId = "test";
		
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
		}
		// 디버깅 코드
		// System.out.println("orderCode : " + orderCode);
		// System.out.println("createdate : " + createdate);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<HashMap<String, Object>> list = new ArrayList<HashMap<String, Object>>();
		OrdersService ordersService = new OrdersService();
		map = ordersService.getOrdersOne(orderCode);
		String orderdate = ((String)map.get("createdate")).substring(0, 10);
		list = ordersService.getOrdersOneList(createdate, customerId);
		
		request.setAttribute("map", map);
		request.setAttribute("orderdate", orderdate);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/view/orders/removeOrders.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 후에만 진입가능
		/*
		HttpSession session = request.getSession();
		
		HashMap<String, Object> loginMember = (HashMap<String, Object>)session.getAttribute("loginMember");
		if(loginMember == null) { // 로그아웃 상태
			response.sendRedirect(request.getContextPath()+"/customer/login");
			return;
		}
		*/
		
		// 주문 삭제
		int orderCode = 0;
		String createdate = null;
		
		// 방어코드
		if(request.getParameter("orderCode") == null || request.getParameter("orderCode").equals("")){
			response.sendRedirect(request.getContextPath()+"/orders/ordersOne");
			return;
		} else {
			orderCode = Integer.parseInt(request.getParameter("orderCode"));
		}
		if(request.getParameter("createdate") == null || request.getParameter("createdate").equals("")){
			response.sendRedirect(request.getContextPath()+"/orders/ordersOne");
			return;
		} else {
			createdate = request.getParameter("createdate");
		}
		
		// 디버깅 코드
		// System.out.println("orderCode : " + orderCode);
		// System.out.println("createdate : " + createdate);
		
		int row = 0;
		OrdersService ordersService = new OrdersService();
		row = ordersService.removeOrders(createdate);
		if(row != 0) {
			System.out.println("삭제성공");    	
	    	
	    	response.setContentType("text/html; charset=UTF-8");
	    	
	    	PrintWriter out = response.getWriter();
	    	 
	    	out.println("<script>alert('주문내역이 삭제되었습니다.'); location.href='/bakery/orders/ordersList';</script>");
	    	
	    	out.flush();
		} else {
			System.out.println("삭제실패");
	    	
	    	String msg = URLEncoder.encode("주문삭제를 실패하였습니다.", "utf-8");
	    	
	    	// View
	    	response.sendRedirect(request.getContextPath()+"/orders/removeOrders?orderCode="+orderCode+"&createdate="+createdate+"&msg="+msg);
		}
	}
}