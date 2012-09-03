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
    
    public Desk save(Order order) {
        //保存order
        orderMapper.save(order);
        
        //更新desk的order
        Desk desk = new Desk();
        desk.setId(order.getDeskid());
        desk.setBarid(order.getBarid());
        desk.setOrderid(order.getId());
        deskMapper.updateOrderChange(desk);
        
        //将更新后的返回
        desk = deskMapper.findById(desk);
        
        return desk;
    }

    public Order findById(String id) {
        return orderMapper.findById(id);
    }
    
}
