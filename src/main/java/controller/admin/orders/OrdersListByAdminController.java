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

import service.NoticeService;
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
			response.sendRedirect(request.getContextPath()+"/index");
			return;
		}
		
		// 파라메타값 
		String orderState = request.getParameter("orderState");
		String searchKind = request.getParameter("searchKind");
		String search = request.getParameter("search");
		
		System.out.println("-----orderList by admin doGet 파라메타값 디버깅-----");
		System.out.println(orderState+"<-- orderState ordersListByAdmin");
		System.out.println(searchKind+"<-- searchKind ordersListByAdmin");
		System.out.println(search+"<-- search ordersListByAdmin");
		System.out.println("---------------------------------");
	
		// 날짜 출력
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		
		if((startDate==null||startDate.equals(""))&&(endDate==null||endDate.equals(""))) { // 디폴트 : 한 달
			Calendar todayCal = Calendar.getInstance();
			int year = todayCal.get(Calendar.YEAR);
			int month = todayCal.get(Calendar.MONTH);
			int date = todayCal.get(Calendar.DATE);
			// 월, 일 두자리수 포맷 설정
			String lastMonthStr = String.valueOf(month);
			String thisMonthStr = String.valueOf(month+1);
			String dateStr = String.valueOf(date);
			if(month<10) {
				lastMonthStr = "0" + lastMonthStr;
			}
			if((month+1)<10) {
				thisMonthStr = "0" + thisMonthStr;
			}
			if(date<10) {
				dateStr = "0" + dateStr;
			}
			startDate = year + "-" + lastMonthStr + "-" + dateStr;
			endDate = year + "-" + thisMonthStr + "-" + dateStr; // 쿼리문의 betwwen A and B 에서 둘다 %% 처리를 하면 출력이 되지 않음 -> 모든 주문확인은 startDate -> %%, endDate -> 오늘날짜
		}

		System.out.println("-----ordersListByAdmin doGet 디버깅------");
		System.out.println(startDate+"<-- startDate ordersListByAdmin");
		System.out.println(endDate+"<-- endDate ordersListByAdmin");
		System.out.println("----------------------------------------------");
		
		
		// 페이징
		int currentPage = 1;
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int rowPerPage = 10;
		
		this.ordersService = new OrdersService();
		int count = ordersService.getOrdersCount(searchKind, search, startDate, endDate, orderState);
		int lastPage = count/rowPerPage;
		if(count%rowPerPage!=0) {
			lastPage+=1;
		}
		if(currentPage<1) {
			currentPage = 1;
		} 
		if(count!=0&&currentPage>lastPage) {
			currentPage = lastPage;
		}
		int startPage = (currentPage-1)/10*10+1;
		int endPage = startPage + 9;
		if(startPage<1) {
			startPage = 1;
		}
		if(endPage>lastPage) {
			endPage = lastPage;
		}
		
		System.out.println("-----orderList by admin doGet 페이징 디버깅-----");
		System.out.println(currentPage+"<-- NoticeListController currentPage");
		System.out.println(rowPerPage+"<-- NoticeListController rowPerPage");
		System.out.println(count+"<-- NoticeListController count");
		System.out.println(lastPage+"<-- NoticeListController lastPage");
		System.out.println(startPage+"<-- NoticeListController startPage");
		System.out.println(endPage+"<-- NoticeListController endPage");
		System.out.println("---------------------------------");
		
		
		ArrayList<HashMap<String, Object>> ordersList = ordersService.getOrdersListByAdmin(searchKind, search, startDate, endDate, orderState, currentPage, rowPerPage);
		ArrayList<HashMap<String, Object>> ordersCount = ordersService.getCountByOrderState(startDate, endDate); 
		//System.out.println(ordersList+"<--ordersListByAdmin ordersList");
		//System.out.println(ordersCount+"<--ordersListByAdmin ordersCount");
		
		request.setAttribute("ordersCount", ordersCount); // 카테고리별 개수 
		request.setAttribute("ordersList", ordersList);
		request.setAttribute("orderState", orderState);
		request.setAttribute("startDate", startDate);
		request.setAttribute("endDate", endDate);
		request.setAttribute("search", search);
		request.setAttribute("searchKind", searchKind);
		
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("startPage", startPage);
		request.setAttribute("endPage", endPage);
		request.setAttribute("lastPage", lastPage);
		
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
			response.sendRedirect(request.getContextPath()+"/index");
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
			response.sendRedirect(request.getContextPath()+"/admin/orders/ordersList");
			return;
		}
		if(orderCodeStr==null) {
			response.sendRedirect(request.getContextPath()+"/admin/orders/ordersList");
			return;
		}
		
		this.ordersService = new OrdersService();
		// 반복문 돌려 형변환, 바인딩, 주문상태 업데이트 실행
		int point = 0;
		for(String s : orderCodeStr) {
			int i = Integer.parseInt(s);
			Orders orders = new Orders();
			orders.setOrderState(orderState);
			orders.setOrderCode(i);
			
			HashMap<String, Object> map = ordersService.getOrdersOne(i);
			
			orders.setCustomerId((String)map.get("customerId"));
			orders.setGoodsCode((int)map.get("goodsCode"));
			orders.setOrderPrice((int)map.get("orderPrice"));
			orders.setOrderQuantity((int)map.get("orderQuantity"));
			
			point = ordersService.modifyOrders(orders);
		}	
		
		System.out.println(orderCodeStr.length + "<-- orderCodeStr OrdersListByAdminController");
		System.out.println(point + "<-- point OrdersListByAdminController");
		
		response.sendRedirect(request.getContextPath()+"/admin/orders/ordersList?searchKind="+searchKind+"&search"+search+"&startDate="+startDate+"&endDate="+endDate);
	}
}