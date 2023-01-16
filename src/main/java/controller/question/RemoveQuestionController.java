package controller.question;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.QuestionService;
import vo.Question;

@WebServlet("/question/removeQuestion")
public class RemoveQuestionController extends HttpServlet {
	private QuestionService questionService;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		// 로그인 후에만 진입가능
		HttpSession session = request.getSession();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 로그아웃 상태
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
		*/
		
		// 메시지가 있을 경우
		request.setCharacterEncoding("UTF-8");
		String msg = null;
		if(request.getParameter("msg") != null) {
			msg = request.getParameter("msg");
		}
		request.setAttribute("msg", msg);
		
		int questionCode = 0;
		// 방어코드
		if(request.getParameter("questionCode") != null){
			questionCode = Integer.parseInt(request.getParameter("questionCode"));
			System.out.println("questionCode : " + questionCode);
		} 
		
		Question question = new Question();
		this.questionService = new QuestionService();
		
		question = questionService.getQuestionOne(questionCode);
		
		request.setAttribute("question", question);
		
		// View
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/question/removeQuestion.jsp");
		
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		// 로그인 후에만 진입가능
		HttpSession session = request.getSession();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 로그아웃 상태
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
		*/
		
		// 메시지가 있을 경우
		request.setCharacterEncoding("UTF-8");
		String msg = null;
		if(request.getParameter("msg") != null) {
			msg = request.getParameter("msg");
		}
		request.setAttribute("msg", msg);
		
		int questionCode = 0;
		// 방어코드
		if(request.getParameter("questionCode") != null){
			questionCode = Integer.parseInt(request.getParameter("questionCode"));
			System.out.println("questionCode : " + questionCode);
		} 
		
		QuestionService questionService = new QuestionService();
		int row = questionService.removeQuestion(questionCode);
		if(row == 1) {
			System.out.println("삭제성공");
	    	
	    	response.setContentType("text/html; charset=UTF-8");
	    	
	    	PrintWriter out = response.getWriter();
	    	
	    	out.println("<script>alert('문의를 삭제하였습니다.'); location.href='/bakery/question/questionList';</script>");
	    	
	    	out.flush();
	    } else {
	    	System.out.println("삭제실패");
	    	
	    	msg = URLEncoder.encode("삭제에 실패하였습니다.", "utf-8");
			
			// View
	    	response.sendRedirect(request.getContextPath()+"/question/removeQuestion?questionCode="+questionCode+"&msg="+msg);
	    }
	}
}