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
	// modify Orders action
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 세션 검사
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer==null) {
			response.sendRedirect(request.getContextPath()+"/customer/login");
			return;
		}
		
		// 파라메타값 유효성검사
		String orderState = request.getParameter("orderState");
		if(orderState==null||orderState.equals("")||request.getParameter("orderCode")==null||request.getParameter("orderCode").equals("")) {
			response.sendRedirect(request.getContextPath()+"/orders/ordersList");
			return;
		}
		int orderCode = Integer.parseInt(request.getParameter("orderCode"));
		System.out.println(orderState);
		System.out.println(orderCode);
		
		this.ordersService = new OrdersService();
		HashMap<String, Object> map = ordersService.getOrdersOne(orderCode);
		
		Orders orders = new Orders();
		
		orders.setCustomerId((String)map.get("customerId"));
		orders.setOrderCode(orderCode);
		orders.setOrderState(orderState);
		orders.setGoodsCode((int)map.get("goodsCode"));
		orders.setOrderPrice((int)map.get("orderPrice"));
		orders.setOrderQuantity((int)map.get("orderQuantity"));
		
		System.out.println(orders);
		
		this.ordersService = new OrdersService();
		int point = ordersService.modifyOrders(orders);
		System.out.println(point+"<--ModifyOrdersController point");
		
		String msg = "<script>alert('다시 시도해주세요.'); location.href='/bakery/orders/modifyOrders?orderCode="+orderCode+"';</script>'"; 
		if(point != -1) { 
			msg = "<script>alert('포인트가 적립되었습니다. 소중한 리뷰글을 남겨주세요.'); location.href='/bakery/orders/ordersList';</script>'";
			loginCustomer.setPoint(point); // 세션 포인트 값 변경
			session.setAttribute("loginCustomer", loginCustomer);
		} 
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(msg);
		out.flush();
	}
}