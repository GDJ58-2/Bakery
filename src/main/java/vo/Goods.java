package vo;

public class Goods {
	private int goodsCode;
	private int categoryNo;
	private String goodsName;
	private int goodsPrice;
	private String goodsContent;
	private int goodsStock;
	private String empId;
	private int hit;
	private String createdate;
	
	public Goods() {}
	
	public Goods(int goodsCode, int categoryNo, String goodsName, int goodsPrice, String goodsContent, int goodsStock,
			String empId, int hit, String createdate) {
		this.goodsCode = goodsCode;
		this.categoryNo = categoryNo;
		this.goodsName = goodsName;
		this.goodsPrice = goodsPrice;
		this.goodsContent = goodsContent;
		this.goodsStock = goodsStock;
		this.empId = empId;
		this.hit = hit;
		this.createdate = createdate;
	}

	@Override
	public String toString() {
		return "Goods [goodsCode=" + goodsCode + ", categoryNo=" + categoryNo + ", goodsName=" + goodsName
				+ ", goodsPrice=" + goodsPrice + ", goodsContent=" + goodsContent + ", goodsStock=" + goodsStock
				+ ", empId=" + empId + ", hit=" + hit + ", createdate=" + createdate + "]";
	}

	public int getGoodsCode() {
		return goodsCode;
	}

	public void setGoodsCode(int goodsCode) {
		this.goodsCode = goodsCode;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public int getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public String getGoodsContent() {
		return goodsContent;
	}

	public void setGoodsContent(String goodsContent) {
		this.goodsContent = goodsContent;
	}

	public int getGoodsStock() {
		return goodsStock;
	}

	public void setGoodsStock(int goodsStock) {
		this.goodsStock = goodsStock;
	}

	public String getEmpId() {
		return empId;
	}

	public void setEmpId(String empId) {
		this.empId = empId;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
}
