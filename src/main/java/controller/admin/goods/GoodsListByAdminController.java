package controller.admin.goods;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.GoodsCategoryService;
import service.GoodsService;
import vo.Emp;
import vo.GoodsCategory;

@WebServlet("/admin/goods/goodsListByAdmin")
public class GoodsListByAdminController extends HttpServlet {
	private GoodsService goodsService;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		// 로그인 후에만 진입가능
		HttpSession session = request.getSession();
		
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		if(loginEmp == null) { // 로그아웃 상태
			response.sendRedirect(request.getContextPath()+"/admin/emp/loginEmp");
			return;
		}
		*/
		// 페이징
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		request.setAttribute("currentPage", currentPage);
		
		final int ROW_PER_PAGE = 20;
		int beginRow = (currentPage-1)*ROW_PER_PAGE;
		
		int count = 0;
		this.goodsService = new GoodsService();
		count = goodsService.getGoodsCount(); // -> lastPage
		// System.out.println("count : " + count);
		
		int lastPage = (int)Math.ceil((double)count / (double)ROW_PER_PAGE); //마지막 페이지 번호 구하기
		// System.out.println("lastPage : " + lastPage);
		request.setAttribute("lastPage", lastPage);
		
		// 메시지가 있을 경우
		request.setCharacterEncoding("UTF-8");
		String msg = null;
		if(request.getParameter("msg") != null) {
			msg = request.getParameter("msg");
		}
		request.setAttribute("msg", msg);
		
		String categoryKind = null;
		
		int categoryNo = 0;
		if(request.getParameter("categoryNo") != null) {
			categoryNo = Integer.parseInt(request.getParameter("categoryNo"));
		}
		GoodsCategoryService goodsCategoryService = new GoodsCategoryService();
		categoryKind = goodsCategoryService.getCategoryKind(categoryNo);
		
		if(request.getParameter("categoryKind") != null) {
			categoryKind = request.getParameter("categoryKind");
		}
		request.setAttribute("categoryKind", categoryKind);
		
		String search = null;
		if(request.getParameter("search") != null) {
			search = request.getParameter("search");
		}
		
		goodsService = new GoodsService();
		ArrayList<HashMap<String, Object>> list = goodsService.getGoodsListByPage(categoryKind, categoryNo, search, beginRow, ROW_PER_PAGE);
		request.setAttribute("list", list);
		
		// 상품 카테고리
		ArrayList<GoodsCategory> gcList = goodsCategoryService.getGoodsCategoryList();
		request.setAttribute("gcList", gcList);
		
		request.getRequestDispatcher("/WEB-INF/view/admin/goods/goodsListByAdmin.jsp").forward(request, response);
	}
}
