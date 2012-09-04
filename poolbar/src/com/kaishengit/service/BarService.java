package com.kaishengit.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.mapper.BarMapper;
import com.kaishengit.util.DateUtil;

@Service
@Transactional
public class BarService {

	@Autowired
	private BarMapper barMapper;
	
	@Transactional(readOnly=true)
	public float findTotal(String startTime, String barid) {
		Map<String, String> map = new HashMap<String, String>();  
		map.put("startTime", startTime+" 00:00:00");  
		map.put("endTime", DateUtil.getNow());  
		
		map.put("barid", barid);
		return barMapper.getTotal(map);
	}
	@Transactional(readOnly=true)
	public float findTotal(String startTime, String endTime, String barid) {
		Map<String, String> map = new HashMap<String, String>();  
		map.put("startTime", startTime+" 00:00:00");  
		map.put("endTime", endTime + "23:59:59");  
		
		map.put("barid", barid);
		return barMapper.getTotal(map);
	}
}
