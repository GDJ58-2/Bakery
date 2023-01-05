package vo;

public class AuthInfo {
	private int authCode;
	private String authMemo;
	private String createdate;
	
	@Override
	public String toString() { // 디버깅 출력용
		return "AuthInfo [authCode=" + authCode + ", authMemo=" + authMemo + ", createdate=" + createdate + "]";
	}
	
	// 생성자
	public AuthInfo() {}

	public AuthInfo(int authCode, String authMemo, String createdate) {
		super();
		this.authCode = authCode;
		this.authMemo = authMemo;
		this.createdate = createdate;
	}
	public int getAuthCode() {
		return authCode;
	}

	public void setAuthCode(int authCode) {
		this.authCode = authCode;
	}

	public String getAuthMemo() {
		return authMemo;
	}

	public void setAuthMemo(String authMemo) {
		this.authMemo = authMemo;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}	
}