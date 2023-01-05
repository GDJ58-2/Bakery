package controller.emp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.EmpService;
import vo.Emp;


@WebServlet("/emp/addEmp")
public class AddEmpController extends HttpServlet {
	private EmpService empService;
	// addEmp form
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/emp/addEmp.jsp").forward(request, response);
	}
	// addEmp action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8"); // 인코딩
		String empId = request.getParameter("empId");
		String empPw = request.getParameter("empPw");
		String empName = request.getParameter("empName");
		Emp emp = new Emp(); // request Parameter 값으로 바인딩
		emp.setEmpId(empId);
		emp.setEmpPw(empPw);
		emp.setEmpName(empName);
		
		this.empService = new EmpService();
		int row = empService.addEmp(emp);
		System.out.println(row+"<--AddEmpController row");
		response.sendRedirect(request.getContextPath()+"/emp/empList");
	}
}