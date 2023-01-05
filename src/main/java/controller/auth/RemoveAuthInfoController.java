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
		int authCode = Integer.parseInt(request.getParameter("authCode"));
		this.authInfoService = new AuthInfoService();
		int row = authInfoService.removeAuthInfo(authCode);
		System.out.println(row+"<--RemoveAuthInfoController row");
		response.sendRedirect(request.getContextPath()+"/auth/authInfoList");
	}
}