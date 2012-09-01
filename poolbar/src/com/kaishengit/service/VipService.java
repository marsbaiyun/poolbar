package com.kaishengit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.mapper.VipMapper;
import com.kaishengit.pojo.Vip;

@Service
@Transactional
public class VipService {
	
	@Autowired
	private VipMapper vipMapper;
	
	@Transactional(readOnly=true)
	public List<Vip> findAll() {
		
		return vipMapper.findAll();
	}

}
