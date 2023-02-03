package controller.admin.emp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.EmpService;
import vo.Emp;

@WebServlet("/admin/emp/modifyEmpPw")
public class ModifyEmpPwController extends HttpServlet {
	private EmpService empService;
	// modifyEmpPw form
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 세션 검사 
		HttpSession session = request.getSession();
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		if(loginEmp==null) {
			response.sendRedirect(request.getContextPath()+"/admin/emp/loginEmp");
			return;
		}
		
		int empCode = loginEmp.getEmpCode();
		
		this.empService = new EmpService();
		Emp emp = empService.getEmpOne(empCode);
		
		request.setAttribute("e", emp);
		
		request.getRequestDispatcher("/WEB-INF/view/admin/emp/modifyEmpPw.jsp").forward(request, response);
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
		
		// 파라메타값 유효성 검사
		String empCode = request.getParameter("empCode");
		String empPw = request.getParameter("empPw");
		String newEmpPw = request.getParameter("newEmpPw");
		
		if(empCode==null||empCode.equals("")||empPw==null||empPw.equals("")||newEmpPw==null||newEmpPw.equals("")) {
			response.sendRedirect(request.getContextPath()+"/admin/emp/modifyEmpPw");
			return;
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		map.put("empCode", empCode);
		map.put("empPw", empPw);
		map.put("newEmpPw", newEmpPw);
		
		this.empService = new EmpService();
		int row = empService.modifyEmpPw(map);
		System.out.println(row+"<--ModifyEmpPwController row");
		
		String msg = "<script>alert('비밀번호 변경을 실패했습니다. 다시 시도해주세요.'); location.href='/bakery/admin/emp/home';</script>";
		if(row==1) { // 수정 성공시
			msg = "<script>alert('비밀번호를 변경했습니다.'); location.href='/bakery/index';</script>";
		}
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(msg);
		out.flush();
	}
}