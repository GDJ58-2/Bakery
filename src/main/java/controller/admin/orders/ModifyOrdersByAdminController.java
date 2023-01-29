package controller.admin.orders;

import java.io.IOException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.OrdersService;
import vo.Emp;
import vo.Orders;


@WebServlet("/admin/orders/modifyOrders")
public class ModifyOrdersByAdminController extends HttpServlet {
	private OrdersService ordersService;
	// modifyOrdersByAdmin form
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 세션 검사 
		HttpSession session = request.getSession();
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		if(loginEmp==null) {
			response.sendRedirect(request.getContextPath()+"/admin/emp/loginEmp");
			return;
		}
		// 관리자 권한 검사 
		if(loginEmp.getAuthCode()<1) { 
			response.sendRedirect(request.getContextPath()+"/admin/emp/home");
			return;
		}
		
		// 페이징
		//request.setCharacterEncoding("UTF-8"); 인코딩 필터 처리
		String orderState = request.getParameter("orderState");
		int currentPage = 1;
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int rowPerPage = 30;
		
		// 날짜 출력
		int year = 0;
		int month = 0;
		int date = 0;
		int minDate = 1;
		int maxDate = 0;
		Calendar today = Calendar.getInstance(); 
		if(request.getParameter("year")==null||request.getParameter("month")==null) {
			year = today.get(Calendar.YEAR);
			month = today.get(Calendar.MONTH);
			date = today.get(Calendar.DATE);
			maxDate = today.getActualMaximum(Calendar.DATE);
		} else {
			date = Integer.parseInt(request.getParameter("date"));
			year = Integer.parseInt(request.getParameter("year"));
			month = Integer.parseInt(request.getParameter("month"))-1;
			if(month<0) {
				year-=1;
				month=11;
			} else if(month>11) {
				year+=1;
				month=0;
			}
			today.set(year, month, minDate);
			maxDate = today.getActualMaximum(Calendar.DATE);
			System.out.println(month+"-"+maxDate);
		}
		String selectDate = year+"-"+(month+1)+"-"+date;
		System.out.println(selectDate);
		this.ordersService = new OrdersService();
		ArrayList<HashMap<String, Object>> list = ordersService.getOrdersListByAdmin(selectDate, orderState, currentPage, rowPerPage);
		//System.out.println(list);
		request.setAttribute("ordersList", list);
		request.setAttribute("orderState", orderState);
		request.setAttribute("year", year);
		request.setAttribute("month", month+1);
		request.setAttribute("date", date);
		request.setAttribute("minDate", minDate);
		request.setAttribute("maxDate", maxDate);
		request.getRequestDispatcher("/WEB-INF/view/admin/orders/modifyOrders.jsp").forward(request, response);
	}
	
	// modifyOrdersByAdmin action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 세션 검사 
		HttpSession session = request.getSession();
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		if(loginEmp==null) {
			response.sendRedirect(request.getContextPath()+"/admin/emp/loginEmp");
			return;
		}
		// 관리자 권한 검사 
		if(loginEmp.getAuthCode()<1) { 
			response.sendRedirect(request.getContextPath()+"/admin/emp/home");
			return;
		}
		String orderState = request.getParameter("orderState");
		int date = Integer.parseInt(request.getParameter("date"));
		int year = Integer.parseInt(request.getParameter("year"));
		int month = Integer.parseInt(request.getParameter("month"))-1;
		// 선택된 orderCode list 파라메타값 저장 후
		String[] orderCodeStr = request.getParameterValues("orderCode");
		if(orderState==null||orderState.equals("")) {
			response.sendRedirect(request.getContextPath()+"/admin/orders/modifyOrders");
			return;
		}
		if(orderCodeStr==null) {
			response.sendRedirect(request.getContextPath()+"/admin/orders/modifyOrders?orderState="+orderState+"&year="+year+"&month"+month+"&date"+date);
			return;
		}
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
		System.out.println(orderState);
		response.sendRedirect(request.getContextPath()+"/admin/orders/modifyOrders?orderState="+URLEncoder.encode(orderState,"UTF-8")+"&year="+year+"&month"+month+"&date"+date);
	}
}