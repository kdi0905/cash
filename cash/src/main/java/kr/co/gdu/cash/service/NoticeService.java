package kr.co.gdu.cash.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import kr.co.gdu.cash.mapper.CommentMapper;
import kr.co.gdu.cash.mapper.NoticeMapper;
import kr.co.gdu.cash.mapper.NoticefileMapper;
import kr.co.gdu.cash.vo.Notice;
import kr.co.gdu.cash.vo.NoticeForm;
import kr.co.gdu.cash.vo.Noticefile;

@Service
@Transactional
public class NoticeService {
	
	@Autowired private NoticeMapper noticeMapper;
	@Autowired private CommentMapper commentMapper;
	@Autowired private NoticefileMapper noticefileMapper;
	

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
	public void insertNotice(NoticeForm noticeForm,String PATH) {
		
		Notice notice = new Notice();
		
		notice.setNoticeTitle(noticeForm.getNoticeTitle());
		notice.setMemberId(noticeForm.getMemberId());
		notice.setNoticeContent(noticeForm.getNoticeContent());
		
		noticeMapper.insertNotice(notice);
		
		List<Noticefile> noticefile = null;
		if(noticeForm.getNoticefile()!=null) {
			noticefile=new ArrayList<Noticefile>();
			for(MultipartFile mf: noticeForm.getNoticefile()) {
				Noticefile nf = new Noticefile();
				
				int p = mf.getOriginalFilename().lastIndexOf(".");
				String ext= mf.getOriginalFilename().substring(p).toLowerCase();
				String filename=UUID.randomUUID().toString().replace("-","");
				nf.setNoticeId(notice.getNoticeId());
				nf.setNoticefileName(filename+ext);
				nf.setNoticefileSize(mf.getSize());
				nf.setNoticefileType(mf.getContentType());
				nf.setOriginalfileName(mf.getOriginalFilename());
				
				noticefile.add(nf);
				try {
					mf.transferTo(new File(PATH+filename+ext));
				}catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		}
		if(noticefile != null) {
			for(Noticefile bf : noticefile) {
				noticefileMapper.insertNoticefile(bf);
			}
		}
	}
	//공지사항 상세보기
	public Notice getNoticeOneById(int noticeId) {
		return noticeMapper.selectNoticeOneById(noticeId);
	}
	//공지사항 삭제
	public void deleteNoticeOneById(int noticeId) {
		commentMapper.deleteCommentAll(noticeId);
		noticefileMapper.deleteNoticefileAll(noticeId);
		noticeMapper.deleteNoticeOneById(noticeId);
	}
	//공지사항 수정
	public void updateNoticeOne(NoticeForm noticeForm,String PATH) {
		Notice notice = new Notice();
		notice.setNoticeId(noticeForm.getNoticeId());
		notice.setNoticeTitle(noticeForm.getNoticeTitle());
		notice.setMemberId(noticeForm.getMemberId());
		notice.setNoticeContent(noticeForm.getNoticeContent());
		
		noticeMapper.updateNoticeOne(notice);
		
		List<Noticefile> noticefile = null;
		if(noticeForm.getNoticefile()!=null) {
			noticefile=new ArrayList<Noticefile>();
			for(MultipartFile mf: noticeForm.getNoticefile()) {
				Noticefile nf = new Noticefile();
				
				int p = mf.getOriginalFilename().lastIndexOf(".");
				String ext= mf.getOriginalFilename().substring(p).toLowerCase();
				String filename=UUID.randomUUID().toString().replace("-","");
				nf.setNoticeId(notice.getNoticeId());
				nf.setNoticefileName(filename+ext);
				nf.setNoticefileSize(mf.getSize());
				nf.setNoticefileType(mf.getContentType());
				nf.setOriginalfileName(mf.getOriginalFilename());
				
				noticefile.add(nf);
				try {
					mf.transferTo(new File(PATH+filename+ext));
				}catch (Exception e) {
					e.printStackTrace();
					throw new RuntimeException();
				}
			}
		}
		if(noticefile != null) {
			for(Noticefile bf : noticefile) {
				noticefileMapper.insertNoticefile(bf);
			}
		}
	}
	//파일 하나 삭제
	public void deletefileOne(int noticefileId,String PATH) {
		Noticefile noticefile = noticefileMapper.selectNoticefileOne(noticefileId);

		File file = new File(PATH+noticefile.getNoticefileName());
			if(file.exists()) {
				file.delete();
			}
			noticefileMapper.deleteNoticefileOne(noticefileId);
	}
	//파일 하나 보기
	public Noticefile getNoticefileOne(int noticefileId) {
		return noticefileMapper.selectNoticefileOne(noticefileId);
	}
	
}
