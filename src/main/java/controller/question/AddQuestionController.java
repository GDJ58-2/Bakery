package controller.question;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.QuestionService;
import vo.Customer;
import vo.Question;

@WebServlet("/question/addQuestion")
public class AddQuestionController extends HttpServlet {
	private QuestionService questionService;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인 후에만 진입가능

		HttpSession session = request.getSession();
		
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer == null) { // 로그아웃 상태
			response.sendRedirect(request.getContextPath()+"/customer/login");
			return;
		}

		/*
		int orderCode = 4;
		// 방어코드
		
		if(request.getParameter("orderCode") == null || (request.getParameter("orderCode")).equals("")) {
			response.sendRedirect(request.getContextPath()+"/question/questionList");
			return;
		} else {
			orderCode = Integer.parseInt(request.getParameter("orderCode"));
		}
		*/
		
		this.questionService = new QuestionService();
		ArrayList<HashMap<String, Object>> orderCodeList = questionService.getOrderCodeList(loginCustomer.getCustomerId());
		request.setAttribute("orderCodeList", orderCodeList);
		
		// View
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/question/addQuestion.jsp");
		
		rd.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 로그인 후에만 진입가능
		/*
		HttpSession session = request.getSession();
		
		Member loginMember = (Member)session.getAttribute("loginMember");
		if(loginMember == null) { // 로그아웃 상태
			response.sendRedirect(request.getContextPath()+"/member/login");
			return;
		}
		*/
		
		request.setCharacterEncoding("UTF-8");
		
		int orderCode = 0;
		String category = null;
		String questionMemo = null;
		
		// 방어코드
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
		question.setOrderCode(orderCode);
		question.setCategory(category);
		question.setQuestionMemo(questionMemo);
		
		// 디버깅 코드
		System.out.println("orderCode : " + orderCode);
		System.out.println("category : " + category);
		System.out.println("questionMemo : " + questionMemo);
		
		this.questionService = new QuestionService();
		int row = questionService.addQuestion(question);
		if(row == 1){
	    	System.out.println("입력성공");
	    	
	    	response.setContentType("text/html; charset=UTF-8");
	    	 
	    	PrintWriter out = response.getWriter();
	    	 
	    	out.println("<script>alert('문의가 등록되었습니다.'); location.href='/bakery/question/questionList';</script>");
	    	 
	    	out.flush();
	    } else {
	    	System.out.println("입력실패");
	    	
	    	String msg = URLEncoder.encode("문의 등록에 실패하였습니다.", "utf-8");
	    	
	    	// View
	    	response.sendRedirect(request.getContextPath()+"/question/addQuestion");
	    }
	}
}