package controller.auth;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.AuthInfoService;
import vo.AuthInfo;

@WebServlet("/auth/addAuthInfo")
public class AddAuthInfoController extends HttpServlet {
	private AuthInfoService authInfoService;
	// addAuthInfo form
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/auth/addAuthInfo.jsp").forward(request, response);
	}
	// addAuthInfo action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 인코딩
		int authCode = Integer.parseInt(request.getParameter("authCode"));
		String authMemo = request.getParameter("authMemo");
		AuthInfo authInfo = new AuthInfo(authCode, authMemo, null);
		this.authInfoService = new AuthInfoService();
		int row = authInfoService.addAuthInfo(authInfo);
		System.out.println(row+"<--AddAuthInfoController row");
		response.sendRedirect(request.getContextPath()+"/auth/authInfoList");
	}
}