package controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.NoticeService;
import vo.Notice;

@WebServlet("/notice/modifyNotice")
public class ModifyNoticeController extends HttpServlet {
	private NoticeService noticeService;
	// modifyNotice form
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noticeCode = Integer.parseInt(request.getParameter("noticeCode"));
		this.noticeService = new NoticeService();
		Notice notice = noticeService.getNoticeOne(noticeCode);
		request.setAttribute("n", notice);
		request.getRequestDispatcher("/WEB-INF/view/notice/modifyNotice.jsp").forward(request, response);
	}
	// modifyNotice action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noticeCode = Integer.parseInt(request.getParameter("noticeCode"));
		String noticeTitle = request.getParameter("noticeTitle");
		String noticeContent = request.getParameter("noticeContent");
		String empId = request.getParameter("empId");
		Notice notice = new Notice(noticeCode, noticeTitle, noticeContent, empId, null);
		this.noticeService = new NoticeService();
		int row = noticeService.modifyNotice(notice);
		System.out.println(row+"<--ModifyNoticeController row");
		response.sendRedirect(request.getContextPath()+"/notice/noticeList");
	}
}