package com.kaishengit.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.mapper.ConsumeMapper;
import com.kaishengit.mapper.DeskMapper;
import com.kaishengit.mapper.OrderMapper;
import com.kaishengit.pojo.Consume;
import com.kaishengit.pojo.Desk;
import com.kaishengit.pojo.Order;
import com.kaishengit.util.PKUtil;

@Service
@Transactional
public class DeskService {
    
    @Autowired
    private DeskMapper deskMapper;
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private ConsumeMapper consumeMapper;
    
    public List<Desk> findAll(String barid) {
        return deskMapper.findAll(barid);
    }
    
    public Desk findById(Desk desk) {
        return deskMapper.findById(desk);
    }
    
    public List<Desk> findEmpty(Desk desk) {
        return deskMapper.findEmpty(desk);
    }
    
    public void changeDesk(Desk desk, int deskId) {
        //获取原来球桌的order
        desk = deskMapper.findById(desk);
        String orderId = desk.getOrder().getId();
        
        //将原来球桌的order设为null
        desk.setOrderid(null);
        deskMapper.updateOrderChange(desk);
        
        //将目标球桌的order设为账单order
        Desk goalDesk = new Desk();
        goalDesk.setId(deskId);
        goalDesk.setBarid(desk.getBarid());
        goalDesk.setOrderid(orderId);
        
        deskMapper.updateOrderChange(goalDesk);
        
        //更新order的球桌号
        Order order = orderMapper.findById(orderId);
        order.setDeskid(deskId);
        orderMapper.update(order);
        
    }

    public void shop(Desk desk, Consume consume) {
        desk = deskMapper.findById(desk);
        consume.setOrderid(desk.getOrder().getId());
        consume.setId(PKUtil.getPK());
        consumeMapper.save(consume);
    }
}
