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

import service.GoodsService;
import vo.Goods;
import vo.GoodsImg;

@WebServlet("/admin/goods/removeGoods")
public class RemoveGoodsController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 후에만 진입가능
		/*
		HttpSession session = request.getSession();
		
		HashMap<String, Object> loginMember = (HashMap<String, Object>)session.getAttribute("loginMember");
		if(loginMember == null) { // 로그아웃 상태
			response.sendRedirect(request.getContextPath()+"/emp/loginEmp");
			return;
		}
		*/
		
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
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/goods/goodsList.jsp");
			
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
		/*
		HttpSession session = request.getSession();
		
		HashMap<String, Object> loginMember = (HashMap<String, Object>)session.getAttribute("loginMember");
		if(loginMember == null) { // 로그아웃 상태
			response.sendRedirect(request.getContextPath()+"/emp/loginEmp");
			return;
		}
		*/
		
		request.setCharacterEncoding("UTF-8");
		String msg = null;
		if(request.getParameter("msg") != null) {
			msg = request.getParameter("msg");
		}
		request.setAttribute("msg", msg);
		
		int goodsCode = 0;
		String empPw = null;
		
		// 방어코드
		if(request.getParameter("goodsCode") != null){
			goodsCode = Integer.parseInt(request.getParameter("goodsCode"));
			System.out.println("goodsCode : " + goodsCode);
		} 
		if(request.getParameter("empPw") != null){
			empPw = request.getParameter("empPw");
			System.out.println("empPw : " + empPw);
		}
		
		/*
		if(empPw.equals(loginMember.getEmpPw()) {
			// 비밀번호 확인 후 서비스 실행
		}
		*/
		
		if(empPw.equals("1234")) {
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
		} else {
			System.out.println("삭제실패");
	    	
			msg = URLEncoder.encode("비밀번호를 확인하세요.", "utf-8");
			
			// View
	    	response.sendRedirect(request.getContextPath()+"/admin/goods/removeGoods?goodsCode="+goodsCode+"&msg="+msg);
		}
	}
}
