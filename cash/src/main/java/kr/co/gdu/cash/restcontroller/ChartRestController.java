package kr.co.gdu.cash.restcontroller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.restservice.ChartRestService;

@RestController
public class ChartRestController {
	@Autowired ChartRestService chartRestService;
	
	@GetMapping("/admin/year")
	public List<String> Year() {
		System.out.println("ChartRestController 접속성공");
		
	
		return chartRestService.getYear(); 
	}
}
