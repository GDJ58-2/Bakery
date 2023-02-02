package controller.notice;

import java.io.IOException;
import java.util.HashMap;

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
		// 비회원 열람 가능
		
		// 파라메타값 유효성검사, 받기
		String search = request.getParameter("search");
		if(request.getParameter("no")==null||request.getParameter("no").equals("")) {
			response.sendRedirect(request.getContextPath()+"/notice/noticeList");
			return;
		}
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println(no+"<--NoticeOneController no");
		this.noticeService = new NoticeService();
		int count = noticeService.getNoticeCount(search);
		System.out.println(count+"<--NoticeOneController count");
		System.out.println(search+"<--NoticeOneController search");
		if(no<1) {
			no = 1;
		}
		if(no>count) {
			no = count;
		}
		HashMap<String, Object> map = noticeService.getNoticeOne(no, search);
		request.setAttribute("n", map);
		request.setAttribute("search", search);
		request.getRequestDispatcher("/WEB-INF/view/notice/noticeOne.jsp").forward(request, response);
	}
}