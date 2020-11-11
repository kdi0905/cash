package kr.co.gdu.cash.ExcelController;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import kr.co.gdu.cash.service.CashbookService;
import kr.co.gdu.cash.vo.Cashbook;

@Controller
//@Scope("singleton") //한번만 만들어진다. // 컴포넌트타입의 스코프의 디폴트값은 "singleton"
public class ExcelCashbookController {
	@GetMapping(path= "/admin/cashbookListExcel", produces = "application/vnd.ms-excel")
	public String cashbookListExcel() {
		return "cashbookExcelView";
	}
}
@Component("cashbookExcelView")//객체 이름을 안적어주면 같은 이름으로 실행 // 대소문자 자동 변경
@Scope("prototype") //실행할때마다 실행
class CashbookExcelView extends AbstractXlsView{
	@Autowired private CashbookService cashbookService;
	@Override
	protected void buildExcelDocument(Map<String, Object> model, Workbook workbook, HttpServletRequest request,
		HttpServletResponse response) throws Exception {

		response.setHeader("Content-Disposition","attachment; filename=\"cashbook.xls\"" );
		//http head속성 //응답형태가 position오로 해주고 파일이름을 cashbook으로 해주세요
		
		List<Cashbook> cashbookList =cashbookService.getCashbookListAll();
		
		Sheet sheet = workbook.createSheet(); //sheet생성
		Row titleRow = sheet.createRow(0); 
		titleRow.createCell(0).setCellValue("cashbookId");
		titleRow.createCell(1).setCellValue("cashbookKind");
		titleRow.createCell(2).setCellValue("categoryName");
		titleRow.createCell(3).setCellValue("cashbookPrice");
		titleRow.createCell(4).setCellValue("cashbookContent");
		titleRow.createCell(5).setCellValue("cashbookDate");
		titleRow.createCell(6).setCellValue("createDate");
		titleRow.createCell(7).setCellValue("updateDate");
		
		
		int rowNum=1;
		for(Cashbook c : cashbookList) {
			Row row = sheet.createRow(rowNum);
			row.createCell(0).setCellValue(c.getCashbookId());
			row.createCell(1).setCellValue(c.getCashbookKind());
			row.createCell(2).setCellValue(c.getCategoryName());
			row.createCell(3).setCellValue(c.getCashbookPrice());
			row.createCell(4).setCellValue(c.getCashbookContent());
			row.createCell(5).setCellValue(c.getCashbookDate());
			row.createCell(6).setCellValue(c.getCreateDate());
			row.createCell(7).setCellValue(c.getUpdateDate());
			
			rowNum+=1;
		}
	}
	
}