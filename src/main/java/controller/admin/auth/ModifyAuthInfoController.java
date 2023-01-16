package controller.admin.auth;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.AuthInfoService;
import vo.AuthInfo;

@WebServlet("/admin/auth/modifyAuthInfo")
public class ModifyAuthInfoController extends HttpServlet {
	private AuthInfoService authInfoService;
	// modifyAuthInfo form
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인, 관리자권한 유효성검사
		
		// 파라메타값 받기, 유효성검사, 디버깅
		if(request.getParameter("authCode")==null||request.getParameter("authCode").equals("")) {
			response.sendRedirect(request.getContextPath()+"/admin/auth/authInfoList");
			return;
		}
		int authCode = Integer.parseInt(request.getParameter("authCode"));
		//System.out.println(authCode+"<--ModifyAuthInfoController authCode");
		
		this.authInfoService = new AuthInfoService();
		AuthInfo authInfo = authInfoService.getAuthInfoOne(authCode);
		request.setAttribute("a", authInfo);
		request.getRequestDispatcher("/WEB-INF/view/admin/auth/modifyAuthInfo.jsp").forward(request, response);
	}
	// modifyAuthInfo action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.setCharacterEncoding("UTF-8"); 인코딩 필터처리
		
		// 로그인, 관리자권한 유효성검사
		
		// 파라메타값 받기, 유효성검사
		String authMemo = request.getParameter("authMemo");
		if(authMemo==null||authMemo.equals("")||request.getParameter("authCode")==null||request.getParameter("authCode").equals("")) {
			response.sendRedirect(request.getContextPath()+"/admin/auth/authInfoList");
			return;
		}
		int authCode = Integer.parseInt(request.getParameter("authCode"));
		AuthInfo authInfo = new AuthInfo(authCode, authMemo, null); // 파라메타값으로 바인딩
		//System.out.println(authInfo+"<--ModifyAuthInfoController authInfo"); // 디버깅
		
		this.authInfoService = new AuthInfoService();
		int row = authInfoService.modifyAuthInfo(authInfo);
		System.out.println(row+"<--ModifyAuthInfoController row");
		String msg = "<script>alert('수정을 실패했습니다. 다시 시도해주세요.'); location.href='/bakery/admin/auth/modifyAuthInfo?authCode="+authCode+"';</script>";
		if(row==1) {
			msg = "<script>alert('수정되었습니다.'); location.href='/bakery/admin/auth/authInfoList';</script>";
		}
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(msg);
		out.flush();
	}

}
