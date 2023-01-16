package controller.admin.emp;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.EmpService;
import vo.Emp;

@WebServlet("/admin/emp/loginEmp")
public class LoginEmpController extends HttpServlet {
	private EmpService empService;
	// loginEmp Form
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 검사 
		String msg = request.getParameter("msg");
		//System.out.println(msg+"<--LoginEmpController msg");
		if(msg!=null&&msg.equals("로그인 실패")) {
			msg = "아이디 또는 비밀번호를 잘못 입력했습니다. 다시 시도해주세요.";
			request.setAttribute("msg", msg);
		}
		
		request.getRequestDispatcher("/WEB-INF/view/admin/emp/loginEmp.jsp").forward(request, response);
	}
	// loginEmp action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 파라메타값 유효성검사
		String empId = request.getParameter("empId");
		String empPw = request.getParameter("empPw");
		if(empId==null||empId.equals("")||empPw==null||empPw.equals("")) {
			response.sendRedirect(request.getContextPath()+"/admin/emp/loginEmp");
			return;
		}
		Emp paramEmp = new Emp(); // 파라메타값으로 바인딩
		paramEmp.setEmpId(empId);
		paramEmp.setEmpPw(empPw);
		//System.out.println(paramEmp+"<--LoginEmpController paramEmp");
		
		this.empService = new EmpService();
		Emp loginEmp = empService.loginByEmp(paramEmp);
		//System.out.println(loginEmp+"<--LoginEmpController loginEmp");
		// 로그인 실패 시
		String msg = URLEncoder.encode("로그인 실패","UTF-8"); 
		String redirectUrl = "/admin/emp/loginEmp?msg="+msg;
		HttpSession session = request.getSession(); // 서버에 생성된 세션이 있다면 세션을 반환하고, 없다면 새 세션을 생성하여 반환한다
		if(loginEmp!=null) { // 로그인 성공시
			session.setAttribute("login", loginEmp); // 수정) 세션에 저장될 이름 정하기
			redirectUrl = "/admin/emp/empList";
		}
		response.sendRedirect(request.getContextPath()+redirectUrl); // 수정 필요) 로그인 후 관리자 홈으로 이동
	}
}