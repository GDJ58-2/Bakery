package controller.admin.customer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.CustomerService;
import vo.Customer;
import vo.Emp;


@WebServlet("/admin/customer/customerList")
public class CustomerListController extends HttpServlet {
	private CustomerService customerService;
	// admin-customerList 출력
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
		
		// 페이징, 검색기능
		int currentPage = 1;
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int rowPerPage = 30;
		String search = request.getParameter("search");
		System.out.println(search+"<--customerList search, CustomerListController");
		
		this.customerService = new CustomerService();
		int count = customerService.getCustomerCount(); 
		int lastPage = count/rowPerPage;
		if(count%rowPerPage!=0) {
			lastPage+=1;
		}
		// 페이징 방어 코드
		if(currentPage<1) {
			currentPage = 1;
		} else if(currentPage>lastPage) {
			currentPage = lastPage;
		}
		ArrayList<Customer> list = customerService.getCustomerListByAdmin(search, currentPage, rowPerPage);		
		request.setAttribute("customerList", list);
		request.setAttribute("search", search);
		request.setAttribute("currentPage", currentPage);		
		request.setAttribute("lastPage", lastPage);
		request.getRequestDispatcher("/WEB-INF/view/admin/customer/customerList.jsp").forward(request, response);
	}
}