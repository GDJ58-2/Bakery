package controller.admin.emp;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.EmpService;
import vo.Emp;


@WebServlet("/admin/emp/addEmp")
public class AddEmpController extends HttpServlet {
	private EmpService empService;
	// addEmp form
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인 유효성 검사
		
		String msg = request.getParameter("msg");
		if(msg!=null&&msg.equals("중복된 아이디")) {
			msg = "이미 사용중인 아이디이거나 탈퇴한 아이디입니다.";
			request.setAttribute("msg", msg);
		}
		request.getRequestDispatcher("/WEB-INF/view/admin/emp/addEmp.jsp").forward(request, response);
	}
	// addEmp action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//request.setCharacterEncoding("UTF-8"); 인코딩 필터 처리
		
		// 로그인 유효성 검사 --> 세션 저장 후 작성
		
		// 파라메타값 유효성검사 , 파라메타값 저장
		String empId = request.getParameter("empId");
		String empPw = request.getParameter("empPw");
		String empName = request.getParameter("empName");
		if(empId==null||empId.equals("")||empPw==null||empPw.equals("")||empName==null||empName.equals("")) {
			response.sendRedirect(request.getContextPath()+"/admin/emp/empList");
			return;
		}
		Emp emp = new Emp(); // request Parameter 값으로 바인딩
		emp.setEmpId(empId);
		emp.setEmpPw(empPw);
		emp.setEmpName(empName);
		
		this.empService = new EmpService();
		boolean checkId = empService.checkId(empId);
		System.out.println(checkId+"<--AddEmpController checkId");
		String idMsg = URLEncoder.encode("중복된 아이디", "UTF-8");
		if(checkId) { // true -> 아이디 중복
			request.setAttribute("emp", emp);
			response.sendRedirect(request.getContextPath()+"/admin/emp/addEmp?msg="+idMsg);
			return;
		}
		
		int row = empService.addEmp(emp);
		System.out.println(row+"<--AddEmpController row");
		
		// emp 회원가입 실패
		String msg = "<script>alert('회원가입을 실패하였습니다. 다시 시도해주세요.'); location.href='/bakery/admin/emp/addEmp';</script>'"; 
		if(row==1) { // emp 회원가입 성공
			msg = "<script>alert('회원 가입을 축하합니다. 로그인 후 이용할 수 있습니다.'); location.href='/bakery/admin/emp/login';</script>'";
		} 
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.println(msg);
		out.flush();
	}
}