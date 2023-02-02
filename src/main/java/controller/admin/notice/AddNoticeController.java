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


@WebServlet("/admin/notice/addNotice")
public class AddNoticeController extends HttpServlet {
	private NoticeService noticeService;
	// addNotice form
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
				
		request.getRequestDispatcher("/WEB-INF/view/admin/notice/addNotice.jsp").forward(request, response);
	}
	
	// addNotice action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.setCharacterEncoding("UTF-8"); // 인코딩->필터처리
		
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
		
		// 파라메타 값 유효성 검사
		String empId = loginEmp.getEmpId();
		String noticeTitle = request.getParameter("noticeTitle");
		String noticeContent = request.getParameter("noticeContent");
		if(noticeTitle==null||noticeTitle.equals("")||noticeContent==null||noticeContent.equals("")) {
			response.sendRedirect(request.getContextPath()+"/notice/noticeList");
			return;
		}
		Notice notice = new Notice(0, noticeTitle, noticeContent, empId, null); // request parameter 값으로 바인딩
		//System.out.println(notice+"<--AddNoticeController notice"); // 디버깅
		
		this.noticeService = new NoticeService();
		HashMap<String, Object> map = noticeService.addNotice(notice);
		int row = (int)map.get("row");
		System.out.println(row+"<--AddNoticeController row");
		String msg = "<script>alert('공지 등록을 실패했습니다. 다시 시도해주세요.'); location.href='/bakery/notice/noticeList'; </script>";
		if(row==1) { // 공지 등록 성공
			msg = "<script>alert('공지가 등록되었습니다.'); location.href='/bakery/notice/noticeList'; </script>";
			System.out.println(msg);
		}
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(msg);
		out.flush();
	}
}