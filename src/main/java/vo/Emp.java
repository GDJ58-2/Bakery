package vo;

public class Emp {
	private int empCode;
	private String empId;
	private String empPw;
	private String empName;
	private String active;
	private int authCode;
	private String createdate;
	
	@Override
	public String toString() { // 디버깅 출력용
		return "Emp [empCode=" + empCode + ", empId=" + empId + ", empPw=" + empPw + ", empName=" + empName
				+ ", active=" + active + ", authCode=" + authCode + ", createdate=" + createdate + "]";
	}
	// 생성자
	public Emp() {}

	public Emp(int empCode, String empId, String empPw, String empName, String active, int authCode,
			String createdate) {
		this.empCode = empCode;
		this.empId = empId;
		this.empPw = empPw;
		this.empName = empName;
		this.active = active;
		this.authCode = authCode;
		this.createdate = createdate;
	}

	public int getEmpCode() {
		return empCode;
	}
	public void setEmpCode(int empCode) {
		this.empCode = empCode;
	}
	public String getEmpId() {
		return empId;
	}
	public void setEmpId(String empId) {
		this.empId = empId;
	}
	public String getEmpPw() {
		return empPw;
	}
	public void setEmpPw(String empPw) {
		this.empPw = empPw;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	public String getActive() {
		return active;
	}
	public void setActive(String active) {
		this.active = active;
	}
	public int getAuthCode() {
		return authCode;
	}
	public void setAuthCode(int authCode) {
		this.authCode = authCode;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
}
