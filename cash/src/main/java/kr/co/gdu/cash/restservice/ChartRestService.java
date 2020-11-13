package kr.co.gdu.cash.restservice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.co.gdu.cash.restmapper.ChartRestMapper;

@Service
@Transactional
public class ChartRestService {
	@Autowired ChartRestMapper chartRestMapper;
	
	public List<String> getYear(){
		return chartRestMapper.selectYear();
	}
}
