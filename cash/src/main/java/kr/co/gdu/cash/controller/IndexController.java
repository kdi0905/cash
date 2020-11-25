package kr.co.gdu.cash.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.gdu.cash.service.CashbookService;
import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Notice;


@Controller//객체를 생성한다
public class IndexController {
	@Autowired private CashbookService cashbookService; //객체를 불러온다. 
	@Autowired private NoticeService noticeService;
	@GetMapping(value= "/admin/index")
	public String index(Model model) {
		List<Map<String,Object>> inOutList = cashbookService.getInOutList();
		List<Notice> noticeList = noticeService.getNoticeListByPage(1, 5);
		model.addAttribute("noticeList",noticeList);
		model.addAttribute("inOutList",inOutList);

		return "admin/index";
	}
	
}
