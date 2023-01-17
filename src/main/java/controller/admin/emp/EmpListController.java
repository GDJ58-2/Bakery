package controller.admin.emp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.EmpService;
import vo.Emp;


@WebServlet("/admin/emp/empList") 
public class EmpListController extends HttpServlet {
	private EmpService empService;
	// empList 출력
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 세션 검사 
		HttpSession session = request.getSession();
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		if(loginEmp==null) {
			response.sendRedirect(request.getContextPath()+"/admin/emp/loginEmp");
			return;
		}
		// 관리자 권한 검사 
		if(loginEmp.getAuthCode()<3) { 
			response.sendRedirect(request.getContextPath()+"/admin/emp/home");
			return;
		}
		
		this.empService = new EmpService();
		ArrayList<HashMap<String, Object>> list = empService.getEmpListByAdmin();
		request.setAttribute("empList", list);
		request.getRequestDispatcher("/WEB-INF/view/admin/emp/empList.jsp").forward(request, response);
	}
}