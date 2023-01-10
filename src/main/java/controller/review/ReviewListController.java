package controller.review;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import vo.Customer;
import service.ReviewService;

@WebServlet("/review/reviewList")
public class ReviewListController extends HttpServlet {
	private ReviewService reviewService;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer == null) { // 로그인 안된 상태
			response.sendRedirect(request.getContextPath() + "/customer/login");
			return;
		}
		String customerId = loginCustomer.getCustomerId();
		this.reviewService = new ReviewService();
		
		// 작성한 리뷰 목록
		ArrayList<HashMap<String, Object>> reviewList = reviewService.getCustomerReviewList(customerId);
		
		// 작성 가능한 리뷰 목록
		ArrayList<HashMap<String, Object>> noReviewList = reviewService.getNoReviewList(customerId);
		
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("noReviewList", noReviewList);
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/view/review/reviewList.jsp");
	    rd.forward(request, response);
	}
}
