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
import vo.CustomerAddress;
import vo.Orders;

@WebServlet("/orders/addOrders")
public class AddOrdersController extends HttpServlet {
	private OrdersService ordersService;
	// addOrders action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 세션 검사
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer==null) {
			response.sendRedirect(request.getContextPath()+"/customer/login");
			return;
		}
		String customerId = loginCustomer.getCustomerId();
		String addressKind = request.getParameter("addressKind");
		String address = request.getParameter("address");
		int usePoint = Integer.parseInt(request.getParameter("usePoint"));

		CustomerAddress paramAddress = new CustomerAddress(0,customerId,addressKind,address,null);
		this.ordersService = new OrdersService();
		ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>)request.getAttribute("list");
		ArrayList<Orders> ordersList = new ArrayList<Orders>();
		
		for(HashMap<String, Object> map : list) {
			Orders orders = new Orders(0,(int)map.get("goodsCode"), customerId, 0, (int)map.get("cartQuantity"), (int)map.get("goodsPrice"), null,null);
			ordersList.add(orders);
		}
		ordersService.addOrders(ordersList, paramAddress, usePoint);
		response.sendRedirect(request.getContextPath()+"/orders/ordersList");
	}
}