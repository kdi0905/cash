package kr.co.gdu.cash.vo;

public class Notice {
	private int noticeId;
	private String memberId;
	private String noticeTitle;
	private String noticeContent;
	private String noticeDate;
	public int getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String string) {
		this.memberId = string;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent;
	}
	public void setNoticeContent(String noticeContent) {
		this.noticeContent = noticeContent;
	}
	public String getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(String noticeDate) {
		this.noticeDate = noticeDate;
	}
	
	@Override
	public String toString() {
		return "Notice [noticeId=" + noticeId + ", memberId=" + memberId + ", noticeTitle=" + noticeTitle
				+ ", noticeContent=" + noticeContent + ", noticeDate=" + noticeDate + "]";
	}
	
}
