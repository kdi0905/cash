package kr.co.gdu.cash.controller;

import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.gdu.cash.service.CashbookService;
import kr.co.gdu.cash.service.CategoryService;
import kr.co.gdu.cash.vo.Cashbook;
import kr.co.gdu.cash.vo.Category;

@Controller
public class CashbookController {
	@Autowired private CashbookService cashbookService;
	@Autowired private CategoryService categoryService;
	@GetMapping(value="/admin/cashbookByMonth/{target}/{currentYear}/{currentMonth}")
	public String cashbookByMonth(Model model,
			@PathVariable(name = "target", required = false ) String target,
			@PathVariable(name = "currentYear" ) int currentYear,
			@PathVariable(name = "currentMonth") int currentMonth) { 
		// 1-1. 요청분석
		Calendar currentDate = Calendar.getInstance(); // 2020년 11월 2일
		// currentYear 넘어오고, currentMonth도 넘어면
		//issue calender로 변경해보자
		if(currentYear != -1 && currentMonth != -1) {
			if(target.equals("pre")) {
				currentDate.add(Calendar.DATE, -1); // 날짜를 자동으로 -1을 한다 
			}else if(target.equals("next")) {
				currentDate.add(Calendar.DATE, +1);
			}
			currentDate.set(Calendar.YEAR, currentYear);
			currentDate.set(Calendar.MONTH, currentMonth-1);
		}
		currentDate.set(Calendar.DATE, 1); // 2020년 11월 1일
		
		currentYear = currentDate.get(Calendar.YEAR);
		currentMonth = currentDate.get(Calendar.MONTH) + 1;
		int lastDay = currentDate.getActualMaximum(Calendar.DATE);
		int firstDayOfWeek = currentDate.get(Calendar.DAY_OF_WEEK);
		//--------------------------------------------------------------------
		int sumOut  = cashbookService.getSumCashbookPriceByInOut("지출", currentYear, currentMonth);
		int sumIn = cashbookService.getSumCashbookPriceByInOut("수입", currentYear, currentMonth);
		
		//--------------------------------------------------------------------
		List<Map<String,Object>> cashList = cashbookService.getCashListByMonth(currentYear, currentMonth);
		//--------------------------------------------------------------------
		// 3. 뷰 모델 추가
		model.addAttribute("currentYear", currentYear); // 년
		model.addAttribute("currentMonth", currentMonth); // 월
		model.addAttribute("lastDay", lastDay); // 마지막 일
		model.addAttribute("firstDayOfWeek", firstDayOfWeek); // 1일의 요일
		
		model.addAttribute("sumIn",sumIn);//수입
		model.addAttribute("sumOut",sumOut); //지출
		
		model.addAttribute("cashList",cashList);
		return "admin/cashbookByMonth";
	}
	
	@GetMapping("/admin/cashbookByDay/{target}/{currentYear}/{currentMonth}/{currentDay}")
	public String cashbookByDay(Model model,
			@PathVariable(name = "target", required = false ) String target,
			@PathVariable(name = "currentYear", required=true) int currentYear, // required ->넘어올수도 있고 안넘어 올수도 있다.
			@PathVariable(name = "currentMonth", required=true) int currentMonth,
			@PathVariable(name = "currentDay", required=true) int currentDay) {
		
	
		Calendar targetDay = Calendar.getInstance();
		targetDay.set(Calendar.YEAR, currentYear);
		targetDay.set(Calendar.MONTH, currentMonth-1); // month는 0부터 시작
		targetDay.set(Calendar.DATE, currentDay);
	if(target.equals("pre")) {
		targetDay.add(Calendar.DATE, -1); // 날짜를 자동으로 -1을 한다 
	}else if(target.equals("next")) {
		targetDay.add(Calendar.DATE, +1);
	}
	List<Cashbook> cashbookList = cashbookService.getCashbookKistByDay(targetDay.get(Calendar.YEAR), targetDay.get(Calendar.MONTH)+1, targetDay.get(Calendar.DATE));
	model.addAttribute("currentYear",targetDay.get(Calendar.YEAR));
	model.addAttribute("currentMonth",targetDay.get(Calendar.MONTH)+1);
	model.addAttribute("currentDay",targetDay.get(Calendar.DATE));
	model.addAttribute("cashbookList",cashbookList);
	return "admin/cashbookByDay";
	}
	
	@GetMapping("/admin/addCashbook/{currentYear}/{currentMonth}/{currentDay}")
	public String addCashbook(Model model,
			@PathVariable(name = "currentYear", required=true) int currentYear,
			@PathVariable(name = "currentMonth", required=true) int currentMonth,
			@PathVariable(name = "currentDay", required=true) int currentDay) {
		
		List<Category> categoryList = categoryService.getCategoryList();
		model.addAttribute("currentYear",currentYear);
		model.addAttribute("currentMonth",currentMonth);
		model.addAttribute("currentDay",currentDay);
		model.addAttribute("categoryList",categoryList);
		return "admin/addCashbook"; // forward
	}
	
	@PostMapping("/admin/addCashbook/{currentYear}/{currentMonth}/{currentDay}")
	public String addCashbook(Cashbook cashbook,
			@PathVariable(name = "currentYear", required=true) int currentYear,
			@PathVariable(name = "currentMonth", required=true) int currentMonth,
			@PathVariable(name = "currentDay", required=true) int currentDay) {//커멘드객체
		System.out.println(cashbook);
		cashbookService.addCashbook(cashbook);
		return "redirect:/admin/cashbookByDay/now/"+currentYear+"/"+currentMonth+"/"+currentDay; //redirect => controller 에 있는 메서드를 다시 실행시킨다. //response.sendRedirct()
	}
	
	@GetMapping("/admin/deleteCashbook/{cashbookId}/{currentYear}/{currentMonth}/{currentDay}")
	public String deleteCashbook(
			@PathVariable(name="cashbookId") int cashbookId,
			@PathVariable(name = "currentYear", required=true) int currentYear,
			@PathVariable(name = "currentMonth", required=true) int currentMonth,
			@PathVariable(name = "currentDay", required=true) int currentDay) {
		cashbookService.deleteCashbook(cashbookId);
		return "redirect:/admin/cashbookByDay/now/"+currentYear+"/"+currentMonth+"/"+currentDay;
	}
	@GetMapping("/admin/updateCashbook/{cashbookId}/{currentYear}/{currentMonth}/{currentDay}")
	public String updateCashbook(Model model,
			@PathVariable(name="cashbookId") int cashbookId,
			@PathVariable(name = "currentYear", required=true) int currentYear,
			@PathVariable(name = "currentMonth", required=true) int currentMonth,
			@PathVariable(name = "currentDay", required=true) int currentDay
			) {
		
		Cashbook cashbook = cashbookService.getCashbookById(cashbookId);
		List<Category> categoryList = categoryService.getCategoryList();
		
		model.addAttribute("cashbook",cashbook);
		model.addAttribute("currentYear",currentYear);
		model.addAttribute("currentMonth",currentMonth);
		model.addAttribute("currentDay",currentDay);
		model.addAttribute("categoryList",categoryList);
		return "admin/updateCashbook";
	}
	@PostMapping("/admin/updateCashbook/{cashbookId}/{currentYear}/{currentMonth}/{currentDay}")
	public String updateCashbook(Cashbook cashbook,
			@PathVariable(name = "cashbookId", required=true) int cashbookId,
			@PathVariable(name = "currentYear", required=true) int currentYear,
			@PathVariable(name = "currentMonth", required=true) int currentMonth,
			@PathVariable(name = "currentDay", required=true) int currentDay
			) {
		cashbookService.updateCashbook(cashbook);
		return "redirect:/admin/cashbookByDay/now/"+currentYear+"/"+currentMonth+"/"+currentDay;
	}

}