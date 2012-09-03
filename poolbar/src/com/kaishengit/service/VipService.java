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

	public void save(Vip vip) {
		
		vipMapper.save(vip);
	}

	public void update(Vip vip) {
		vipMapper.update(vip);
		
	}

	public Vip findById(int id) {
		
		return vipMapper.findById(id);
	}

	public void del(int id) {
		vipMapper.del(id);
		
	}

	public List<Vip> find(Vip vip) {
		
		return vipMapper.find(vip);
	}

}
