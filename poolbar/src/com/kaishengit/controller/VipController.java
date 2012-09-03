package com.kaishengit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kaishengit.pojo.Vip;
import com.kaishengit.service.VipService;

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
	
	
	//新建
	@RequestMapping(value="/new", method=RequestMethod.POST)
	public String newVip(Vip vip){
		vip.setDiscount(0.9f);
		vip.setMoney(0);
		vipService.save(vip);
		return "redirect:list";
	}
	@RequestMapping(value="/new", method=RequestMethod.GET)
	public String newVip(){
		return "vip/vip-new";
	}
	//充值
	@RequestMapping(value="/recharge",method=RequestMethod.GET)
	public ModelAndView recharge(int id) {
		Vip vip = vipService.findById(id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("vip/vip-recharge");
		mav.addObject("vip", vip);
		return mav;
	}
	
	@RequestMapping(value="/recharge", method=RequestMethod.POST)
	public String recharge(Vip vip ,int addmoney){
		vip.setMoney(vip.getMoney() + addmoney);
		vipService.update(vip);
		return "redirect:list";
	}
	//修改
	@RequestMapping(value="/edit", method=RequestMethod.POST)
	public String editVip(Vip vip){
		vipService.update(vip);
		return "redirect:list";
	}
	
	@RequestMapping(value="/edit", method=RequestMethod.GET)
	public ModelAndView editVip(int id){
		Vip vip = vipService.findById(id);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("vip/vip-edit");
		mav.addObject("vip", vip);
		return mav;
	}
	
	//删除
	@RequestMapping("del/{id}")
	public String delVip(@PathVariable("id") int id){
		
		vipService.del(id);
		return "redirect:/vip/list";
	}
	//搜索
	@RequestMapping("find")
	public ModelAndView find(Vip vip){
		
		List<Vip> vipList = vipService.find(vip);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("vip/vip");
		mav.addObject("vipList",vipList);
		return mav;
	}
	
}
