package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Cashbook;

//@Conpoment  부모
//@Controller, @Service, @Mapper,@Repository : 스테레오타입  자식
@Mapper
public interface CashbookMapper {
	int insertCashbook(Cashbook cashbook); //입력 수정 은 int로 사용
	List<Map<String, Object>> selectCashInOutList(); 
	Integer slectSumCashbookPriceByInOut(Map<String,Object> map);
	List<Map<String,Object>> selectCashListByMonth(Map<String,Object> map);
	List<Cashbook> selectCashBookListByDay(Map<String,Object> map);
	int deleteCashbook(int cashbookId);
	Cashbook selectCashbookById(int cashbookId);
	int updateCashbook(Cashbook cashbook);
	List<Cashbook> selectCashbookListByPage(Map<String,Object> map);
	int selectCashbookListCount();
	// 전체 cashbookList -> 엑셀파일
	List<Cashbook> selectCashbookListAll();
}
