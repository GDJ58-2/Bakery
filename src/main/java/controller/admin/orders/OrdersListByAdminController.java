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


@WebServlet("/admin/orders/ordersList")
public class OrdersListByAdminController extends HttpServlet {
	private OrdersService ordersService;
	// ordersList by admin form
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
		int currentPage = 1;
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int rowPerPage = 10;
		
		// 파라메타값 
		String orderState = request.getParameter("orderState");
		String searchKind = request.getParameter("searchKind");
		String search = request.getParameter("search");
		// 날짜 출력
		int year = 0;
		int month = 0;
		int date = 0;
		String startDate = null;
		String endDate = null;
		Calendar todayCal = Calendar.getInstance();
		if((request.getParameter("startDate")==null||request.getParameter("startDate").equals(""))&&(request.getParameter("endDate")==null||request.getParameter("endDate").equals(""))) {
			year = todayCal.get(Calendar.YEAR);
			month = todayCal.get(Calendar.MONTH);
			date = todayCal.get(Calendar.DATE);
			String monthmm = String.valueOf(month+1);
			String dateFormat = String.valueOf(date);
			if(month+1<10) {
				monthmm = "0" + monthmm;
			}
			if(date<10) {
				dateFormat = "0" + dateFormat;
			}
			startDate = year+"-"+monthmm+"-"+dateFormat;
			endDate = year+"-"+monthmm+"-"+dateFormat;			
			System.out.println(monthmm+"<-- 월 포맷 설정");
			System.out.println(dateFormat+"<-- 일 포맷 설정");
		} else {
			startDate = request.getParameter("startDate");
			endDate = request.getParameter("endDate");
		}
		
		System.out.println("-----ordersListByAdmin doGet 파라메타값 디버깅------");
		System.out.println(startDate+"<-- ordersListByAdmin startDate");
		System.out.println(endDate+"<-- ordersListByAdmin endDate");
		System.out.println(orderState+"<--ordersListByAdmin orderState");
		System.out.println(searchKind+"<--ordersListByAdmin searchKind");
		System.out.println(search+"<--ordersListByAdmin search");
		System.out.println("----------------------------------------------");
		
		this.ordersService = new OrdersService();
		ArrayList<HashMap<String, Object>> ordersList = ordersService.getOrdersListByAdmin(searchKind, search, startDate, endDate, orderState, currentPage, rowPerPage);
		ArrayList<HashMap<String, Object>> ordersCount = ordersService.getCountByOrderState(); 
		System.out.println(ordersList+"<--ordersListByAdmin ordersList");
		//System.out.println(ordersCount+"<--ordersListByAdmin ordersCount");
		
		request.setAttribute("ordersCount", ordersCount);
		request.setAttribute("ordersList", ordersList);
		request.setAttribute("orderState", orderState);
		request.setAttribute("startDate", startDate);
		request.setAttribute("endDate", endDate);
		request.setAttribute("search", search);
		request.setAttribute("searchKind", searchKind);
		
		request.getRequestDispatcher("/WEB-INF/view/admin/orders/ordersList.jsp").forward(request, response);
	}
	
	// ordersList by admin action
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
		
		// 파라메타값 디버깅 및 유효성검사
		String searchKind = request.getParameter("searchKind");
		String search = request.getParameter("search");
		String orderState = request.getParameter("orderState");
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String[] orderCodeStr = request.getParameterValues("orderCode");
		
		System.out.println("-----ordersListByAdmin doPost 파라메타값 디버깅------");
		System.out.println(searchKind+"<-- searchKind");
		System.out.println(search+"<-- search");
		System.out.println(orderState+"<-- orderState");
		System.out.println(startDate+"<-- startDate");
		System.out.println(endDate+"<-- endDate");
		//System.out.println(orderCodeStr+"<-- orderCodeStr");
		System.out.println("----------------------------------------------");
		
		if(orderState==null||orderState.equals("")) {
			response.sendRedirect(request.getContextPath()+"/admin/orders/ordersList?searchKind="+searchKind+"&search"+search+"&startDate="+startDate+"&endDate="+endDate);
			return;
		}
		if(orderCodeStr==null) {
			response.sendRedirect(request.getContextPath()+"/admin/orders/ordersList");
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
		response.sendRedirect(request.getContextPath()+"/admin/orders/ordersList?searchKind="+searchKind+"&search"+search+"&startDate="+startDate+"&endDate="+endDate);
	}
}