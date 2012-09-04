package com.kaishengit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kaishengit.mapper.BarMapper;
import com.kaishengit.pojo.Account;
import com.kaishengit.pojo.Bar;
import com.kaishengit.util.DateUtil;

@Controller
@RequestMapping("/bar")
public class BarController {

	@Autowired
	private BarMapper barMapper;
	
	@RequestMapping(value="/main",method=RequestMethod.GET)
	public String menu () {
		return "bar/main";
	}
	
	@RequestMapping(value="/count",method=RequestMethod.GET)
	public ModelAndView count(HttpSession session){
		Account account = (Account) session.getAttribute("account");
		Bar bar = account.getBar();
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("startTime", DateUtil.getStartMonth());				
		mav.addObject("endTime", DateUtil.getDay());
		mav.setViewName("count/count");
		return mav;
	}
	@RequestMapping(value="/count",method=RequestMethod.POST)
	public ModelAndView count(HttpSession session,String startTime,String endTime){
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("startTime",startTime );
		mav.addObject("endTime",endTime);
		mav.setViewName("count/count");
		return mav;
	}
	
}
