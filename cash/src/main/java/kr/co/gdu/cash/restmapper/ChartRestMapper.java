package kr.co.gdu.cash.restmapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChartRestMapper {
	public Map<String, Object> selectTotalOfMonthOutByYear(int year);
	public Map<String, Object> selectTotalOfMonthInByYear(int year);
	public Map<String,Object> selectTotalOutAndInByYear(int year);
	public Map<String,Object> selectCategoryInByYear(int year);
	public Map<String,Object> selectCategoryOutByYear(int year);
	public List<Map<String,Object>> selectMonthOfCategoryInByYear(int year); 
	public List<Map<String,Object>> selectMonthOfCategoryOutByYear(int year); 
	public List<Map<String,Object>> selectMonthOfInAndOutByYear(int year);
	public Map<String,Object> selectBetweenCategoryInOfDate(Map<String,Object> betweenDate);
	public Map<String,Object> selectBetweenCategoryOutOfDate(Map<String,Object> betweenDate);
}
