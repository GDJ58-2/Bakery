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
		
		System.out.println(goodsCodeStr.length+"<-- goodsCodeStr.length addOrders action, AddOrdersController");
		System.out.println(addressKind+"<-- addressKind addOrders action, AddOrdersController");
		System.out.println(address+"<-- address addOrders action, AddOrdersController");
		
		if(goodsCodeStr==null||cartQuantityStr==null||addressKind==null||addressKind.equals("")) {
			response.sendRedirect(request.getContextPath()+"/cart/cartList");
			return;
		}
		
		int usePoint = 0;
		if(request.getParameter("usePoint")!=null&&!request.getParameter("usePoint").equals("")) {
			usePoint = Integer.parseInt(request.getParameter("usePoint"));
		}
		
		// 선택된 장바구니(굿즈코드, 담긴 상품) int 배열로 형변환
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
		ArrayList<HashMap<String, Object>> list = cartService.getCartList(customerId, goodsCodeInt);
		ArrayList<Orders> ordersList = new ArrayList<Orders>(); // 최종 주문목록 
		CustomerAddress paramAddress = new CustomerAddress(0,customerId,addressKind,address,null); // 바인딩
		// ArrayList<HashMap<String, Object>>  ---> ArrayList<Orders> 변환
		for(HashMap<String, Object> map : list) {
			Orders orders = new Orders(0,(int)map.get("goodsCode"), customerId, 0, (int)map.get("cartQuantity"), (int)map.get("goodsPrice")*(int)map.get("cartQuantity"), null,null);
			ordersList.add(orders);
		}
		this.ordersService = new OrdersService();
		HashMap<String, Object> map = ordersService.addOrders(ordersList, paramAddress, usePoint); // 주문
		
		String msg = "<script>alert('주문 실패했습니다. 다시 시도해주세요.'); location.href='/bakery/cart/cartList'; </script>";
		if((int)map.get("row")==1) { // 주문 성공
			int currentPoint = loginCustomer.getPoint();
			loginCustomer.setPoint(currentPoint-usePoint); // 세션에 저장된 포인트값 변경
			System.out.println(loginCustomer.getPoint()+"<--AddOrdersController point");
			msg = "주문이 완료되었습니다.";
			response.sendRedirect(request.getContextPath()+"/orders/ordersOne?orderCode="+(int)map.get("orderCode")+"&msg="+msg);
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println(msg);
			out.flush();
		}
	}
}