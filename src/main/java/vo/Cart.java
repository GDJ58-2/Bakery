package vo;

public class Cart {
	private int goodsCode;
	private String customerId;
	private int cartQuantity;
	private String createdate;
	
	@Override
	public String toString() { // 디버깅 출력용
		return "Cart [goodsCode=" + goodsCode + ", customerId=" + customerId + ", cartQuantity=" + cartQuantity
				+ ", createdate=" + createdate + "]";
	}
	// 생성자
	public Cart() {}

	public Cart(int goodsCode, String customerId, int cartQuantity, String createdate) {
		this.goodsCode = goodsCode;
		this.customerId = customerId;
		this.cartQuantity = cartQuantity;
		this.createdate = createdate;
	}

	public int getGoodsCode() {
		return goodsCode;
	}
	public void setGoodsCode(int goodsCode) {
		this.goodsCode = goodsCode;
	}
	public String getCustomerId() {
		return customerId;
	}
	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}
	public int getCartQuantity() {
		return cartQuantity;
	}
	public void setCartQuantity(int cartQuantity) {
		this.cartQuantity = cartQuantity;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
}