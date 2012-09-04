package com.kaishengit.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.mapper.ConsumeMapper;
import com.kaishengit.pojo.Consume;
import com.kaishengit.util.DateUtil;

@Service
@Transactional
public class ConsumeService {
    
    @Autowired
    private ConsumeMapper consumeMapper;
    
    @Transactional(readOnly=true)  
    public List<Consume> findByOrderId(String id) {
        return consumeMapper.findByOrderId(id);
    }

    @Transactional(readOnly=true)
	public List<Consume> findProduceByBarid(String starTtime,String barid) {
		Map<String, String> map = new HashMap<String, String>();  
		map.put("starttime", starTtime +" 00:00:00");  
		map.put("endtime", DateUtil.getNow());  
		map.put("barid", barid);
		System.out.println(consumeMapper.findProduceByBarid(map).size());
		return consumeMapper.findProduceByBarid(map);
		
	}
}
