package kr.co.gdu.cash.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.restservice.MemberRestService;

@RestController
public class MemberRestController {
	@Autowired private MemberRestService memberRestService;
	
	@PostMapping("/idCheck/{memberId}")
	public String idCheck(@PathVariable(name ="memberId") String memberId) {
		String returnId = memberRestService.getMemberId(memberId);
		System.out.println(returnId);
		if(returnId == null) {
			return "yes";
		}else {
			return "no";
		}
		
	}
	@PostMapping("/nameCheck/{memberName}")
	public String nameCheck(@PathVariable(name ="memberName") String memberName) {
		String returnName = memberRestService.getMemberName(memberName);
		System.out.println(returnName);
		if(returnName == null) {
			return "yes";
		}else {
			return "no";
		}
		
	}
}
