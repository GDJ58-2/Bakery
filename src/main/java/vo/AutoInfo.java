package vo;

public class AutoInfo {
	private int autoCode;
	private String autoMemo;
	private String createdate;
	
	@Override
	public String toString() { // 디버깅 출력용
		return "AutoInfo [autoCode=" + autoCode + ", autoMemo=" + autoMemo + ", createdate=" + createdate + "]";
	}
	// 생성자
	public AutoInfo() {}
	
	public AutoInfo(int autoCode, String autoMemo, String createdate) {
		this.autoCode = autoCode;
		this.autoMemo = autoMemo;
		this.createdate = createdate;
	}

	public int getAutoCode() {
		return autoCode;
	}
	public void setAutoCode(int autoCode) {
		this.autoCode = autoCode;
	}
	public String getAutoMemo() {
		return autoMemo;
	}
	public void setAutoMemo(String autoMemo) {
		this.autoMemo = autoMemo;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
}