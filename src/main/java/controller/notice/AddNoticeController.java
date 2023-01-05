package controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.NoticeService;
import vo.Notice;


@WebServlet("/notice/addNotice")
public class AddNoticeController extends HttpServlet {
	private NoticeService noticeService;
	// addNotice form
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/notice/addNotice.jsp").forward(request, response);
	}
	// addNotice action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String noticeTitle = request.getParameter("noticeTitle");
		String noticeContent = request.getParameter("noticeContent");
		String empId = request.getParameter("empId");
		Notice notice = new Notice(0, noticeTitle, noticeContent, empId, null); // request parameter 값으로 바인딩
		
		this.noticeService = new NoticeService();
		int row = noticeService.addNotice(notice);
		System.out.println(row+"<--AddNoticeController row");
		response.sendRedirect(request.getContextPath()+"/notice/noticeList");
	}
}