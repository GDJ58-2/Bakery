package vo;

public class SiteCounter {
	private String counterDate;
	private int counterNum;
	
	@Override
	public String toString() {
		return "SiteCounter [counterDate=" + counterDate + ", counterNum=" + counterNum + "]";
	}

	// 생성자
	public SiteCounter() {}
	
	public SiteCounter(String counterDate, int counterNum) {
		this.counterDate = counterDate;
		this.counterNum = counterNum;
	}

	public String getCounterDate() {
		return counterDate;
	}

	public void setCounterDate(String counterDate) {
		this.counterDate = counterDate;
	}

	public int getCounterNum() {
		return counterNum;
	}

	public void setCounterNum(int counterNum) {
		this.counterNum = counterNum;
	}
}
