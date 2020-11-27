package kr.co.gdu.cash.vo;

public class Comment {
	private int commentId;
	private int noticeId;
	private String memberId;
	private String commentContent;
	private String updateDate;
	private String createDate;
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getCreateDate() {
		return createDate;
	}
	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}
	public int getCommentId() {
		return commentId;
	}
	public void setCommentId(int commentId) {
		this.commentId = commentId;
	}
	public int getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}

	public String getCommentContent() {
		return commentContent.replaceAll("(?i)<script", "&lt;script");
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public String getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	@Override
	public String toString() {
		return "Comment [commentId=" + commentId + ", noticeId=" + noticeId + ", memberId=" + memberId
				+ ", commentContent=" + commentContent + ", updateDate=" + updateDate + ", createDate=" + createDate
				+ "]";
	}
	
}
