package controller.admin.emp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

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


@WebServlet("/admin/emp/empList") 
public class EmpListController extends HttpServlet {
	private EmpService empService;
	private AuthInfoService authInfoService;
	// empList 출력
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
		
		// 검색기능, 페이징
		String search = request.getParameter("search");
		int currentPage = 1;
		if(request.getParameter("currentPage")!=null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		int rowPerPage = 10;
		System.out.println(search+"<--empList search, EmpListController");
		this.empService = new EmpService();
		int count = empService.getEmpCount(); 
		int lastPage = count/rowPerPage;
		if(count%rowPerPage!=0) {
			lastPage+=1;
		}
		// 페이징 방어 코드
		if(currentPage<1) {
			currentPage = 1;
		} else if(currentPage>lastPage) {
			currentPage = lastPage;
		}
		
		// model 
		this.authInfoService = new AuthInfoService();
		ArrayList<AuthInfo> authInfoList = authInfoService.getAuthInfoList();
		ArrayList<HashMap<String, Object>> empList = empService.getEmpListByAdmin(currentPage, rowPerPage, search);
		
		request.setAttribute("empList", empList);
		request.setAttribute("authInfoList", authInfoList);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("lastPage", lastPage);
		request.setAttribute("search", search);
		
		request.getRequestDispatcher("/WEB-INF/view/admin/emp/empList.jsp").forward(request, response);
	}
}