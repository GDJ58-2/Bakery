package controller.admin.notice;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.NoticeService;
import vo.Emp;

@WebServlet("/admin/notice/removeNotice")
public class RemoveNoticeController extends HttpServlet {
	private NoticeService noticeService;
	// removeNotice action
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 세션 검사 
		HttpSession session = request.getSession();
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		if(loginEmp==null) {
			response.sendRedirect(request.getContextPath()+"/admin/emp/loginEmp");
			return;
		}
		// 관리자 권한 검사
		if(loginEmp.getAuthCode()<1) { 
			response.sendRedirect(request.getContextPath()+"/admin/emp/home");
			return;
		}
		
		// 파라메타값 유효성검사, 받기
		if(request.getParameter("noticeCode")==null||request.getParameter("noticeCode").equals("")) {
			response.sendRedirect(request.getContextPath()+"/notice/noticeList");
			return;
		}
		int noticeCode = Integer.parseInt(request.getParameter("noticeCode"));
		//System.out.println(noticeCode+"<--RemoveNoticeController noticeCode");
		
		this.noticeService = new NoticeService();
		int row = noticeService.removeNotice(noticeCode);
		System.out.println(row+"<--RemoveNoticeController row");
		String msg = "<script>alert('공지 삭제를 실패했습니다. 다시 시도해주세요.'); location.href='/bakery/notice/noticeOne?noticeCode="+noticeCode+"; </script>";
		if(row==1) {
			msg = "<script>alert('공지가 삭제되었습니다.'); location.href='/bakery/notice/noticeList'; </script>";
		}
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(msg);
		out.flush();
	}
}