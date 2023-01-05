package controller.emp;

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

@WebServlet("/emp/modifyEmp")
public class ModifyEmpController extends HttpServlet {
	private EmpService empService;
	private AuthInfoService authInfoService;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int empCode = Integer.parseInt(request.getParameter("empCode"));
		this.empService = new EmpService();
		Emp emp = empService.getEmpOne(empCode);
		this.authInfoService = new AuthInfoService();
		ArrayList<AuthInfo> authInfoList = authInfoService.getAuthInfoList();
		request.setAttribute("authInfoList", authInfoList);
		request.setAttribute("e", emp);
		request.getRequestDispatcher("/WEB-INF/view/emp/modifyEmp.jsp").forward(request, response);
	}
	// modifyEmp action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String empId = request.getParameter("empId");
		String active = request.getParameter("active");
		int authCode = Integer.parseInt(request.getParameter("authCode"));
		Emp emp = new Emp();
		emp.setEmpId(empId);
		emp.setActive(active);
		emp.setAuthCode(authCode);
		System.out.println(emp);
		this.empService = new EmpService();
		int row = empService.modifyEmpByAdmin(emp);
		System.out.println(row+"<--ModifyEmpController row");
		response.sendRedirect(request.getContextPath()+"/emp/empList");
	}
}