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
		// 파라메타값 유효성검사, 받기
		if(request.getParameter("noticeCode")==null||request.getParameter("noticeCode").equals("")) {
			response.sendRedirect(request.getContextPath()+"/notice/noticeList");
			return;
		}
		int noticeCode = Integer.parseInt(request.getParameter("noticeCode"));
		System.out.println(noticeCode+"<--ModifyNoticeController noticeCode");
		
		this.noticeService = new NoticeService();
		Notice notice = noticeService.getNoticeOne(noticeCode);
		request.setAttribute("n", notice);
		request.getRequestDispatcher("/WEB-INF/view/notice/modifyNotice.jsp").forward(request, response);
	}
	// modifyNotice action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 인코딩
		// 파라메타값 유효성검사, 받기
		String noticeTitle = request.getParameter("noticeTitle");
		String noticeContent = request.getParameter("noticeContent");
		String empId = request.getParameter("empId");
		if(noticeTitle==null||noticeTitle.equals("")||noticeContent==null||noticeContent.equals("")||empId==null||empId.equals("")||request.getParameter("noticeCode")==null||request.getParameter("noticeCode").equals("")) {
			response.sendRedirect(request.getContextPath()+"/notice/noticeList");
			return;
		}
		int noticeCode = Integer.parseInt(request.getParameter("noticeCode"));
		Notice notice = new Notice(noticeCode, noticeTitle, noticeContent, empId, null);
		System.out.println(notice+"<--ModifyNoticeController notice");
		
		this.noticeService = new NoticeService();
		int row = noticeService.modifyNotice(notice);
		System.out.println(row+"<--ModifyNoticeController row");
		response.sendRedirect(request.getContextPath()+"/notice/noticeList");
	}
}