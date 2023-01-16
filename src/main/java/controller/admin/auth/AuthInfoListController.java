package controller.admin.auth;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.AuthInfoService;
import service.EmpService;
import vo.AuthInfo;
import vo.Emp;

@WebServlet("/admin/auth/authInfoList")
public class AuthInfoListController extends HttpServlet {
	private AuthInfoService authInfoService;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.authInfoService = new AuthInfoService();
		ArrayList<AuthInfo> list = authInfoService.getAuthInfoList();
		request.setAttribute("authInfoList", list);
		request.getRequestDispatcher("/WEB-INF/view/admin/auth/authInfoList.jsp").forward(request, response);
	}
}