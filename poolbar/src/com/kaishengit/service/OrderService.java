package com.kaishengit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.mapper.DeskMapper;
import com.kaishengit.mapper.OrderMapper;
import com.kaishengit.pojo.Desk;
import com.kaishengit.pojo.Order;

@Service
@Transactional
public class OrderService {
    
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private DeskMapper deskMapper;
    
    public void save(Order order) {
        orderMapper.save(order);
        Desk desk = deskMapper.findById(order.getDeskid());
        desk.setOrderid(order.getId());
        deskMapper.update(desk);
    }
    
}
