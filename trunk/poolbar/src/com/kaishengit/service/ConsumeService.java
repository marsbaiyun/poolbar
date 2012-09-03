package com.kaishengit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.mapper.ConsumeMapper;
import com.kaishengit.pojo.Consume;

@Service
@Transactional
public class ConsumeService {
    
    @Autowired
    private ConsumeMapper consumeMapper;
    
    public List<Consume> findByOrderId(String id) {
        return consumeMapper.findByOrderId(id);
    }
}
