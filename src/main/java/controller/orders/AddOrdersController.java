package controller.orders;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.GoodsService;
import service.OrdersService;
import vo.CustomerAddress;
import vo.Orders;

@WebServlet("/orders/addOrders")
public class AddOrdersController extends HttpServlet {
	private GoodsService goodsService;
	private OrdersService ordersService;
	// addOrders form
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int goodsCode = 4;
		int cartQuantity = 4;
		//int goodsCode = Integer.parseInt(request.getParameter("goodsCode"));
		//int cartQuantity = Integer.parseInt(request.getParameter("cartQuantity"));
		this.goodsService = new GoodsService();
		HashMap<String, Object> goods = goodsService.getGoodsOne(goodsCode);
		goods.put("cartQuantity",cartQuantity);
		request.setAttribute("g", goods);
		request.getRequestDispatcher("/WEB-INF/view/orders/addOrders.jsp").forward(request, response);
	}
	// addOrders action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//HttpSession session = request.getSession();
		//String customerId = (String)session.getAttribute("loginCustomer");
		String customerId = "test";
		String address = request.getParameter("address");
		int usePoint = Integer.parseInt(request.getParameter("usePoint"));
		int saveupPoint = Integer.parseInt(request.getParameter("saveupPoint"));
		int goodsCode = Integer.parseInt(request.getParameter("goodsCode"));
		int orderQuantity = Integer.parseInt(request.getParameter("orderQuantity"));
		int orderPrice = Integer.parseInt(request.getParameter("orderPrice"));
		
		CustomerAddress paramAddress = new CustomerAddress(0,customerId, address, null);
		Orders orders = new Orders(0, goodsCode, customerId, 0, orderQuantity, orderPrice, null,null);
		
		this.ordersService = new OrdersService();
		int row = ordersService.addOrders(orders, paramAddress, saveupPoint);
		System.out.println(row+"<--AddOrdersController");
	}
}