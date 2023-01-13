package controller.admin.customer;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CustomerService;
import vo.Customer;


@WebServlet("/admin/customer/customerList")
public class CustomerListController extends HttpServlet {
	private CustomerService customerService;
	// admin-customerList 출력
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// !!!!!!!!! 관리자 로그인 유효성 검사
		
		// !!!!!!!!! 페이징, 검색기능
		int currentPage = 1;
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int rowPerPage = 10;
		if(request.getParameter("rowPerPage")!=null) {
			rowPerPage = Integer.parseInt(request.getParameter("rowPerPage"));
		}
		String search = request.getParameter("search");
		
		this.customerService = new CustomerService();
		ArrayList<Customer> list = customerService.getCustomerListByAdmin(search, currentPage, rowPerPage);		
		request.setAttribute("customerList", list);
		request.setAttribute("search", search);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("rowPerPage", rowPerPage);
		request.getRequestDispatcher("/WEB-INF/view/admin/customer/customerList.jsp").forward(request, response);
	}
}