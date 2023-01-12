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

@WebServlet("/question/modifyQuestion")
public class ModifyQuestionController extends HttpServlet {
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
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/question/modifyQuestion.jsp");
		
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
		
		// 파라미터 값 받기
		request.setCharacterEncoding("UTF-8");
		
		int questionCode = 0;
		int orderCode = 0;
		String category = null;
		String questionMemo = null;
		
		// 방어코드
		if(request.getParameter("questionCode") == null || (request.getParameter("questionCode")).equals("")) {
			response.sendRedirect(request.getContextPath()+"/question/questionList");
			return;
		} else {
			questionCode = Integer.parseInt(request.getParameter("questionCode"));
		}
		if(request.getParameter("orderCode") == null || (request.getParameter("orderCode")).equals("")) {
			response.sendRedirect(request.getContextPath()+"/question/questionList");
			return;
		} else {
			orderCode = Integer.parseInt(request.getParameter("orderCode"));
		}
		if(request.getParameter("category") == null || (request.getParameter("category")).equals("")) {
			response.sendRedirect(request.getContextPath()+"/question/questionList");
			return;
		} else {
			category = request.getParameter("category");
		}
		if(request.getParameter("questionMemo") == null || (request.getParameter("questionMemo")).equals("")) {
			response.sendRedirect(request.getContextPath()+"/question/questionList");
			return;
		} else {
			questionMemo = request.getParameter("questionMemo");
		}
		
		Question question = new Question();
		question.setQuestionCode(questionCode);
		question.setOrderCode(orderCode);
		question.setCategory(category);
		question.setQuestionMemo(questionMemo);
		
		// 디버깅 코드
		System.out.println("questionCode : " + questionCode);
		System.out.println("orderCode : " + orderCode);
		System.out.println("category : " + category);
		System.out.println("questionMemo : " + questionMemo);
		
		this.questionService = new QuestionService();
		int row = questionService.modifyQuestion(question);
		if(row == 1){
			System.out.println("수정성공");
	    	
	    	String msg = URLEncoder.encode("문의가 수정되었습니다.", "utf-8");
	    	
	    	// View
	    	response.sendRedirect(request.getContextPath()+"/question/questionOne?questionCode="+questionCode+"&msg="+msg);
	    } else {
	    	System.out.println("수정실패");
	    	
	    	String msg = URLEncoder.encode("문의 수정에 실패하였습니다.", "utf-8");
	    	
	    	// View
	    	response.sendRedirect(request.getContextPath()+"/question/modifyQuestion?questionCode="+questionCode+"&msg="+msg);
	    }
	}
}
