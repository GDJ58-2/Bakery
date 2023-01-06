package vo;

public class GoodsCategory {
	private int categoryNo;
	private String categoryKind;
	private String categoryName;
	private String createdate;
	
	public GoodsCategory() {}
	
	public GoodsCategory(int categoryNo, String categoryKind, String categoryName, String createdate) {
		this.categoryNo = categoryNo;
		this.categoryKind = categoryKind;
		this.categoryName = categoryName;
		this.createdate = createdate;
	}
	
	@Override
	public String toString() {
		return "GoodsCategory [categoryNo=" + categoryNo + ", categoryKind=" + categoryKind + ", categoryName="
				+ categoryName + ", createdate=" + createdate + "]";
	}
	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getCategoryKind() {
		return categoryKind;
	}

	public void setCategoryKind(String categoryKind) {
		this.categoryKind = categoryKind;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
}
