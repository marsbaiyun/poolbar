package com.kaishengit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.mapper.DeskMapper;
import com.kaishengit.pojo.Desk;

@Service
@Transactional
public class DeskService {
    
    @Autowired
    private DeskMapper deskMapper;
    
    public List<Desk> findAll(String barid) {
        return deskMapper.findAll(barid);
    }
    
}
