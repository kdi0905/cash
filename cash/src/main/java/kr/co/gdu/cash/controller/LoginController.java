package kr.co.gdu.cash.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.gdu.cash.service.MemberService;
import kr.co.gdu.cash.service.NoticeService;
import kr.co.gdu.cash.vo.Member;
import kr.co.gdu.cash.vo.Notice;

@Controller
public class LoginController {
	@Autowired private NoticeService noticeService;
	@Autowired private MemberService memberService;
	//자바 관련 코드 타입이름을 같이 표현하는???방식
	//카멜방식
	//파스클 방식 - class
	//스네이크방식 
	
	@GetMapping({"/","/login"})
	public String login(Model model, HttpSession session) { //로그인 폼
		if(session.getAttribute("loginId")!= null) { //x_y, xY, intxy 
			return "redirect:/admin/index";
		}
		
		List<Notice> noticeList = noticeService.getNoticeListByPage(1, 5);
		model.addAttribute("noticeList",noticeList);
		
		return "login";
	}
	
	@PostMapping("/login")
	public String login(Member member, HttpSession session
			//@RequestParam(value="id")String id,@RequestParam(value="pw")String pw
			) { // 로그인 액션
		Member loginMember= memberService.getMemberById(member);
		if(loginMember == null) {
			return"redirect:/login";
		}
		session.setAttribute("loginId", loginMember.getId());
		return"redirect:/admin/index";
	}
	@GetMapping("/admin/logout")
	public String logout(HttpSession session) { //로그인할때만 사용해서 간편하게 사용 //쉬운방법
		session.invalidate();
		return"redirect:/";
	}
}
