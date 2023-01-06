package controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.NoticeService;
import vo.Notice;


@WebServlet("/notice/noticeOne")
public class NoticeOneController extends HttpServlet {
	private NoticeService noticeService;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라메타값 유효성검사, 받기
		if(request.getParameter("noticeCode")==null||request.getParameter("noticeCode").equals("")) {
			response.sendRedirect(request.getContextPath()+"/notice/noticeList");
			return;
		}
		int noticeCode = Integer.parseInt(request.getParameter("noticeCode"));
		//System.out.println(noticeCode+"<--NoticeOneController noticeCode");
		
		this.noticeService = new NoticeService();
		Notice notice = noticeService.getNoticeOne(noticeCode);
		request.setAttribute("n", notice);
		request.getRequestDispatcher("/WEB-INF/view/notice/noticeOne.jsp").forward(request, response);
	}
}