package controller.review;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import vo.Customer;
import vo.Orders;
import vo.Review;
import service.ReviewService;

@WebServlet("/review/addReview")
public class AddReviewController extends HttpServlet {
	private ReviewService reviewService;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer == null) { // 로그인 안된 상태
			response.sendRedirect(request.getContextPath() + "/customer/login");
			return;
		}
		request.setCharacterEncoding("utf-8");
		String customerId = loginCustomer.getCustomerId();
		int orderCode = Integer.parseInt(request.getParameter("orderCode"));
		Orders orders = new Orders();
		orders.setCustomerId(customerId);
		orders.setOrderCode(orderCode);
		this.reviewService = new ReviewService();
		HashMap<String, Object> map = reviewService.orderReview(orders);
		request.setAttribute("map", map);
		
		// 리뷰 등록실패 알림 메시지
		String reviewMsg=request.getParameter("reviewMsg");
		System.out.println(reviewMsg);
		if(reviewMsg != null) {
			request.setAttribute("reviewMsg", reviewMsg);
		} 
				
		request.getRequestDispatcher("/WEB-INF/view/review/addReview.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer == null) { // 로그인 안된 상태
			response.sendRedirect(request.getContextPath() + "/customer/login");
			return;
		}
		request.setCharacterEncoding("utf-8");
		String reviewMemo = request.getParameter("reviewMemo");
		String reviewMsg = null;
		int orderCode = Integer.parseInt(request.getParameter("orderCode"));
		
		Review review = new Review();
		review.setOrderCode(orderCode);
		review.setReviewMemo(reviewMemo);
		
		this.reviewService = new ReviewService();
		int result = reviewService.addReview(review);
		if(result == 1) { 
			System.out.println("AddReviewListController: 리뷰작성완료");
			reviewMsg="Y";
			response.sendRedirect(request.getContextPath() + "/review/reviewList?reviewMsg="+reviewMsg);
		} else {
			reviewMsg="N";
			response.sendRedirect(request.getContextPath() + "/review/addReview?reviewMsg="+reviewMsg);
		}
	}
}