package controller.cart;

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
import vo.Cart;
import vo.Customer;
import vo.CustomerAddress;


@WebServlet("/cart/modifyCart")
public class ModifyCartController extends HttpServlet {
	private CustomerAddressService customerAddressService;
	private CartService cartService;
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 세션 검사
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer==null) {
			response.sendRedirect(request.getContextPath()+"/customer/login");
			return;
		}
		// 장바구니 수정
		String[] goodsCodeStr = request.getParameterValues("goodsCode");
		int[] goodsCodeInt = new int[goodsCodeStr.length];
		//System.out.println("goods"+goodsCodeStr.length);
		//System.out.println(goodsCodeInt.length);
		for(int i=0; i<goodsCodeStr.length; i++) {
			int j = Integer.parseInt(goodsCodeStr[i]);
			goodsCodeInt[i] = j;
			//System.out.println(goodsCodeStr[i]+"<----goodsCodeStr[i]");
		}
		String[] cartQuantityStr = request.getParameterValues("cartQuantity");
		int[] cartQuantityArr = new int[cartQuantityStr.length];

		//System.out.println("cart"+cartQuantityStr.length);
		//System.out.println(cartQuantityArr.length);
		for(int i=0; i<cartQuantityStr.length; i++) {
			int j = Integer.parseInt(cartQuantityStr[i]);
			cartQuantityArr[i] = j;
			//System.out.println(cartQuantityArr[i]+"<----cartQuantityArr[i]");
		}
		System.out.println(goodsCodeStr.length==cartQuantityStr.length);
		
		ArrayList<Cart> cartList = new ArrayList<Cart>();
		this.cartService = new CartService();
		for(int i=0; i<goodsCodeInt.length; i++) {
			Cart cart = new Cart(goodsCodeInt[i], loginCustomer.getCustomerId(), cartQuantityArr[i], null);
			cartList.add(cart);
		}
		for(Cart c : cartList) {
			cartService.modifyCart(c);
		}
		
		
		if(request.getParameterValues("checkedGoodsCode")!=null) { // cartList에서 넘어온 경우
			// 체크된 goodsCode 목록 
			String[] checkedGoodsCodeStr = request.getParameterValues("checkedGoodsCode");
			int[] checkedGoodsCodeInt = new int[checkedGoodsCodeStr.length];
			//System.out.println("check"+checkedGoodsCodeStr.length);
			//System.out.println(checkedGoodsCodeInt.length);
			for(int i=0; i<checkedGoodsCodeStr.length; i++) {
				int j = Integer.parseInt(checkedGoodsCodeStr[i]);
				checkedGoodsCodeInt[i] = j;
				//System.out.println(checkedGoodsCodeInt[i]+"<----checkedGoodsCodeInt[i]");
			}
			this.customerAddressService = new CustomerAddressService();
			ArrayList<CustomerAddress> addressList = customerAddressService.getAddressList(loginCustomer.getCustomerId());
			ArrayList<HashMap<String, Object>> orderList = cartService.selectCartList(loginCustomer.getCustomerId(), checkedGoodsCodeInt);
			request.setAttribute("addressList", addressList);
			request.setAttribute("orderList", orderList);
			request.getRequestDispatcher("/orders/addOrdersList").forward(request, response);
		} else { // addOrders에서 넘어온 경우
			ArrayList<HashMap<String, Object>> orderList = cartService.selectCartList(loginCustomer.getCustomerId(), goodsCodeInt);
			request.setAttribute("list", orderList);
			request.getRequestDispatcher("/orders/addOrders").forward(request, response);
		}
		
	}
}