package com.kaishengit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kaishengit.pojo.Vip;
import com.kaishengit.service.VipService;
import com.kaishengit.util.PKUtil;

@Controller
@RequestMapping("/vip")
public class VipController {
	
	@Autowired
	private VipService vipService;
	
	@RequestMapping(value={"","/list"})
	public ModelAndView list(){
		List<Vip> list = vipService.findAll();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("vip/vip");
		mav.addObject("vipList", list);
		return mav;
	}
	
	
	//ÐÂ½¨
	@RequestMapping(value="/new", method=RequestMethod.POST)
	public String newVip(Vip vip){
		String id = PKUtil.getPK();
		vip.setId(id);
		vip.setDiscount(0.9f);
		vipService.save(vip);
		return "redirect:list";
	}
	@RequestMapping(value="/new", method=RequestMethod.GET)
	public String newVip(){
		return "vip/vip-new";
	}
	
	//ÐÞ¸Ä
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public String editVip(Vip vip){
		vipService.update(vip);
		return "redirect:list";
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.GET)
	public ModelAndView editVip(String id){
		Vip vip = vipService.findById(id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("vip/vip-edit");
		mav.addObject("vip", vip);
		return mav;
	}
	
	@RequestMapping("del")
	public String delVip(String id){
		
		vipService.del(id);
		return "redirect:list";
	}
	
}
