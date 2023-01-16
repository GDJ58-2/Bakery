package controller.admin.auth;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.AuthInfoService;

@WebServlet("/admin/auth/removeAuthInfo")
public class RemoveAuthInfoController extends HttpServlet {
	private AuthInfoService authInfoService;
	// removeAuthInfo action
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인, 관리자권한 유효성검사
		
		// 파라미터값 유효성검사, 받기
		if(request.getParameter("authCode")==null||request.getParameter("authCode").equals("")) {
			response.sendRedirect(request.getContextPath()+"/admin/auth/authInfoList");
			return;
		}
		int authCode = Integer.parseInt(request.getParameter("authCode"));
		//System.out.println(authCode+"<--RemoveAuthInfoController authCode"); // 디버깅
		
		this.authInfoService = new AuthInfoService();
		int row = authInfoService.removeAuthInfo(authCode);
		System.out.println(row+"<--RemoveAuthInfoController row");
		String msg = "<script>alert('삭제를 실패했습니다. 다시 시도해주세요.'); location.href='/bakery/admin/auth/removeAuthInfo?authCode="+authCode+"';</script>";
		if(row==1) {
			msg = "<script>alert('수정되었습니다.'); location.href='/bakery/admin/auth/authInfoList';</script>";
		}
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(msg);
		out.flush();
	}
}