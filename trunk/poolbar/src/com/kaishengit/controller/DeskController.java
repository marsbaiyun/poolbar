package com.kaishengit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kaishengit.pojo.Account;
import com.kaishengit.pojo.Bar;
import com.kaishengit.pojo.Desk;
import com.kaishengit.pojo.Order;
import com.kaishengit.service.DeskService;
import com.kaishengit.service.OrderService;
import com.kaishengit.util.DateUtil;
import com.kaishengit.util.PKUtil;

@Controller
@RequestMapping("/consume")
public class DeskController {
    
    @Autowired
    private DeskService deskService;
    @Autowired
    private OrderService orderService;
    
    @RequestMapping("")
    public ModelAndView toMain(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        
        Account account = (Account) session.getAttribute("account");
        Bar bar = account.getBar();
        List<Desk> deskList = deskService.findAll(bar.getId());
        mav.addObject("deskList", deskList);
        
        mav.setViewName("desk/main");
        return mav;
    }
    
    @RequestMapping("/open")
    public String open(int deskId, HttpSession session) {
        
        Account account = (Account) session.getAttribute("account");
        Bar bar = account.getBar();
        
        String orderId = PKUtil.getPK();
        Order order = new Order();
        order.setId(orderId);
        order.setStarttime(DateUtil.getNow());
        order.setDeskid(deskId);
        order.setBarid(bar.getId());
        order.setAccountid(account.getId());
        orderService.save(order);
        
        
        return "redirect:/consume";
    }
}