package kr.co.gdu.cash.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.mapper.CashbookMapper;
import kr.co.gdu.cash.mapper.CommentMapper;
import kr.co.gdu.cash.mapper.NoticeMapper;
import kr.co.gdu.cash.vo.Notice;

@Service
@Transactional
public class NoticeService {
	@Autowired private NoticeMapper noticeMapper;
	@Autowired private CashbookMapper cashbookMapper;
	@Autowired private CommentMapper commentMapper;
	
	
	public List<Map<String,Object>> getInOutList() {
		return cashbookMapper.selectCashInOutList();
	}
	//공지사항 리스트
	public List<Notice> getNoticeListByPage(int currentPage, int rowPerPage){
		//int currentPage , int rowPerPage-> beginRow
		int beginRow = (currentPage-1)*rowPerPage;
		Map<String,Integer> map = new HashMap<String,Integer>();
		map.put("beginRow", beginRow);
		map.put("rowPerPage", rowPerPage );
		return noticeMapper.selectNoticeListByPage(map);
	}
	public int getCountNotice() {
		return noticeMapper.countNoticeList();
	}
	//공지사항 추가
	public int insertNotice(Notice notice) {
		return noticeMapper.insertNotice(notice);
	}
	//공지사항 상세보기
	public Notice getNoticeOneById(int noticeId) {
		return noticeMapper.selectNoticeOneById(noticeId);
	}
	//공지사항 삭제
	public void deleteNoticeOneById(int noticeId) {
		commentMapper.deleteCommentAll(noticeId);
		noticeMapper.deleteNoticeOneById(noticeId);
	}
	//공지사항 수정
	public int updateNoticeOne(Notice notice) {
		return noticeMapper.updateNoticeOne(notice);
	}
	
}
