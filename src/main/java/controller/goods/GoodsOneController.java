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
import javax.servlet.http.HttpSession;

import service.GoodsService;
import service.ReviewService;
import vo.Goods;

@WebServlet("/goods/goodsOne")
public class GoodsOneController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인 후에만 진입가능
		/*
		HttpSession session = request.getSession();
		
		HashMap<String, Object> loginMember = (HashMap<String, Object>)session.getAttribute("loginMember");
		if(loginMember == null) { // 로그아웃 상태
			response.sendRedirect(request.getContextPath()+"/customer/login");
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
		
		if(request.getParameter("goodsCode") != null){
			goodsCode = Integer.parseInt(request.getParameter("goodsCode"));
		}
		// 디버깅 코드
		// System.out.println("goodsCode : " + goodsCode);
		
	    HashMap<String, Object> map = new HashMap<String, Object>();
		GoodsService goodsService = new GoodsService();
		map = goodsService.getGoodsOne(goodsCode);
	    
		request.setAttribute("map", map);
		
		// 리뷰글보기
		ReviewService reviewService = new ReviewService();
		ArrayList<HashMap<String, Object>> list = reviewService.getReviewList(goodsCode);
		request.setAttribute("list", list);
		
		
		// View
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/goods/goodsOne.jsp");
		
		rd.forward(request, response);
	}
}
