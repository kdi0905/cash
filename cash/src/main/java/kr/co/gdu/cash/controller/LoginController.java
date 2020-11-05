package kr.co.gdu.cash.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Notice;

@Controller
public class LoginController {
	@Autowired
	private NoticeService noticeService;
	//자바 관련 코드 타입이름을 같이 표현하는???방식
	//카멜방식
	//파스클 방식 - class
	//스네이크방식 
	
	@GetMapping({"/","/login"})
	public String login(Model model, HttpSession session) { //로그인 폼
		if(session.getAttribute("loginId")!= null) { //x_y, xY, intxy 
			return "redirect:/admin/index";
		}
		List<Notice> noticeList = noticeService.getNoticeList();
		model.addAttribute("noticeList",noticeList);
		
		return "login";
	}
	
	@PostMapping("/login")
	public String login(@RequestParam(value="id")String id) { // 로그인 액션
		return"";
	}
	@GetMapping("/admin/logout")
	public String logout(HttpSession session) { //로그인할때만 사용해서 간편하게 사용 //tnldnsqkdqjq
		session.invalidate();
		return"redirect:/";
	}
}
