package kr.co.gdu.cash.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Notice;

@Controller

public class NoticeController {
	@Autowired private NoticeService noticeService;
	//공지목록
	@GetMapping("/admin/noticeList/{currentPage}")
	public String noticeList(Model model,@PathVariable(name="currentPage")int currentPage) {
		
		int rowPerPage =10;
		List<Notice> noticeList = noticeService.getNoticeListByPage(currentPage, rowPerPage);
		
		int totalCount = noticeService.getCountNotice();
		int lastPage=0;
		if(totalCount%rowPerPage !=0) {
			lastPage= (totalCount/rowPerPage)+1;
		}else {
			lastPage=(totalCount/rowPerPage);
		}
		int showPage =10;
		int showFirst =currentPage-(currentPage%showPage) +1; 
		if((currentPage&showPage)==0) {
			showFirst = currentPage-((currentPage-1)%showPage);
		}
		int showLast = showFirst+showPage-1; 
		System.out.println("lastPage="+lastPage);
		System.out.println("totalCount="+totalCount);
		System.out.println("rowPerPage="+rowPerPage);
		System.out.println("showFirst="+showFirst);
		System.out.println("showLast="+showLast);
	
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("currentPage",currentPage);
		model.addAttribute("lastPage",lastPage);
		model.addAttribute("showFirst",showFirst);
		model.addAttribute("showLast",showLast);
		return "admin/notice/noticeList";
	}
	//공지 입력 폼
	@GetMapping("/admin/addNotice")
		public String addNotice() {
		return "admin/notice/addNotice";
	}
	//공지 입력 액션
	@PostMapping("admin/addNotice")
	public String addNotice(Notice notice, HttpServletRequest request) {
		
		HttpSession session = ((HttpServletRequest)request).getSession();
		notice.setMemberId((String)session.getAttribute("loginId"));
		noticeService.insertNotice(notice);
		return"redirect:/admin/noticeList/1";
	}
	//공지 상세보기
	@GetMapping("/admin/noticeOne/{noticeId}")
	public String noticeOne(Model model,@PathVariable(name = "noticeId") int noticeId) {
		Notice notice = noticeService.getNoticeOneById(noticeId);
		model.addAttribute("notice",notice);
		return "admin/notice/noticeOne";
	}
	//공지 삭제
	@GetMapping("/admin/removeNotice/{noticeId}")
	public String removeNotice(@PathVariable(value="noticeId")int noticeId) {
		noticeService.deleteNoticeOneById(noticeId);
		return "redirect:/admin/noticeList/1";
	}
	//공지 수정 폼
	@GetMapping("/admin/modifyNotice/{noticeId}")
	public String modifyNotice(Model model, @PathVariable(name="noticeId") int noticeId) {
		Notice notice = noticeService.getNoticeOneById(noticeId);
		model.addAttribute("notice",notice);
		return "admin/notice/modifyNotice";
	}
	//공지 수정 액션
	@PostMapping("/admin/modifyNotice/{noticeId}")
	public String modifyNotice(Notice notice, @PathVariable(name="noticeId") int noticeId) {
		noticeService.updateNoticeOne(notice);
		return "redirect:/admin/noticeOne/"+notice.getNoticeId();
	}
}
