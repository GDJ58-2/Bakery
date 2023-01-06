package controller.emp;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.EmpService;
import vo.Emp;

@WebServlet("/emp/modifyEmpPw")
public class ModifyEmpPwController extends HttpServlet {
	private EmpService empService;
	// modifyEmpPw form
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(request.getParameter("empCode")==null||request.getParameter("empCode").equals("")) {
			response.sendRedirect(request.getContextPath()+"/emp/empList");
			return;
		}
		int empCode = Integer.parseInt(request.getParameter("empCode"));
		//System.out.println(empCode+"<--ModifyEmpPwController empCode");
		
		this.empService = new EmpService();
		Emp emp = empService.getEmpOne(empCode);
		request.setAttribute("e", emp);
		request.getRequestDispatcher("/WEB-INF/view/emp/modifyEmpPw.jsp").forward(request, response);
	}
	// modifyEmp action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String empId = request.getParameter("empId");
		String empPw = request.getParameter("empPw");
		if(empId==null||empId.equals("")||empPw==null||empPw.equals("")) {
			response.sendRedirect(request.getContextPath()+"/emp/empList");
			return;
		}
		Emp emp = new Emp();
		emp.setEmpId(empId);
		emp.setEmpPw(empPw);
		
		this.empService = new EmpService();
		int row = empService.modifyEmpPw(emp);
		System.out.println(row+"<--ModifyEmpPwController row");
		response.sendRedirect(request.getContextPath()+"/emp/empList");
	}
}