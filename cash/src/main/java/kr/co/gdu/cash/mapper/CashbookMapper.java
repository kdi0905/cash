package kr.co.gdu.cash.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.co.gdu.cash.vo.Cashbook;

//@Conpoment  부모
//@Controller, @Service, @Mapper,@Repository : 스테레오타입  자식
@Mapper
public interface CashbookMapper {
	List<Map<String, Object>> selectCashInOutList(); 
	Integer slectSumCashbookPriceByInOut(Map<String,Object> map);
	List<Map<String,Object>> selectCashListByMonth(Map<String,Object> map);
	List<Cashbook> selectCashBookListByDay(Map<String,Object> map);
}
