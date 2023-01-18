package controller.admin.goods;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
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
import vo.Goods;
import vo.GoodsImg;

@WebServlet("/admin/goods/removeGoods")
public class RemoveGoodsController extends HttpServlet {
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
		
		int goodsCode = 0;
		// 방어코드
		if(request.getParameter("goodsCode") == null){
			// View
			RequestDispatcher rd = request.getRequestDispatcher("/admin/goods/goodsListByAdmin");
			
			rd.forward(request, response);
			
		} else {
			
			goodsCode = Integer.parseInt(request.getParameter("goodsCode"));
			System.out.println("goodsCode : " + goodsCode);
			
			HashMap<String, Object> map = new HashMap<String, Object>();
			GoodsService goodsService = new GoodsService();
			
			map = goodsService.getGoodsOne(goodsCode);
			
			request.setAttribute("map", map);
			
			// View
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/admin/goods/removeGoods.jsp");
			
			rd.forward(request, response);
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 후에만 진입가능
		HttpSession session = request.getSession();
		
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		if(loginEmp == null) { // 로그아웃 상태
			response.sendRedirect(request.getContextPath()+"/admin/emp/loginEmp");
			return;
		}
		
		// 메시지가 있을 경우
		request.setCharacterEncoding("UTF-8");
		String msg = null;
		if(request.getParameter("msg") != null) {
			msg = request.getParameter("msg");
		}
		request.setAttribute("msg", msg);
		
		int goodsCode = 0;
		
		// 방어코드
		if(request.getParameter("goodsCode") == null || request.getParameter("goodsCode").equals("")){
			response.sendRedirect(request.getContextPath()+"/admin/goods/goodsListByAdmin");
			return;
		} else {
			goodsCode = Integer.parseInt(request.getParameter("goodsCode"));
			System.out.println("goodsCode : " + goodsCode);
		}
		
		Goods goods = new Goods();
		GoodsImg goodsImg = new GoodsImg();
		
		goods.setGoodsCode(goodsCode);
		goodsImg.setGoodsCode(goodsCode);
		
		GoodsService goodsService = new GoodsService();
		int row = goodsService.removeGoods(goods, goodsImg);
		if(row == 1){
	    	System.out.println("삭제성공");
	    	
	    	response.setContentType("text/html; charset=UTF-8");
	    	
	    	PrintWriter out = response.getWriter();
	    	
	    	out.println("<script>alert('상품을 삭제하였습니다.'); location.href='/bakery/goods/goodsList';</script>");
	    	
	    	out.flush();
	    } else {
	    	System.out.println("삭제실패");
	    	
	    	msg = URLEncoder.encode("삭제에 실패하였습니다.", "utf-8");
			
			// View
	    	response.sendRedirect(request.getContextPath()+"/admin/goods/removeGoods?goodsCode="+goodsCode+"&msg="+msg);
	    }
	}
}
