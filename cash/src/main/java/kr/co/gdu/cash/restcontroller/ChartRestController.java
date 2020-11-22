package kr.co.gdu.cash.restcontroller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import kr.co.gdu.cash.restservice.ChartRestService;

@RestController
public class ChartRestController {
	@Autowired public ChartRestService chartRestService;
	
	//년도별 월 지출
	@GetMapping("/admin/totalOfMonthOutByYear/{year}")
	public Map<String,Object> totalOfMonthOutByYear(@PathVariable(name="year")int year){
		System.out.println("/totalOfMonthOutByYear 호출성공");
		return chartRestService.getTotalOfMonthOutByYear(year);
	}
	//년도별 월 수입
	@GetMapping("/admin/totalOfMonthInByYear/{year}")
	public Map<String,Object> totalOfMonthInByYear(@PathVariable(name="year")int year){
		System.out.println("/totalOfMonthByYear 호출성공");
		return chartRestService.getTotalOfMonthInByYear(year);
	}
	//년도별 수입/지출
	@GetMapping("/admin/totalOutAndInByYear/{year}")
	public Map<String,Object> totalOutAndInByYear(@PathVariable(name="year")int year){
		return chartRestService.getTotaloutAndInByYear(year);
	}
	//년도별 카테고리 수입
	@GetMapping("/admin/categoryInByYear/{year}")
	public Map<String,Object> categoryInByYear(@PathVariable(name="year")int year){
		return chartRestService.getCategoryInByYear(year);
	}
	//년도별 카테고리 지출
	@GetMapping("/admin/categoryOutByYear/{year}")
	public Map<String,Object> categoryOutByYear(@PathVariable(name="year")int year){
		return chartRestService.getCategoryOutByYear(year);
	}
	// 월 카테고리 수입
	@GetMapping("/admin/MonthOfCategoryInByYear/{year}")
	public List<Map<String,Object>> MonthOfCategoryInByYear(@PathVariable(name="year")int year){
		return chartRestService.getMonthOfCategoryInByYear(year);
	}
	// 월 카테고리 지출
	@GetMapping("/admin/MonthOfCategoryOutByYear/{year}")
	public List<Map<String,Object>> MonthOfCategoryOutByYear(@PathVariable(name="year")int year){
		return chartRestService.getMonthOfCategoryOutByYear(year);
	}
	//월 총 금액
	@GetMapping("/admin/MonthOfInAndOutByYear/{year}")
	public List<Map<String,Object>> MonthOfInAndOutByYear(@PathVariable(name="year")int year){
		return chartRestService.getMonthOfInAndOutByYear(year);
	}
	
	//날짜별 카테고리 수입
	@GetMapping("/admin/beetweenCategoryInByDate/{startDate}/{endDate}")
	public Map<String,Object> beetweenCategoryInByDate(
											@PathVariable(name="startDate") String startDate,
											@PathVariable(name="endDate") String endDate ){
		return chartRestService.getBetweenCategoryInOfDate(startDate, endDate);
		
	}
	//날짜별 카테고리 지출
	@GetMapping("/admin/beetweenCategoryOutByDate/{startDate}/{endDate}")
	public Map<String,Object> beetweenCategoryOutByDate(
											@PathVariable(name="startDate") String startDate,
											@PathVariable(name="endDate") String endDate ){
		return chartRestService.getBetweenCategoryOutOfDate(startDate, endDate);
		
	}
			
	
}
