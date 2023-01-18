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
public class CartListController extends HttpServlet {
	private CartService cartService;
	// 장바구니 조회
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		ArrayList<HashMap<String, Object>> userList = (ArrayList<HashMap<String, Object>>)session.getAttribute("userList");
		ArrayList<HashMap<String,Object>> customerList = new ArrayList<HashMap<String,Object>>();
		this.cartService = new CartService();
		int listStock = 0;
		int listGoodsCode = 0;
		String stockMsg = null;
		String modifyCart = request.getParameter("msg");
		if(modifyCart == null) {
			modifyCart = "";
		} else if(modifyCart.equals("x") && modifyCart != null) {
			stockMsg = "선택하신 상품의 재고가 부족하여 구매가능한 최대 수량으로 변경됩니다.";
		} 
		if(loginCustomer != null) { // 회원
			String customerId = loginCustomer.getCustomerId();
			if(userList == null) { // 비회원장바구니가 비어있을 때
				customerList = cartService.getCartList(customerId);
				for(HashMap<String, Object> m : customerList) {
					listStock = (int)m.get("cartQuantity");
					listGoodsCode = (int)m.get("goodsCode");
					Cart updateCart = new Cart();
					updateCart.setCustomerId(customerId);
					updateCart.setGoodsCode(listGoodsCode);
					updateCart.setCartQuantity(listStock);
					boolean result = cartService.modifyCart(updateCart);
					if(result) {
						stockMsg = "선택하신 상품의 재고가 부족하여 구매가능한 최대 수량으로 변경됩니다.";
						System.out.println("SelectCartListController: 구매가능한 수량으로 변경(회원)");
					}
				}
				customerList = cartService.getCartList(customerId);
				request.setAttribute("loginCustomer", loginCustomer);
				request.setAttribute("customerList", customerList);
				request.setAttribute("stockMsg", stockMsg);
				session.removeAttribute("userList");
			} else { // 비회원장바구니가 비어있지 않을 때
				customerList = cartService.getCartList(customerId);
				Cart cart = null;
				cart = new Cart();
				int addResult = 0;
				for(HashMap<String, Object> user : userList) {
					cart.setGoodsCode((int)user.get("goodsCode"));
					cart.setCartQuantity((int)user.get("cartQuantity"));
					cart.setCustomerId(customerId);
					this.cartService = new CartService();
					addResult = cartService.addCart(cart);
				}
				if(addResult == 1) {
					for(HashMap<String, Object> m : customerList) {
						listStock = (int)m.get("cartQuantity");
						listGoodsCode = (int)m.get("goodsCode");
						Cart updateCart = new Cart();
						updateCart.setCustomerId(customerId);
						updateCart.setGoodsCode(listGoodsCode);
						updateCart.setCartQuantity(listStock);
						boolean result = cartService.modifyCart(updateCart);
						if(result) {
							stockMsg = "선택하신 상품의 재고가 부족하여 구매가능한 최대 수량으로 변경됩니다.";
							System.out.println("SelectCartListController: 구매가능한 수량으로 변경(회원)");
						}
					}
				}
				customerList = cartService.getCartList(customerId);
				request.setAttribute("loginCustomer", loginCustomer);
				request.setAttribute("customerList", customerList);
				request.setAttribute("stockMsg", stockMsg);
				session.removeAttribute("userList");
			}
		} else { // 비회원
			//System.out.println("userList: "+userList);	
			if(userList == null) {
				userList = new ArrayList<HashMap<String, Object>>();
			} else {
				for(HashMap<String, Object> m : userList) {
					listStock = (int)m.get("cartQuantity");
					listGoodsCode = (int)m.get("goodsCode");
					int realGoodsStock = cartService.getGoodsStock(listGoodsCode);
					if(Math.floorDiv(realGoodsStock, listStock) == 0) { // 재고부족
						int resultStock = Math.floorMod(realGoodsStock, listStock);
						for(HashMap<String, Object> p : userList) {
							int listGoodsCode2 = (int)p.get("goodsCode");
							if(listGoodsCode2 == listGoodsCode) {
								p.put("cartQuantity", resultStock);
							}
						}
						stockMsg = "선택하신 상품의 재고가 부족하여 구매가능한 최대 수량으로 변경됩니다.";
						System.out.println("SelectCartListController: 구매가능한 수량으로 변경(비회원)");
					}
				}
			}
			request.setAttribute("loginCustomer", loginCustomer);
			request.setAttribute("stockMsg", stockMsg);
			request.setAttribute("userList", userList);
		}
		//System.out.println(stockMsg);
		// view
		request.getRequestDispatcher("/WEB-INF/view/cart/cartList.jsp").forward(request, response);
	}
}