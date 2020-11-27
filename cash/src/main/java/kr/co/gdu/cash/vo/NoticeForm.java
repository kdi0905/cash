package kr.co.gdu.cash.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class NoticeForm {
	private int noticeId;
	private String memberId;
	private String memberName;
	private String noticeTitle;
	private String noticeContent;
	private String noticeDate;
	private List<MultipartFile> noticefile;
	public int getNoticeId() {
		return noticeId;
	}
	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
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
	public List<MultipartFile> getNoticefile() {
		return noticefile;
	}
	public void setNoticefile(List<MultipartFile> noticefile) {
		this.noticefile = noticefile;
	}
	@Override
	public String toString() {
		return "NoticeForm [noticeId=" + noticeId + ", memberName=" + memberName + ", noticeTitle=" + noticeTitle
				+ ", noticeContent=" + noticeContent + ", noticeDate=" + noticeDate + ", noticefile=" + noticefile
				+ "]";
	}
	
	
}
