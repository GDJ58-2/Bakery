package controller.admin.orders;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.OrdersService;
import vo.Orders;


@WebServlet("/admin/orders/modifyOrders")
public class ModifyOrdersByAdminController extends HttpServlet {
	private OrdersService ordersService;
	// modifyOrdersByAdmin form
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 관리자 유효성 검사
		this.ordersService = new OrdersService();
		ArrayList<HashMap<String, Object>> list = ordersService.getOrdersListByAdmin();
		System.out.println(list);
		request.setAttribute("ordersList", list);
		request.getRequestDispatcher("/WEB-INF/view/admin/orders/modifyOrders.jsp").forward(request, response);
	}
	// modifyOrdersByAdmin action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String orderState = request.getParameter("orderState");
		// 선택된 orderCode list 파라메타값 저장 후
		String[] orderCodeStr = request.getParameterValues("orderCode");
		this.ordersService = new OrdersService();
		// 반복문 돌려 형변환, 바인딩, 주문상태 업데이트 실행
		for(String s : orderCodeStr) {
			int i = Integer.parseInt(s);
				Orders orders = new Orders();
				orders.setOrderState(orderState);
				orders.setOrderCode(i);
				HashMap<String, Object> map = ordersService.getOrdersOne(i);
				orders.setOrderPrice((int)map.get("orderPrice"));
				ordersService.modifyOrders(orders);
		}
		response.sendRedirect(request.getContextPath()+"/admin/orders/modifyOrders");
	}
		
}
