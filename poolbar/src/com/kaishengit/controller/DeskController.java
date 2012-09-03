package com.kaishengit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kaishengit.pojo.Account;
import com.kaishengit.pojo.Bar;
import com.kaishengit.pojo.Consume;
import com.kaishengit.pojo.Desk;
import com.kaishengit.pojo.Order;
import com.kaishengit.pojo.Produce;
import com.kaishengit.service.DeskService;
import com.kaishengit.service.OrderService;
import com.kaishengit.service.ProduceService;
import com.kaishengit.util.DateUtil;
import com.kaishengit.util.PKUtil;

@Controller
@RequestMapping("/consume")
public class DeskController {
    
    @Autowired
    private DeskService deskService;
    @Autowired
    private OrderService orderService;
    @Autowired
    private ProduceService produceService;
    
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
    
    @RequestMapping(value="/open",produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody Desk open(int deskId, HttpSession session) {
        Account account = (Account) session.getAttribute("account");
        Bar bar = account.getBar();
        
        String orderId = PKUtil.getPK();
        Order order = new Order();
        order.setId(orderId);
        order.setStarttime(DateUtil.getNow());
        order.setDeskid(deskId);
        order.setBarid(bar.getId());
        order.setAccountid(account.getId());
        Desk desk = orderService.save(order);
        
        return desk;
    }
    
    @RequestMapping(value="/findEmpty",produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<Desk> findEmpty(Desk desk) {
        List<Desk> deskList = deskService.findEmpty(desk);
        return deskList;
    }
    
    @RequestMapping(value="/getPro",produces=MediaType.APPLICATION_JSON_VALUE)
    public @ResponseBody List<Produce> findByBar(String barid) {
        return produceService.findByBarid(barid);
    }
    
    @RequestMapping("/change")
    public String change(Desk desk, int deskid) {
        deskService.changeDesk(desk, deskid);
        return "redirect:/consume";
    }
    
    @RequestMapping("/shop")
    public String shop(Desk desk, Consume consume) {
        deskService.shop(desk, consume);
        return "redirect:/consume";
    }
    
    @RequestMapping(value="/checkout")
    public ModelAndView getCheck(Desk desk) {
        ModelAndView mav = new ModelAndView();
        desk = deskService.findById(desk);
        Order order = orderService.findById(desk.getOrder().getId());
        order.setEndtime(DateUtil.getNow());
        order.setTotal((float) Math.ceil(DateUtil.getDiff(order.getStarttime(), order.getEndtime()) * desk.getPrice()));
        mav.addObject("order", order);
        mav.addObject("diff", DateUtil.getDiff(order.getStarttime(), order.getEndtime()));
        mav.setViewName("desk/checkout");
        return mav;
    }
}
