package controller.question;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.QuestionCommentService;
import vo.Emp;
import vo.QuestionComment;

@WebServlet("/question/comment/addQuestionComment")
public class AddQuestionCommentController extends HttpServlet {
	private QuestionCommentService questionCommentService;
	// addQuestionComment action
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 세션 검사 
		HttpSession session = request.getSession();
		Emp loginEmp = (Emp)session.getAttribute("loginEmp");
		if(loginEmp==null) {
			response.sendRedirect(request.getContextPath()+"/admin/emp/loginEmp");
			return;
		}
		// 관리자 권한 검사 
		if(loginEmp.getAuthCode()<1) { 
			response.sendRedirect(request.getContextPath()+"/admin/emp/home");
			return;
		}
		
		// 파라메타값 받기, 유효성검사
		String commentMemo = request.getParameter("commentMemo");
		if(commentMemo==null||commentMemo.equals("")||request.getParameter("questionCode")==null||request.getParameter("questionCode").equals("")) {
			response.sendRedirect(request.getContextPath()+"/question/questionList");
			return;
		}
		int questionCode = Integer.parseInt(request.getParameter("questionCode"));
		QuestionComment comment = new QuestionComment(0,questionCode,commentMemo,null); // 파라메타값으로 바인딩
		//System.out.println(comment+"<--AddQuestionCommentController comment");
		
		this.questionCommentService = new QuestionCommentService();
		int row = questionCommentService.addComment(comment);
		System.out.println(row+"<--AddQuestionCommentController row");
		response.sendRedirect(request.getContextPath()+"/question/questionList");
	}
}