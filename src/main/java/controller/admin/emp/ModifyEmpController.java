package controller.admin.emp;

import java.io.IOException;
import java.io.PrintWriter;
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
import vo.Customer;
import vo.Emp;

@WebServlet("/admin/emp/modifyEmp")
public class ModifyEmpController extends HttpServlet {
	private EmpService empService;
	private AuthInfoService authInfoService;
	// modifyEmp form
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

		// 파라메타값 유효성검사 , 파라메타값 저장
		if(request.getParameter("empCode")==null||request.getParameter("empCode").equals("")) {
			response.sendRedirect(request.getContextPath()+"/admin/emp/empList");
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
		request.getRequestDispatcher("/WEB-INF/view/admin/emp/modifyEmp.jsp").forward(request, response);
	}
	
	// modifyEmp action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		// 파라메타값 유효성검사 , 파라메타값 저장
		String empId = request.getParameter("empId");
		String active = request.getParameter("active");
		if(empId==null||empId.equals("")||request.getParameter("authCode")==null||request.getParameter("authCode").equals("")||request.getParameter("empCode")==null||request.getParameter("empCode").equals("")) {
			response.sendRedirect(request.getContextPath()+"/admin/emp/modifyEmp");
			return;
		}
		int empCode = Integer.parseInt(request.getParameter("empCode"));
		int authCode = Integer.parseInt(request.getParameter("authCode"));
		if(authCode==0) { // 관리자권한 비활성화(0) 시 active N
			active = "N";
		}
		Emp emp = new Emp(); // 파라메타값으로 바인딩
		emp.setEmpCode(empCode);
		emp.setEmpId(empId);
		emp.setActive(active);
		emp.setAuthCode(authCode);
		System.out.println(emp+"<--ModifyEmpController emp"); // 디버깅
		
		this.empService = new EmpService();
		int row = empService.modifyEmpByAdmin(emp);
		System.out.println(row+"<--ModifyEmpController row");
		// 수정 실패시
		String msg = "<script>alert('수정을 실패하였습니다. 다시 시도해주세요.'); location.href='/bakery/admin/emp/modifyEmp?empCode='"+empCode+";</script>";
		if(row==1) { // 수정 성공
			msg = "<script>alert('수정되었습니다'); location.href='/bakery/admin/emp/empList';</script>";
		}
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(msg);
		out.flush();
	}
}