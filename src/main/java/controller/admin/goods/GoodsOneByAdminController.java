package controller.admin.goods;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.GoodsService;
import vo.Emp;

@WebServlet("/admin/goods/goodsOneByAdmin")
public class GoodsOneByAdminController extends HttpServlet {
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
		// 메시지가 있을 경우
		request.setCharacterEncoding("UTF-8");
		String msg = null;
		if(request.getParameter("msg") != null) {
			msg = request.getParameter("msg");
		}
		request.setAttribute("msg", msg);
		
		// 상품 상세보기
		int goodsCode = 0;
		
		// 방어 코드
		if(request.getParameter("goodsCode") == null){
			response.sendRedirect(request.getContextPath()+"/admin/goods/goodsListByAdmin");
			return;
		} else {
			goodsCode = Integer.parseInt(request.getParameter("goodsCode"));
			// 디버깅 코드
			// System.out.println("goodsCode : " + goodsCode);
		}
		
	    HashMap<String, Object> map = new HashMap<String, Object>();
		GoodsService goodsService = new GoodsService();
		map = goodsService.getGoodsOne(goodsCode);
	    
		request.setAttribute("map", map);
		
		// 연관 상품 추천 리스트
		String categoryName = null;
		if(request.getParameter("categoryName") == null || request.getParameter("categoryName").equals("")) {
			response.sendRedirect(request.getContextPath()+"/goods/goodsList");
			return;
		} else {
			categoryName = request.getParameter("categoryName");
		}
		
		ArrayList<HashMap<String, Object>> gList = new ArrayList<HashMap<String, Object>>();
		gList = goodsService.getGoodsList(categoryName);
		request.setAttribute("gList", gList);
		
		// View
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/admin/goods/goodsOneByAdmin.jsp");
		
		rd.forward(request, response);
	}
}
