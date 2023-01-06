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
public class LoginEmpController extends HttpServlet {
	private EmpService empService;
	// loginEmp Form
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/emp/loginEmp.jsp").forward(request, response);
	}
	// loginEmp action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라메타값 유효성검사
		String empId = request.getParameter("empId");
		String empPw = request.getParameter("empPw");
		if(empId==null||empId.equals("")||empPw==null||empPw.equals("")) {
			response.sendRedirect(request.getContextPath()+"/emp/empList");
			return;
		}
		Emp paramEmp = new Emp(); // 파라메타값으로 바인딩
		paramEmp.setEmpId(empId);
		paramEmp.setEmpPw(empPw);
		//System.out.println(paramEmp+"<--LoginEmpController paramEmp");
		
		this.empService = new EmpService();
		Emp loginEmp = empService.loginByEmp(paramEmp);
		System.out.println(loginEmp);
		HttpSession session = request.getSession(); // 서버에 생성된 세션이 있다면 세션을 반환하고, 없다면 새 세션을 생성하여 반환한다
		if(loginEmp!=null) {
			session.setAttribute("login", loginEmp);
		}
		response.sendRedirect(request.getContextPath()+"/emp/empList");
	}
}