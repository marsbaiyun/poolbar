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

    public int[] checkout(Order order, String select) {
        
        //�ر���̨
        deskMapper.checkout(order.getId());
        
        //money,���ص����ݣ�0Ϊ�����˵�����Ǯ����1Ϊ�ӿ��ڿ۳���Ǯ����2ΪӦ�����ֽ�
        int[] money = new int[3];
        
        //�����ɢ�ͣ���vipid��Ϊnull
        if ("1".equals(select) || order.getVipid() == null) {
            order.setVipid(null);
            money[0] = (int) order.getTotal();
            money[1] = 0;
            money[2] = (int) order.getTotal();
        } else {
            //����ǻ�Ա
            
            money[0] = (int) order.getTotal();
            Vip vip = vipMapper.findById(order.getVipid());

            //�۳����
            if (order.getTotal() > vip.getMoney()) {
                money[1] = vip.getMoney();
                money[2] = (int) (order.getTotal() - vip.getMoney());
                vip.setMoney(0);
            } else {
                money[1] = (int) order.getTotal();
                money[2] = 0;
                vip.setMoney((int) (vip.getMoney() - order.getTotal()));
            }
            //�鿴������������л�Ա����
            int total = (int) (orderMapper.findByVipId(order.getVipid()) + order.getTotal());
            if (total >= 500) {
                vip.setDiscount(0.8f);
            } else if (total >= 1000) {
                vip.setDiscount(0.7f);
            }
            
            vipMapper.update(vip);
        }
        
        //����order
        orderMapper.update(order);
        return money;
    }
    
}
