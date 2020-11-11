package kr.co.gdu.cash.restcontroller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.restservice.MemberRestService;

@RestController
public class MemberRestController {
	@Autowired private MemberRestService memberRestService;
	
	@PostMapping("/admin/idCheck/{id}")
	public String idCheck(@PathVariable(name ="id") String id) {
		String returnId = memberRestService.getMemberId(id);
		System.out.println(returnId);
		if(returnId == null) {
			return "yes";
		}else {
			return "no";
		}
		
	}
}
