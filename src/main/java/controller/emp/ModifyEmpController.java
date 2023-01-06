package controller.emp;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.AuthInfoService;
import service.EmpService;
import vo.AuthInfo;
import vo.Emp;

@WebServlet("/emp/modifyEmp")
public class ModifyEmpController extends HttpServlet {
	private EmpService empService;
	private AuthInfoService authInfoService;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라메타값 유효성검사 , 파라메타값 저장
		if(request.getParameter("empCode")==null||request.getParameter("empCode").equals("")) {
			response.sendRedirect(request.getContextPath()+"/emp/empList");
			return;
		}
		int empCode = Integer.parseInt(request.getParameter("empCode"));
		//System.out.println(empCode+"<--ModifyEmpController empCode");
		
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
		// 파라메타값 유효성검사 , 파라메타값 저장
		String empId = request.getParameter("empId");
		String active = request.getParameter("active");
		if(empId==null||empId.equals("")||active==null||active.equals("")||request.getParameter("authCode")==null||request.getParameter("authCode").equals("")||request.getParameter("empCode")==null||request.getParameter("empCode").equals("")) {
			response.sendRedirect(request.getContextPath()+"/emp/empList");
			return;
		}
		int empCode = Integer.parseInt(request.getParameter("empCode"));
		int authCode = Integer.parseInt(request.getParameter("authCode"));
		Emp emp = new Emp(); // 파라메타값으로 바인딩
		emp.setEmpCode(empCode);
		emp.setEmpId(empId);
		emp.setActive(active);
		emp.setAuthCode(authCode);
		System.out.println(emp+"<--ModifyEmpController emp"); // 디버깅
		
		this.empService = new EmpService();
		int row = empService.modifyEmpByAdmin(emp);
		System.out.println(row+"<--ModifyEmpController row");
		response.sendRedirect(request.getContextPath()+"/emp/empList");
	}
}