package kr.co.gdu.cash.restmapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ChartRestMapper {
	public List<String> selectYear();
	public Map<String,Object> selectTotalOfMonthByYear(int year);
}
