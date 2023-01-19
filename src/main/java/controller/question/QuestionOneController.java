package controller.question;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.QuestionCommentService;
import service.QuestionService;
import vo.Customer;
import vo.Question;
import vo.QuestionComment;

@WebServlet("/question/questionOne")
public class QuestionOneController extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 로그인 후에만 진입가능
		HttpSession session = request.getSession();
		
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer == null) { // 로그아웃 상태
			response.sendRedirect(request.getContextPath()+"/customer/login");
			return;
		}
		
		// 메시지가 있을 경우
		request.setCharacterEncoding("UTF-8");
		String msg = null;
		if(request.getParameter("msg") != null) {
			msg = request.getParameter("msg");
		}
		request.setAttribute("msg", msg);
				
		// 문의 상세보기
		int questionCode = 0;
		
		// 방어 코드
		if(request.getParameter("questionCode") == null){
			response.sendRedirect(request.getContextPath()+"/question/questionList");
			return;
		} else {
			questionCode = Integer.parseInt(request.getParameter("questionCode"));
			// System.out.println("questionCode : " + questionCode);
		}
		
	    Question question = new Question();
		QuestionService questionService = new QuestionService();
		question = questionService.getQuestionOne(questionCode);
	    
		request.setAttribute("question", question);
		
		QuestionCommentService qcs = new QuestionCommentService();
		ArrayList<QuestionComment> list = qcs.getCommentList(questionCode);
		
		request.setAttribute("commentList", list);
		//System.out.println(list+"<--QuestionOneController list");
		
		// View
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/question/questionOne.jsp");
		
		rd.forward(request, response);
	}
}
