package kr.co.gdu.cash.vo;

import java.util.List;

public class Notice {
	private int noticeId;
	private String memberId;
	private String noticeTitle;
	private String noticeContent;
	private String noticeDate;
	private List<Noticefile> noticefileList;
	
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
		return noticeTitle.replaceAll("(?i)<script", "&lt;script");
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeContent() {
		return noticeContent.replaceAll("(?i)<script", "&lt;script");
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
	
	
	public List<Noticefile> getNoticefileList() {
		return noticefileList;
	}
	public void setNoticefileList(List<Noticefile> noticefileList) {
		this.noticefileList = noticefileList;
	}
	@Override
	public String toString() {
		return "Notice [noticeId=" + noticeId + ", memberId=" + memberId+ ", noticeTitle=" + noticeTitle
				+ ", noticeContent=" + noticeContent + ", noticeDate=" + noticeDate + ", noticefileList="
				+ noticefileList + "]";
	}
	
}
