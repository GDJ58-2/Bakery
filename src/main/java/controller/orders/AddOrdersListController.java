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
import service.CustomerAddressService;
import vo.Customer;
import vo.CustomerAddress;

@WebServlet("/orders/addOrdersList")
public class AddOrdersListController extends HttpServlet {
	private CustomerAddressService customerAddressService;
	private CartService cartService;
	// addOrders form
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인 세션 검사
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer==null) {
			response.sendRedirect(request.getContextPath()+"/customer/login");
			return;
		}
		
		// 파라메타 값 유효성검사
		String[] checkedGoodsCodeStr = request.getParameterValues("checkedGoodsCode");
		if(checkedGoodsCodeStr==null) {
			response.sendRedirect(request.getContextPath()+"/cart/cartList");
			return;
		}
		
		// 최종 orderList 출력 : 체크된 goodsCode 목록 
		int[] checkedGoodsCodeInt = new int[checkedGoodsCodeStr.length];
		for(int i=0; i<checkedGoodsCodeStr.length; i++) {
			int j = Integer.parseInt(checkedGoodsCodeStr[i]);
			checkedGoodsCodeInt[i] = j;
			//System.out.println(checkedGoodsCodeInt[i]+"<----checkedGoodsCodeInt[i]");
		}
		this.customerAddressService = new CustomerAddressService();
		this.cartService = new CartService();
		ArrayList<CustomerAddress> addressList = customerAddressService.getAddressList(loginCustomer.getCustomerId());
		ArrayList<HashMap<String, Object>> orderList = cartService.selectCartList(loginCustomer.getCustomerId(), checkedGoodsCodeInt);
		int orderPrice = 0;
		for(HashMap<String, Object> map : orderList) {
			map.put("saveupPoint", (int)((int)map.get("goodsPrice")*(int)map.get("cartQuantity")*0.05));
			orderPrice += (int)map.get("goodsPrice")*(int)map.get("cartQuantity");
		}
		request.setAttribute("addressList", addressList);
		request.setAttribute("orderList", orderList);		
		request.setAttribute("orderPrice", orderPrice);
		request.getRequestDispatcher("/WEB-INF/view/orders/addOrders.jsp").forward(request, response);
	}

}
