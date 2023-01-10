package controller.review;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import vo.Customer;
import service.ReviewService;

@WebServlet("/review/removeReview")
public class RemoveReviewController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
		if(loginCustomer == null) { // 로그인 안된 상태
			response.sendRedirect(request.getContextPath() + "/customer/login");
			return;
		}
		request.setCharacterEncoding("utf-8");
		int orderCode = Integer.parseInt(request.getParameter("orderCode"));
		ReviewService reviewService = new ReviewService();
		int result = reviewService.removeReview(orderCode);
		if(result == 1) {
			System.out.println("RemoveReviewController: 리뷰삭제완료");
			response.sendRedirect(request.getContextPath() + "/review/reviewList");
		} else {
			System.out.println("RemoveReviewController: 리뷰삭제실패");
		}
	}
}
