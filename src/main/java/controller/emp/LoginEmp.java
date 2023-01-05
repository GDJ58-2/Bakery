package controller.emp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.EmpService;
import vo.Emp;

@WebServlet("/emp/loginEmp")
public class LoginEmp extends HttpServlet {
	private EmpService empService;
	// loginEmp Form
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/emp/loginEmp.jsp").forward(request, response);
	}
	// loginEmp action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String empId = request.getParameter("empId");
		String empPw = request.getParameter("empPw");
		Emp paramEmp = new Emp();
		paramEmp.setEmpId(empId);
		paramEmp.setEmpPw(empPw);
		this.empService = new EmpService();
		Emp loginEmp = empService.loginByEmp(paramEmp);
		System.out.println(loginEmp);
		HttpSession session = request.getSession(); // session 객체 생성
		if(loginEmp!=null) {
			session.setAttribute("login", loginEmp);
		}
		response.sendRedirect(request.getContextPath()+"/emp/empList");
	}
}