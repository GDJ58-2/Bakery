package controller.admin.emp;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vo.Customer;


@WebServlet("/admin/emp/logout")
public class LogoutEmpController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션 확인
		HttpSession session = request.getSession();
		if(session.getAttribute("loginEmp") == null) { // 로그인 안된 상태
			response.sendRedirect(request.getContextPath()+"/admin/emp/loginEmp");
			return;
		}
		
		session.invalidate();
		
		response.sendRedirect(request.getContextPath()+"/admin/emp/loginEmp");
	}
}