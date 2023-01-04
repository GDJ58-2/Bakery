package vo;

public class QuestionComment {
	private int commentCode;
	private int questionCode;
	private String commentMemo;
	private String createdate;
	
	@Override
	public String toString() {
		return "QuestionComment [commentCode=" + commentCode + ", questionCode=" + questionCode + ", commentMemo="
				+ commentMemo + ", createdate=" + createdate + "]";
	}

	// 생성자
	public QuestionComment() {}
	
	public QuestionComment(int commentCode, int questionCode, String commentMemo, String createdate) {
		this.commentCode = commentCode;
		this.questionCode = questionCode;
		this.commentMemo = commentMemo;
		this.createdate = createdate;
	}

	public int getCommentCode() {
		return commentCode;
	}

	public void setCommentCode(int commentCode) {
		this.commentCode = commentCode;
	}

	public int getQuestionCode() {
		return questionCode;
	}

	public void setQuestionCode(int questionCode) {
		this.questionCode = questionCode;
	}

	public String getCommentMemo() {
		return commentMemo;
	}

	public void setCommentMemo(String commentMemo) {
		this.commentMemo = commentMemo;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}
}
