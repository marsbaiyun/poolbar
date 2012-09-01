package com.kaishengit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kaishengit.pojo.Vip;
import com.kaishengit.service.VipService;

@Controller
@RequestMapping("/vip")
public class VipController {
	
	@Autowired
	private VipService vipService;
	
	@RequestMapping(value="/list")
	public ModelAndView list(){
		List<Vip> list = vipService.findAll();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("vip/vip");
		mav.addObject("vipList", list);
		return mav;
	}
}
