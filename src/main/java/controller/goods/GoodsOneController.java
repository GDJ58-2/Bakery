package controller.goods;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.GoodsService;
import service.ReviewService;

@WebServlet("/goods/goodsOne")
public class GoodsOneController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 메시지가 있을 경우
		request.setCharacterEncoding("UTF-8");
		String msg = null;
		if(request.getParameter("msg") != null) {
			msg = request.getParameter("msg");
		}
		request.setAttribute("msg", msg);
		
		// 상품 상세보기
		int goodsCode = 0;
		
		if(request.getParameter("goodsCode") != null){
			goodsCode = Integer.parseInt(request.getParameter("goodsCode"));
		}
		// 디버깅 코드
		// System.out.println("goodsCode : " + goodsCode);
		
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
		
		// 리뷰글보기
		int currentPage = 1;
		if(request.getParameter("currentPage") != null) {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int rowPerPage = 5;
		ReviewService reviewService = new ReviewService();
		int reviewCnt = reviewService.getReviewPaging(goodsCode);
		int endPage = (int)Math.ceil((double) reviewCnt / rowPerPage);
		ArrayList<HashMap<String, Object>> list = reviewService.getReviewList(goodsCode, currentPage, rowPerPage);
		request.setAttribute("list", list);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("endPage", endPage);
		
		// View
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/goods/goodsOne.jsp");
		
		rd.forward(request, response);
	}
}
