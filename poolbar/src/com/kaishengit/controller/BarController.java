package com.kaishengit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;


import org.apache.ibatis.io.ResolverUtil.IsA;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kaishengit.pojo.Account;
import com.kaishengit.pojo.Consume;
import com.kaishengit.pojo.Desk;
import com.kaishengit.pojo.Produce;
import com.kaishengit.service.BarService;
import com.kaishengit.service.ConsumeService;
import com.kaishengit.service.DeskService;
import com.kaishengit.service.ProduceService;
import com.kaishengit.util.DateUtil;

@Controller
@RequestMapping("/bar")
public class BarController {

	@Autowired
	private BarService barService;
	
	@Autowired
	private DeskService deskService;
	
	@Autowired
	private ProduceService produceService;
	
	@Autowired
	private ConsumeService consumeService;
	
	@RequestMapping(value="/main",method=RequestMethod.GET)
	public String menu (Model model,HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		List<Desk> desklist = deskService.findByBarid(account.getBar().getId());
		model.addAttribute("desklist", desklist);
		return "bar/main";
	}
	
	@RequestMapping(value="/checkdeskid",produces=MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody Desk checkdeskid (int deskid,HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		Desk desk = new Desk();
		desk.setId(deskid);
		desk.setBarid(account.getBar().getId());
		Desk d = deskService.findCheckid(desk);
		return d;
	}
	
	@RequestMapping(value="/count",method=RequestMethod.GET)
	public ModelAndView count(HttpSession session){
		Account account = (Account) session.getAttribute("account");
		String barid = account.getBar().getId();
		String startTime = DateUtil.getStartMonth();
		String endTime = DateUtil.getDay();
		String total = barService.findTotal(startTime,barid);
		if (total == null) {
			total = "0";
		}
		float f = new Float(total);		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("startTime", startTime);				
		mav.addObject("endTime", endTime);
		mav.addObject("total",f);
		mav.setViewName("count/count");
		return mav;
	}
	
	@RequestMapping(value="/count",method=RequestMethod.POST)
	public ModelAndView count(HttpSession session,String startTime,String endTime){
		Account account = (Account) session.getAttribute("account");
		String barid = account.getBar().getId();
		String total = barService.findTotal(startTime,endTime,barid);
		if (total == null) {
			total = "0";
		}
		float f = new Float(total);
		ModelAndView mav = new ModelAndView();
		mav.addObject("startTime", startTime);				
		mav.addObject("endTime", endTime);
		mav.addObject("total",f);
		mav.setViewName("count/count");
		return mav;
	}
	
	@RequestMapping(value="/count/produce",method=RequestMethod.GET)
	public ModelAndView producecount (HttpSession session) {
		ModelAndView mav = new ModelAndView();
		Account account = (Account) session.getAttribute("account");
		String barid = account.getBar().getId();
		String startTime = DateUtil.getStartMonth();
		String endTime = DateUtil.getDay();
		
		List<Consume> consumeList = consumeService.findProduceByBarid(startTime,barid);
		mav.addObject("starttime", startTime);				
		mav.addObject("endtime", endTime);
		mav.addObject("consumeList", consumeList);
		mav.setViewName("count/produce");
		return mav;
	}
	
	
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public String save (Desk desk,HttpSession session) {
		deskService.save(desk);
		return "redirect:/bar/main";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update (Desk desk) {
		deskService.updateDesk(desk);
		return "redirect:/bar/main";
	}
}
