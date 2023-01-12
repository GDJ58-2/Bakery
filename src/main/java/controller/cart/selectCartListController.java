package controller.cart;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;

import service.CartService;
import vo.Customer;
import vo.Cart;

@WebServlet("/cart/cartList")
public class selectCartListController extends HttpServlet {
	private CartService cartService;
	// 장바구니 조회
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		ArrayList<HashMap<String, Object>> userList = (ArrayList<HashMap<String, Object>>)session.getAttribute("userList");
		ArrayList<HashMap<String,Object>> customerList = new ArrayList<HashMap<String,Object>>();
		this.cartService = new CartService();
		
		if(loginCustomer != null) { // 회원
			if(userList == null) { // 비회원장바구니가 비어있을 때
				String custmerId = loginCustomer.getCustomerId();
				customerList = cartService.selectCartList(custmerId);
				request.setAttribute("loginCustomer", loginCustomer);
				request.setAttribute("customerList", customerList);
				session.removeAttribute("userList");
			} else { // 비회원장바구니가 비어있지 않을 때
				String custmerId = loginCustomer.getCustomerId();
				customerList = cartService.selectCartList(custmerId);
				Cart cart = null;
				cart = new Cart();
				int result = 0;
				for(HashMap<String, Object> user : userList) {
					cart.setGoodsCode((int)user.get("goodsCode"));
					cart.setCartQuantity((int)user.get("goodsQuantity"));
					cart.setCustomerId(custmerId);
					this.cartService = new CartService();
					result = cartService.addCart(cart);
				}
				if(result == 1) {
					customerList = cartService.selectCartList(custmerId);
				}
				request.setAttribute("loginCustomer", loginCustomer);
				request.setAttribute("customerList", customerList);
				session.removeAttribute("userList");
			}
		} else { // 비회원
			//System.out.println("userList: "+userList);
			request.setAttribute("loginCustomer", loginCustomer);
			request.setAttribute("userList", userList);
		}
		
		// view
		request.getRequestDispatcher("/WEB-INF/view/cart/cartList.jsp").forward(request, response);
	}
}