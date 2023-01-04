package vo;

public class Review {
	private int orderCode;
	private String reviewMemo;
	private String createdate;
	
	@Override
	public String toString() {
		return "Review [orderCode=" + orderCode + ", reviewMemo=" + reviewMemo + ", createdate=" + createdate + "]";
	}

	// 생성자
	public Review() {}
	
	public Review(int orderCode, String reviewMemo, String createdate) {
		this.orderCode = orderCode;
		this.reviewMemo = reviewMemo;
		this.createdate = createdate;
	}

	public int getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}

	public String getReviewMemo() {
		return reviewMemo;
	}

	public void setReviewMemo(String reviewMemo) {
		this.reviewMemo = reviewMemo;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
}
