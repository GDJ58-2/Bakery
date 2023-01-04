package vo;

public class pwHistory {
	private String customerId;
	private String pw;
	private String createdate;
	
	@Override
	public String toString() {
		return "pwHistory [customerId=" + customerId + ", pw=" + pw + ", createdate=" + createdate + "]";
	}

	//생성자
	public pwHistory() {}
	
	public pwHistory(String customerId, String pw, String createdate) {
		this.customerId = customerId;
		this.pw = pw;
		this.createdate = createdate;
	}

	public String getCustomerId() {
		return customerId;
	}

	public void setCustomerId(String customerId) {
		this.customerId = customerId;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
}
