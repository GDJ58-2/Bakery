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
		int authCode = Integer.parseInt(request.getParameter("authCode"));
		this.authInfoService = new AuthInfoService();
		AuthInfo authInfo = authInfoService.getAuthInfoOne(authCode);
		request.setAttribute("a", authInfo);
		request.getRequestDispatcher("/WEB-INF/view/auth/modifyAuthInfo.jsp").forward(request, response);
	}
	// modifyAuthInfo action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 인코딩
		int authCode = Integer.parseInt(request.getParameter("authCode"));
		String authMemo = request.getParameter("authMemo");
		AuthInfo authInfo = new AuthInfo(authCode, authMemo, null);
		this.authInfoService = new AuthInfoService();
		int row = authInfoService.modifyAuthInfo(authInfo);
		System.out.println(row+"<--ModifyAuthInfoController row");
		response.sendRedirect(request.getContextPath()+"/auth/authInfoList");
	}

}
