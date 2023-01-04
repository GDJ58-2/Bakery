package vo;

public class GoodsImg {
	private int goodsCode;
	private String fileName;
	private String originName;
	private String contentType;
	private String createdate;

	public GoodsImg() {}
	
	public GoodsImg(int goodsCode, String fileName, String originName, String contentType, String createdate) {
		super();
		this.goodsCode = goodsCode;
		this.fileName = fileName;
		this.originName = originName;
		this.contentType = contentType;
		this.createdate = createdate;
	}

	@Override
	public String toString() {
		return "GoodsImg [goodsCode=" + goodsCode + ", fileName=" + fileName + ", originName=" + originName
				+ ", contentType=" + contentType + ", createdate=" + createdate + "]";
	}

	public int getGoodsCode() {
		return goodsCode;
	}
	public void setGoodsCode(int goodsCode) {
		this.goodsCode = goodsCode;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public String getCreatedate() {
		return createdate;
	}
	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
}
