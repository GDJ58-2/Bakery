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
import java.util.Map.Entry;

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
			if(userList == null) {
				String custmerId = loginCustomer.getCustomerId();
				customerList = cartService.selectCartList(custmerId);
				//System.out.println("null_customerList: "+customerList);
				request.setAttribute("loginCustomer", loginCustomer);
				request.setAttribute("customerList", customerList);
				session.removeAttribute("userList");
			} else {
				customerList = userList;
				session.removeAttribute("userList");
				//System.out.println("customerList: "+customerList);
				request.setAttribute("loginCustomer", loginCustomer);
				request.setAttribute("customerList", customerList);
			}
				
		} else { // 비회원
			System.out.println("userList: "+userList);
			request.setAttribute("loginCustomer", loginCustomer);
			request.setAttribute("userList", userList);
		} 
		
		// view
		request.getRequestDispatcher("/WEB-INF/view/cart/cartList.jsp").forward(request, response);
	}
}
