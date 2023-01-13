package controller.pointHistory;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.PointHistoryService;

@WebServlet("/pointHistory/pointHistoryList")
public class PointHistoryListController extends HttpServlet {
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
		
		// 세션의 로그인 된 아이디로 수정 예정
		String customerId = "test";
		
		PointHistoryService pointHistoryService = new PointHistoryService();
		ArrayList<HashMap<String, Object>> list = pointHistoryService.getPointHistory(customerId);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/view/pointHistory/pointHistoryList.jsp").forward(request, response);
	}
}
