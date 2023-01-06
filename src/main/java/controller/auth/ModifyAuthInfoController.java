package controller.auth;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.AuthInfoService;
import vo.AuthInfo;

@WebServlet("/auth/modifyAuthInfo")
public class ModifyAuthInfoController extends HttpServlet {
	private AuthInfoService authInfoService;
	// modifyAuthInfo form
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라메타값 받기, 유효성검사, 디버깅
		if(request.getParameter("authCode")==null||request.getParameter("authCode").equals("")) {
			response.sendRedirect(request.getContextPath()+"/auth/authInfoList");
			return;
		}
		int authCode = Integer.parseInt(request.getParameter("authCode"));
		//System.out.println(authCode+"<--ModifyAuthInfoController authCode");
		
		this.authInfoService = new AuthInfoService();
		AuthInfo authInfo = authInfoService.getAuthInfoOne(authCode);
		request.setAttribute("a", authInfo);
		request.getRequestDispatcher("/WEB-INF/view/auth/modifyAuthInfo.jsp").forward(request, response);
	}
	// modifyAuthInfo action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 인코딩
		// 파라메타값 받기, 유효성검사
		String authMemo = request.getParameter("authMemo");
		if(authMemo==null||authMemo.equals("")||request.getParameter("authCode")==null||request.getParameter("authCode").equals("")) {
			response.sendRedirect(request.getContextPath()+"/auth/authInfoList");
			return;
		}
		int authCode = Integer.parseInt(request.getParameter("authCode"));
		AuthInfo authInfo = new AuthInfo(authCode, authMemo, null); // 파라메타값으로 바인딩
		System.out.println(authInfo+"<--ModifyAuthInfoController authInfo"); // 디버깅
		
		this.authInfoService = new AuthInfoService();
		int row = authInfoService.modifyAuthInfo(authInfo);
		System.out.println(row+"<--ModifyAuthInfoController row");
		response.sendRedirect(request.getContextPath()+"/auth/authInfoList");
	}

}
