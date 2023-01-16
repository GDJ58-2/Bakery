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
public class SelectCartListController extends HttpServlet {
	private CartService cartService;
	// 장바구니 조회
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		ArrayList<HashMap<String, Object>> userList = (ArrayList<HashMap<String, Object>>)session.getAttribute("userList");
		ArrayList<HashMap<String,Object>> customerList = new ArrayList<HashMap<String,Object>>();
		this.cartService = new CartService();
		int realGoodsStock = 0;
		int listStock =0;
		int listGoodsCode = 0;
		int resultStock = 0;
		if(loginCustomer != null) { // 회원
			String custmerId = loginCustomer.getCustomerId();
			if(userList == null) { // 비회원장바구니가 비어있을 때
				customerList = cartService.selectCartList(custmerId);
				
				for(HashMap<String, Object> m : customerList) {
					listStock = (int)m.get("cartQuantity");
					listGoodsCode = (int)m.get("goodsCode");
					realGoodsStock = cartService.getGoodsStock(listGoodsCode);
					System.out.println("listStock: "+listStock+"/ listGoodsCode: "+listGoodsCode+"/ realGoodsStock: "+realGoodsStock);
					if(Math.floorDiv(realGoodsStock, listGoodsCode) == 0) { // 재고부족
						//String msg = "선택하신 제품의 재고가 부족하여 구매가능한 최대 수량으로 변경됩니다."; 메세지 띄우기
						resultStock = Math.floorMod(realGoodsStock, listGoodsCode);
						Cart updateCart = new Cart();
						updateCart.setCustomerId(custmerId);
						updateCart.setGoodsCode(listGoodsCode);
						updateCart.setCartQuantity(resultStock);
						int row2 = cartService.modifyCart(updateCart);
						if(row2 == 1) {
							System.out.println("SelectCartListController: 구매가능한 수량으로 변경(회원)");
						}
					}
				}
				
				request.setAttribute("loginCustomer", loginCustomer);
				request.setAttribute("customerList", customerList);
				session.removeAttribute("userList");
			} else { // 비회원장바구니가 비어있지 않을 때
				customerList = cartService.selectCartList(custmerId);
				Cart cart = null;
				cart = new Cart();
				int result = 0;
				for(HashMap<String, Object> user : userList) {
					cart.setGoodsCode((int)user.get("goodsCode"));
					cart.setCartQuantity((int)user.get("cartQuantity"));
					cart.setCustomerId(custmerId);
					this.cartService = new CartService();
					result = cartService.addCart(cart);
				}
				if(result == 1) {
					for(HashMap<String, Object> m : customerList) {
						listStock = (int)m.get("cartQuantity");
						listGoodsCode = (int)m.get("goodsCode");
						realGoodsStock = cartService.getGoodsStock(listGoodsCode);
						System.out.println("listStock: "+listStock+"/ listGoodsCode: "+listGoodsCode+"/ realGoodsStock: "+realGoodsStock);
						if(Math.floorDiv(realGoodsStock, listGoodsCode) == 0) { // 재고부족
							//String msg = "선택하신 제품의 재고가 부족하여 구매가능한 최대 수량으로 변경됩니다."; 메세지 띄우기
							resultStock = Math.floorMod(realGoodsStock, listGoodsCode);
							Cart updateCart = new Cart();
							updateCart.setCustomerId(custmerId);
							updateCart.setGoodsCode(listGoodsCode);
							updateCart.setCartQuantity(resultStock);
							int row2 = cartService.modifyCart(updateCart);
							if(row2 == 1) {
								System.out.println("SelectCartListController: 구매가능한 수량으로 변경(회원)");
							}
						}
					}
				}
				
				request.setAttribute("loginCustomer", loginCustomer);
				request.setAttribute("customerList", customerList);
				session.removeAttribute("userList");
			}
		} else { // 비회원
			//System.out.println("userList: "+userList);	
			for(HashMap<String, Object> m : userList) {
				listStock = (int)m.get("cartQuantity");
				listGoodsCode = (int)m.get("goodsCode");
				realGoodsStock = cartService.getGoodsStock(listGoodsCode);
				System.out.println("listStock: "+listStock+"/ listGoodsCode: "+listGoodsCode+"/ realGoodsStock: "+realGoodsStock);
				if(Math.floorDiv(realGoodsStock, listGoodsCode) == 0) { // 재고부족
					//String msg = "선택하신 제품의 재고가 부족하여 구매가능한 최대 수량으로 변경됩니다."; 메세지 띄우기
					resultStock = Math.floorMod(realGoodsStock, listGoodsCode);
					for(HashMap<String, Object> p : userList) {
						int listGoodsCode2 = (int)p.get("goodsCode");
						if(listGoodsCode2 == listGoodsCode) {
							p.put("cartQuantity", resultStock);
						}
					}
					System.out.println("SelectCartListController: 구매가능한 수량으로 변경(비회원)");
				}
			}
			request.setAttribute("loginCustomer", loginCustomer);
			request.setAttribute("userList", userList);
		}
		
		// view
		request.getRequestDispatcher("/WEB-INF/view/cart/cartList.jsp").forward(request, response);
	}
}