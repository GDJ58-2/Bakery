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


@WebServlet("/cart/modifyCart")
public class ModifyCartController extends HttpServlet {
	private CustomerAddressService customerAddressService;
	private CartService cartService;
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 세션 검사
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		ArrayList<HashMap<String, Object>> userList = (ArrayList<HashMap<String, Object>>)session.getAttribute("userList");
		ArrayList<HashMap<String,Object>> customerList = new ArrayList<HashMap<String,Object>>();
		int goodsCode = Integer.parseInt(request.getParameter("goodsCode"));
		String filename = null;
		String goodsName = null;
		int cartQuantity = 0;
		this.cartService = new CartService();
		if(loginCustomer == null) {
			
			for(HashMap<String, Object> m : userList) {
				if(goodsCode == (int)m.get("goodsCode")) {
					filename = (String)m.get("filename");
					goodsName = (String)m.get("goodsName");
					cartQuantity = (int)m.get("carQuantity");
				}
			}
			HashMap<String, Object> userListOne = new HashMap<String, Object>();
			userListOne.put("goodsCode", goodsCode);
			userListOne.put("filename", filename);
			userListOne.put("goodsName", goodsName);
			userListOne.put("cartQuantity", cartQuantity);
			request.setAttribute("loginCustomer", loginCustomer);
			request.setAttribute("userListOne", userListOne);
		} else {
			String custmerId = loginCustomer.getCustomerId();
			customerList = cartService.getCartList(custmerId);
			for(HashMap<String, Object> m : customerList) {
				if(goodsCode == (int)m.get("goodsCode")) {
					filename = (String)m.get("filename");
					goodsName = (String)m.get("goodsName");
					cartQuantity = (int)m.get("cartQuantity");
				}
			}
			HashMap<String, Object> customerListOne = new HashMap<String, Object>();
			customerListOne.put("goodsCode", goodsCode);
			customerListOne.put("filename", filename);
			customerListOne.put("goodsName", goodsName);
			customerListOne.put("cartQuantity", cartQuantity);
			request.setAttribute("loginCustomer", loginCustomer);
			request.setAttribute("customerListOne", customerListOne);
		}

		// View
	    request.getRequestDispatcher("/WEB-INF/view/cart/modifyCartList.jsp").forward(request, response);
		
	}
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 세션 검사
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		ArrayList<HashMap<String, Object>> userList = (ArrayList<HashMap<String, Object>>)session.getAttribute("userList");
		int cartQuantity = Integer.parseInt(request.getParameter("cartQuantity"));
		int goodsCode = Integer.parseInt(request.getParameter("goodsCode"));
		//System.out.println(cartQuantity + "," + goodsCode);
		this.cartService = new CartService();
		String msg = null;
		if(loginCustomer == null) { // 비회원
			int goodsNum = 0;
			int quantityNum = 0;
			for(HashMap<String, Object> user : userList) {
				goodsNum = (int)user.get("goodsCode");
				quantityNum = (int)user.get("cartQuantity");
				if(goodsCode == goodsNum && cartQuantity != quantityNum) {
					user.put("cartQuantity", cartQuantity);
				}
				
			}	
			response.sendRedirect(request.getContextPath() + "/cart/cartList");
		} else {
			Cart cart = new Cart();
			cart.setCustomerId(loginCustomer.getCustomerId());
			cart.setGoodsCode(goodsCode);
			cart.setCartQuantity(cartQuantity);
			boolean result = cartService.modifyCart(cart);
			if(result) {
				System.out.println("ModifyCartList: 회원장바구니 수량변경완료(재고없음)");
				msg = "x";
				
			} else {
				System.out.println("ModifyCartList: 회원장바구니 수량변경완료(재고있음)");
			}
			response.sendRedirect(request.getContextPath() + "/cart/cartList?msg="+msg);
		}
	}
}