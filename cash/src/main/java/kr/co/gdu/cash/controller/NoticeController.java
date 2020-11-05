package kr.co.gdu.cash.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Notice;

@Controller
public class NoticeController {
	@Autowired private NoticeService noticeService;
	//공지목록
	@GetMapping("/admin/noticeList")
	public String noticeList(Model model,@RequestParam(name="currentPage", defaultValue = "1")int currentPage) {
		
		int rowPerPage =10;
		List<Notice> noticeList = noticeService.getNoticeListByPage(currentPage, rowPerPage);
		
		int totalCount = noticeService.getCountNotice();
		int lastPage=0;
		if(totalCount%rowPerPage !=0) {
			lastPage= (totalCount/rowPerPage)+1;
		}else {
			lastPage=(totalCount/rowPerPage);
		}
		
		System.out.println("lastPage="+lastPage);
		System.out.println("totalCount="+totalCount);
		System.out.println("rowPerPage="+rowPerPage);
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("lastPage",lastPage);
		return "admin/notice/noticeList";
	}
	//공지 입력 폼
	@GetMapping("/admin/addNotice")
		public String addNotice() {
		return "admin/notice/addNotice";
	}
	//공지 입력 액션
	@PostMapping("admin/addNotice")
	public String addNotice(Notice notice) {
		noticeService.insertNotice(notice);
		return"redirect:/admin/noticeList";
	}
	//공지 상세보기
	@GetMapping("/admin/noticeOne")
	public String noticeOne(Model model,@RequestParam(name = "noticeId") int noticeId) {
		Notice notice = noticeService.getNoticeOneById(noticeId);
		model.addAttribute("notice",notice);
		return "admin/notice/noticeOne";
	}
	//공지 삭제
	@GetMapping("/admin/removeNotice")
	public String removeNotice(@RequestParam(value="noticeId")int noticeId) {
		noticeService.deleteNoticeOneById(noticeId);
		return "redirect:/admin/noticeList";
	}
	//공지 수정 폼
	@GetMapping("/admin/modifyNotice")
	public String modifyNotice(Model model, @RequestParam(name="noticeId") int noticeId) {
		Notice notice = noticeService.getNoticeOneById(noticeId);
		model.addAttribute("notice",notice);
		return "admin/notice/modifyNotice";
	}
	//공지 수정 액션
	@PostMapping("/admin/modifyNotice")
	public String modifyNotice(Notice notice) {
		noticeService.updateNoticeOne(notice);
		return "redirect:/admin/noticeOne?noticeId="+notice.getNoticeId();
	}
}
