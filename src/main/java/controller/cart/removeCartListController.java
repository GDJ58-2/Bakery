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
import vo.Cart;
import vo.Customer;

@WebServlet("/cart/removeCartList")
public class removeCartListController extends HttpServlet {
	
	@SuppressWarnings("unchecked")
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		ArrayList<HashMap<String, Object>> userList = (ArrayList<HashMap<String, Object>>)session.getAttribute("userList");
		ArrayList<HashMap<String,Object>> customerList = new ArrayList<HashMap<String,Object>>();
		int goodsCode = Integer.parseInt(request.getParameter("goodsCode"));
		
		if(loginCustomer == null) {
			int goodsNum = 0;
			for(HashMap<String, Object> user : userList) {
				goodsNum = (int)user.get("goodsCode");
				if(goodsNum == goodsCode) {
					user.clear();
				}
			}
			// 배열길이 구하기
			response.sendRedirect(request.getContextPath() + "/cart/cartList");
		} else {
			
		}
	}
}
