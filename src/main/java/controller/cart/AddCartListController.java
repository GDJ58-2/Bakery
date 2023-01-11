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
import vo.Customer;
import vo.Cart;
import service.CartService;
import service.GoodsService;
@WebServlet("/cart/addCart")
public class AddCartListController extends HttpServlet {
	
	@SuppressWarnings("unchecked") // 이 어노테이션(annotation)은 비확인 경고(unchecked warning)를 제거
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		ArrayList<HashMap<String, Object>> list = null;
		Cart cart = null;
		int goodsCode = Integer.parseInt(request.getParameter("goodsCode"));
		GoodsService goodsService = new GoodsService(); 
		HashMap<String, Object> goodsOne = goodsService.getGoodsOne(goodsCode); // goodsCode로 goods정보 얻기
		String goodsName = (String)goodsOne.get("goodsName");
		int goodsPrice = (int)goodsOne.get("goodsPrice");
		//int goodsQuantity = Integer.parseInt(request.getParameter("goodsQuantity"));
		int goodsQuantity = 1;
		System.out.println("goodsCode:"+goodsCode+"goodsName:"+goodsName);
		if(loginCustomer == null) { // 비회원
			list = (ArrayList<HashMap<String, Object>>)session.getAttribute("userList");
			if(list == null) { // 장바구니가 비어있을 때
				list = new ArrayList<HashMap<String, Object>>();
				session.setAttribute("userList", list);
				HashMap<String, Object> map = new HashMap<String, Object>();
				map.put("goodsCode", goodsCode);
				map.put("goodsName", goodsName);
				map.put("goodsPrice", goodsPrice);
				map.put("goodsQuantity", goodsQuantity);
				list.add(map);
			} else { // 장바구니가 비어있지 않을 때
				int codeNum = 0;
				int quantity = 0;
				for(HashMap<String, Object> map : list) {
					codeNum = (int)map.get("goodsCode");
					quantity = (int)map.get("goodsQuantity");
					if(goodsCode == codeNum) {
						map.put("goodsQuantity", quantity + goodsQuantity);
					}
				}
			}
			System.out.println("AddCartListController: 비회원장바구니담기 완료");
			response.sendRedirect(request.getContextPath() + "/goods/goodsOne?goodsCode=" + goodsCode);
		} else { // 회원
			cart = new Cart();
			cart.setGoodsCode(goodsCode);
			cart.setCustomerId(loginCustomer.getCustomerId());
			cart.setCartQuantity(goodsQuantity);
			CartService cartService = new CartService();
			int result = cartService.addCart(cart);
			if(result == 1) {
				System.out.println("AddCartListController: 회원장바구니담기 완료");
				response.sendRedirect(request.getContextPath() + "/goods/goodsOne?goodsCode=" + goodsCode);
			}
		}
	}
}
