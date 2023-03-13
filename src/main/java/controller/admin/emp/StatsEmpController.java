package controller.admin.emp;


import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.EmpService;
import service.GoodsCategoryService;
import vo.Customer;
import vo.Emp;
import vo.GoodsCategory;


@WebServlet("/admin/emp/stats")
public class StatsEmpController extends HttpServlet {
	private EmpService empService;
	private GoodsCategoryService goodsCategoryService;
		
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 세션 검사 
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer!=null) {
			response.sendRedirect(request.getContextPath()+"/index");
			return;
		}
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		if(loginEmp==null) {
			response.sendRedirect(request.getContextPath()+"/index");
			return;
		}
		
		String year="";
		String month="";
		String categoryNo="";
		String resultYear="2023";
		String resultMonth="3";
		String resultCategoryNo="1";
		
		if(request.getParameter("year") != "") {
			year=request.getParameter("year");
			System.out.println("year:"+year);
			resultYear=year;
		} 
		
		if(request.getParameter("month") != "") {
			month=request.getParameter("month");
			resultMonth=month;
		} 
		
		if(request.getParameter("categoryNo") != "") {
			categoryNo=request.getParameter("categoryNo");
			resultCategoryNo=categoryNo;
		} 
		this.goodsCategoryService=new GoodsCategoryService();
		this.empService=new EmpService();
		ArrayList<GoodsCategory> goodsCategoryList=goodsCategoryService.getGoodsCategoryList();
		ArrayList<HashMap<String, Object>> yearList=empService.getSelectYearStats();
		ArrayList<HashMap<String, Object>> monthList=empService.getSelectMonthStats(year);
		ArrayList<HashMap<String, Object>> productRankingList=empService.getSelectProductRankingMonth(year, month);
		ArrayList<HashMap<String, Object>> productCategoryList=empService.getSelectProductRankingCategory(year, categoryNo);
		
		request.setAttribute("year", resultYear);
		request.setAttribute("month", resultMonth);
		request.setAttribute("categoryNo", resultCategoryNo);
		request.setAttribute("yearList", yearList);
		request.setAttribute("monthList", monthList);
		request.setAttribute("productRankingList", productRankingList);
		request.setAttribute("productCategoryList", productCategoryList);
		request.setAttribute("goodsCategoryList", goodsCategoryList);
		
		request.getRequestDispatcher("/WEB-INF/view/admin/emp/statsEmp.jsp").forward(request, response);
		
	}
}
