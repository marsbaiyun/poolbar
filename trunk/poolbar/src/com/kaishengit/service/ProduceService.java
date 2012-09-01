package com.kaishengit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.mapper.ProduceMapper;
import com.kaishengit.pojo.Produce;
import com.kaishengit.util.PKUtil;

@Service
@Transactional
public class ProduceService {

	@Autowired
	private ProduceMapper produceMapper;
	

	@SuppressWarnings("static-access")
	public void save (Produce produce) {
		produce.setId(new PKUtil().getPK());
		produceMapper.save(produce);
	}

	@Transactional(readOnly=true)
	public List<Produce> findByBarid(String barid) {
		return produceMapper.findByBarid(barid);
	}

	public void update(Produce produce) {
		produceMapper.update(produce);
	}

	public void delete(String id) {
		produceMapper.del(id);
	}
}
