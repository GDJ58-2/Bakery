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
import vo.Review;
import vo.Orders;
import service.ReviewService;

@WebServlet("/review/modifyReview")
public class ModifyReviewController extends HttpServlet {
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
		HashMap<String, Object> map = reviewService.reviewListOne(orders);
		request.setAttribute("map", map);
		// view
		request.getRequestDispatcher("/WEB-INF/view/review/modifyReview.jsp").forward(request, response);
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
		int orderCode = Integer.parseInt(request.getParameter("orderCode"));
		
		Review review = new Review();
		review.setOrderCode(orderCode);
		review.setReviewMemo(reviewMemo);
		this.reviewService = new ReviewService();
		int result = reviewService.modifyReview(review);
		if(result == 1) {
			System.out.println("ModifyReviewController: 리뷰수정완료");
			response.sendRedirect(request.getContextPath() + "/review/reviewList");
		} else {
			System.out.println("ModifyReviewController: 리뷰수정실패");
			response.sendRedirect(request.getContextPath() + "/review/modifyReview?orderCode=" + orderCode);
		}
	}
}
