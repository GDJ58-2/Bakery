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

import service.CartService;
import service.OrdersService;
import vo.Customer;
import vo.CustomerAddress;
import vo.Orders;

@WebServlet("/orders/addOrders")
public class AddOrdersController extends HttpServlet {
	private CartService cartService;
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
		
		// 파라메타값 유효성 검사
		String[] goodsCodeStr = request.getParameterValues("goodsCode");
		String[] cartQuantityStr = request.getParameterValues("cartQuantity");
		String addressKind = request.getParameter("addressKind");
		String address = request.getParameter("address");
		if(goodsCodeStr==null||cartQuantityStr==null||addressKind==null||addressKind.equals("")||address==null||address.equals("")) {
			response.sendRedirect(request.getContextPath()+"/cart/cartList");
			return;
		}
		int usePoint = 0;
		if(request.getParameter("usePoint")!=null) {
			usePoint = Integer.parseInt(request.getParameter("usePoint"));
		}
		
		// int 배열로 형변환
		int[] goodsCodeInt = new int[goodsCodeStr.length];
		for(int i=0; i<goodsCodeStr.length; i++) {
			int j = Integer.parseInt(goodsCodeStr[i]);
			goodsCodeInt[i] = j;
			//System.out.println(goodsCodeStr[i]+"<----goodsCodeStr[i]");
		}
		int[] cartQuantityArr = new int[cartQuantityStr.length];
		for(int i=0; i<cartQuantityStr.length; i++) {
			int j = Integer.parseInt(cartQuantityStr[i]);
			cartQuantityArr[i] = j;
			//System.out.println(cartQuantityArr[i]+"<----cartQuantityArr[i]");
		}
		
		this.cartService = new CartService();
		ArrayList<HashMap<String, Object>> list = cartService.selectCartList(loginCustomer.getCustomerId(), goodsCodeInt);
		ArrayList<Orders> ordersList = new ArrayList<Orders>(); // 최종 주문목록 배열
		CustomerAddress paramAddress = new CustomerAddress(0,customerId,addressKind,address,null); 
		// ArrayList<HashMap<String, Object>>  ---> ArrayList<Orders>
		for(HashMap<String, Object> map : list) {
			Orders orders = new Orders(0,(int)map.get("goodsCode"), customerId, 0, (int)map.get("cartQuantity"), (int)map.get("goodsPrice")*(int)map.get("cartQuantity"), null,null);
			ordersList.add(orders);
		}
		this.ordersService = new OrdersService();
		ordersService.addOrders(ordersList, paramAddress, usePoint);
		response.sendRedirect(request.getContextPath()+"/orders/ordersList");
	}
}