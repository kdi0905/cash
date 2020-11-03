package kr.co.gdu.cash.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.gdu.cash.service.IndexService;


@Controller//객체를 생성한다
public class IndexController {
	@Autowired private IndexService indexService; //객체를 불러온다. 
	
	@GetMapping(value= {"/","index"})
	public String index(Model model) {
		Map<String,Object> map = indexService.getNoticeListAndInOutList();
		
		model.addAttribute("noticeList",map.get("noticeList"));
		model.addAttribute("inOutList",map.get("inOutList"));

		return "index";
	}
	
}
