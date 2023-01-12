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

import service.OrdersService;
import vo.Customer;

@WebServlet("/orders/addOrdersList")
public class AddOrdersListController extends HttpServlet {
	private OrdersService ordersService;
	// addOrders form
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 세션 검사
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer==null) {
			response.sendRedirect(request.getContextPath()+"/customer/login");
			return;
		}
		ArrayList<HashMap<String, Object>> list = (ArrayList<HashMap<String, Object>>)request.getAttribute("orderList");
		//System.out.println(list);
		int orderPrice = 0;
		for(HashMap<String, Object> map : list) {
			orderPrice += (int)map.get("goodsPrice")*(int)map.get("cartQuantity");
		}
		
		
		request.setAttribute("orderPrice", orderPrice);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/view/orders/addOrders.jsp").forward(request, response);
	}

}
