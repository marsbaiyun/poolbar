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

    public void checkout(Order order, String select) {
        
        //关闭球台
        deskMapper.checkout(order.getId());
        
        //如果是散客，则将vipid设为null
        if ("1".equals(select) || order.getVipid() == null) {
            order.setVipid(null);
        } else {
            //如果是会员，查看消费情况，进行会员升级
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
        
        //更新order
        orderMapper.update(order);
    }
    
}
