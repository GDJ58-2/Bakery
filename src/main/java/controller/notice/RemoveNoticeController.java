package controller.notice;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.NoticeService;

@WebServlet("/notice/removeNotice")
public class RemoveNoticeController extends HttpServlet {
	private NoticeService noticeService;
	// removeNotice action
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int noticeCode = Integer.parseInt(request.getParameter("noticeCode"));
		this.noticeService = new NoticeService();
		int row = noticeService.removeNotice(noticeCode);
		System.out.println(row+"<--RemoveNoticeController row");
		response.sendRedirect(request.getContextPath()+"/notice/noticeList");
	}
}