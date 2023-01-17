package controller.orders;

import java.io.IOException;
import java.io.PrintWriter;
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
import vo.Orders;

@WebServlet("/orders/modifyOrders")
public class ModifyOrdersController extends HttpServlet {
	private OrdersService ordersService;
	// modify Orders form
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 세션 검사
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer==null) {
			response.sendRedirect(request.getContextPath()+"/customer/login");
			return;
		}
		
		// 파라메타값 유효성검사
		if(request.getParameter("orderCode")==null||request.getParameter("orderCode").equals("")) {
			response.sendRedirect(request.getContextPath()+"/orders/ordersList");
			return;
		}
		int orderCode = Integer.parseInt(request.getParameter("orderCode"));
		this.ordersService = new OrdersService();
		HashMap<String, Object> map = ordersService.getOrdersOne(orderCode);
		request.setAttribute("map", map);
		request.getRequestDispatcher("/WEB-INF/view/orders/modifyOrders.jsp").forward(request, response);
	}
	// modify Orders action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 세션 검사
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer==null) {
			response.sendRedirect(request.getContextPath()+"/customer/login");
			return;
		}
		
		// 파라메타값 유효성검사
		String orderState = request.getParameter("orderState");
		if(orderState==null||orderState.equals("")||request.getParameter("orderCode")==null||request.getParameter("orderCode").equals("")||request.getParameter("orderQuantity")==null||request.getParameter("orderQuantity").equals("")
				||request.getParameter("orderPrice")==null||request.getParameter("orderPrice").equals("")) {
			response.sendRedirect(request.getContextPath()+"/orders/ordersList");
			return;
		}
		int orderQuantity = Integer.parseInt(request.getParameter("orderQuantity"));
		int orderPrice = Integer.parseInt(request.getParameter("orderPrice"));
		int orderCode = Integer.parseInt(request.getParameter("orderCode"));
		
		Orders orders = new Orders();
		orders.setOrderCode(orderCode);
		orders.setOrderQuantity(orderQuantity);
		orders.setOrderPrice(orderPrice);
		orders.setOrderState(orderState);
		System.out.println(orders);
		
		this.ordersService = new OrdersService();
		int row = ordersService.modifyOrders(orders);
		System.out.println(row+"<--ModifyOrdersController row");
		
		String msg = "<script>alert('다시 시도해주세요.'); location.href='/bakery/orders/modifyOrders?orderCode="+orderCode+"';</script>'"; 
		if(row==1) { // emp 회원가입 성공
			msg = "<script>alert('포인트가 적립되었습니다. 소중한 리뷰글을 남겨주세요.'); location.href='/bakery/orders/ordersList';</script>'";
		} 
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(msg);
		out.flush();
	}
}