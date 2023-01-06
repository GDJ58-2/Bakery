package controller.auth;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.AuthInfoService;
import vo.AuthInfo;

@WebServlet("/auth/removeAuthInfo")
public class RemoveAuthInfoController extends HttpServlet {
	private AuthInfoService authInfoService;
	// removeAuthInfo action
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라미터값 유효성검사, 받기
		if(request.getParameter("authCode")==null||request.getParameter("authCode").equals("")) {
			response.sendRedirect(request.getContextPath()+"/auth/authInfoList");
			return;
		}
		int authCode = Integer.parseInt(request.getParameter("authCode"));
		//System.out.println(authCode+"<--RemoveAuthInfoController authCode"); // 디버깅
		
		this.authInfoService = new AuthInfoService();
		int row = authInfoService.removeAuthInfo(authCode);
		System.out.println(row+"<--RemoveAuthInfoController row");
		response.sendRedirect(request.getContextPath()+"/auth/authInfoList");
	}
}