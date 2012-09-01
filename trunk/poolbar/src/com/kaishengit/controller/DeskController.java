package com.kaishengit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kaishengit.pojo.Account;

@Controller
@RequestMapping("/consume")
public class DeskController {
    
    @RequestMapping("")
    public ModelAndView toMain(HttpSession session) {
        ModelAndView mav = new ModelAndView();
        
        Account account = (Account) session.getAttribute("account");
        
        
        mav.setViewName("desk/main");
        return mav;
    }
}
