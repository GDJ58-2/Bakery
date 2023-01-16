package controller.admin.emp;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.EmpService;
import vo.Emp;


@WebServlet("/admin/emp/empList") 
public class EmpListController extends HttpServlet {
	private EmpService empService;
	// empList 출력
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인 유효성 검사, 관리자 권한 레벨 검사 --> 세션 저장 후 작성
		
		this.empService = new EmpService();
		ArrayList<HashMap<String, Object>> list = empService.getEmpListByAdmin();
		request.setAttribute("empList", list);
		request.getRequestDispatcher("/WEB-INF/view/admin/emp/empList.jsp").forward(request, response);
	}
}