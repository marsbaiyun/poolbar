package com.kaishengit.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kaishengit.mapper.DeskMapper;
import com.kaishengit.mapper.OrderMapper;
import com.kaishengit.mapper.VipMapper;
import com.kaishengit.pojo.Desk;
import com.kaishengit.pojo.Order;
import com.kaishengit.pojo.Vip;

@Service
@Transactional
public class OrderService {
    
    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private DeskMapper deskMapper;
    @Autowired
    private VipMapper vipMapper;
    
    public Desk save(Order order) {
        //����order
        orderMapper.save(order);
        
        //����desk��order
        Desk desk = new Desk();
        desk.setId(order.getDeskid());
        desk.setBarid(order.getBarid());
        desk.setOrderid(order.getId());
        deskMapper.updateOrderChange(desk);
        
        //�����º�ķ���
        desk = deskMapper.findById(desk);
        
        return desk;
    }

    public Order findById(String id) {
        return orderMapper.findById(id);
    }

    public void checkout(Order order, String select) {
        
        //�ر���̨
        deskMapper.checkout(order.getId());
        
        //�����ɢ�ͣ���vipid��Ϊnull
        if ("1".equals(select) || order.getVipid() == null) {
            order.setVipid(null);
        } else {
            //����ǻ�Ա���鿴������������л�Ա����
            Vip vip = new Vip();
            vip.setId(order.getVipid());
            int total = (int) (orderMapper.findByVipId(order.getVipid()) + order.getTotal());
            if (total >= 500) {
                vip.setDiscount(0.8f);
            } else if (total >= 1000) {
                vip.setDiscount(0.7f);
            }
            vipMapper.updateDiscount(vip);
        }
        
        //����order
        orderMapper.update(order);
    }
    
}
