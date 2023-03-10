package controller.admin.notice;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.NoticeService;
import vo.Emp;
import vo.Notice;

@WebServlet("/admin/notice/modifyNotice")
public class ModifyNoticeController extends HttpServlet {
	private NoticeService noticeService;
	// modifyNotice form
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
			response.sendRedirect(request.getContextPath()+"/notice/noticeList");
			return;
		}
		
		// 파라메타값 유효성검사, 받기
		String search = request.getParameter("search");
		if(request.getParameter("no")==null||request.getParameter("no").equals("")) {
			response.sendRedirect(request.getContextPath()+"/notice/noticeList");
			return;
		}
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println(no+"<--ModifyNoticeController no");
		
		this.noticeService = new NoticeService();
		HashMap<String, Object> map = noticeService.getNoticeOne(no, search);
		request.setAttribute("n", map);
		request.getRequestDispatcher("/WEB-INF/view/admin/notice/modifyNotice.jsp").forward(request, response);
	}
	
	// modifyNotice action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.setCharacterEncoding("UTF-8"); // 인코딩 필터처리
		
		// 로그인 세션 검사 
		HttpSession session = request.getSession();
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		if(loginEmp==null) {
			response.sendRedirect(request.getContextPath()+"/admin/emp/loginEmp");
			return;
		}
		// 관리자 권한 검사
		if(loginEmp.getAuthCode()<1) { 
			response.sendRedirect(request.getContextPath()+"/notice/noticeList");
			return;
		}
				
		// 파라메타값 유효성검사, 받기
		String empId = loginEmp.getEmpId();
		String noticeTitle = request.getParameter("noticeTitle");
		String noticeContent = request.getParameter("noticeContent");
		if(noticeTitle==null||noticeTitle.equals("")||noticeContent==null||noticeContent.equals("")
			||request.getParameter("noticeCode")==null||request.getParameter("noticeCode").equals("")) {
			response.sendRedirect(request.getContextPath()+"/notice/noticeList");
			return;
		}
		int noticeCode = Integer.parseInt(request.getParameter("noticeCode"));
		Notice notice = new Notice(noticeCode, noticeTitle, noticeContent, empId, null);
		System.out.println(notice+"<--ModifyNoticeController notice");
		
		this.noticeService = new NoticeService();
		int row = noticeService.modifyNotice(notice);
		System.out.println(row+"<--ModifyNoticeController row");
		String msg = "<script>alert('공지 수정을 실패했습니다. 다시 시도해주세요.'); location.href='/bakery/notice/noticeList'; </script>";
		if(row==1) {
			msg = "<script>alert('공지가 수정되었습니다.'); location.href='/bakery/notice/noticeList'; </script>";
		}
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(msg);
		out.flush();
	}
}