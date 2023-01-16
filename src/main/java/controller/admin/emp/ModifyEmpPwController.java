package controller.admin.emp;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

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
		
		// 로그인 세션 검사 
		
		// 파라메타 값 유효성 검사
		if(request.getParameter("empCode")==null||request.getParameter("empCode").equals("")) {
			response.sendRedirect(request.getContextPath()+"/admin/emp/empList");
			return;
		}
		int empCode = Integer.parseInt(request.getParameter("empCode"));
		//System.out.println(empCode+"<--ModifyEmpPwController empCode");
		
		this.empService = new EmpService();
		Emp emp = empService.getEmpOne(empCode);
		request.setAttribute("e", emp);
		request.getRequestDispatcher("/WEB-INF/view/admin/emp/modifyEmpPw.jsp").forward(request, response);
	}
	// modifyEmp action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 파라메타값 유효성 검사
		String empId = request.getParameter("empId");
		String empPw = request.getParameter("empPw");
		String newEmpPw = request.getParameter("newEmpPw");
		if(empId==null||empId.equals("")||empPw==null||empPw.equals("")||newEmpPw==null||newEmpPw.equals("")) {
			response.sendRedirect(request.getContextPath()+"/emp/empList");
			return;
		}
		HashMap<String, Object> map = new HashMap<String, Object>(); 
		map.put("empId", empId);
		map.put("empPw", empPw);
		map.put("newEmpPw", newEmpPw);
		
		this.empService = new EmpService();
		int row = empService.modifyEmpPw(map);
		System.out.println(row+"<--ModifyEmpPwController row");
		// 수정 실패시 --> myPage? modifyEmpPw?
		String msg = "<script>alert('비밀번호 변경을 실패했습니다. 다시 시도해주세요.'); location.href='/bakery/admin/emp/myPage';</script>";
		if(row==1) { // 수정 성공시 --> myPage? logOut? 
			msg = "<script>alert('비밀번호를 변경했습니다.'); location.href='/bakery/admin/emp/myPage';</script>";
		}
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(msg);
		out.flush();
	}
}