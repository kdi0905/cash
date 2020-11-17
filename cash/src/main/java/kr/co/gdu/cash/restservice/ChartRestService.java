package kr.co.gdu.cash.restservice;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.restmapper.ChartRestMapper;

@Service
@Transactional
public class ChartRestService {
	@Autowired ChartRestMapper chartRestMapper;
	
	public Map<String, Object> getTotalOfMonthOutByYear(int year){
		return chartRestMapper.selectTotalOfMonthOutByYear(year);
	}
	
	public Map<String, Object> getTotalOfMonthInByYear(int year){
		return chartRestMapper.selectTotalOfMonthInByYear(year);
	}
	
	public Map<String,Object> getTotaloutAndInByYear(int year){
		return chartRestMapper.selectTotalOutAndInByYear(year);
	}
	
	public Map<String,Object> getCategoryInByYear(int year){
		return chartRestMapper.selectCategoryInByYear(year);
	}
	
	public Map<String,Object> getCategoryOutByYear(int year){
		return chartRestMapper.selectCategoryOutByYear(year);
	}
}
