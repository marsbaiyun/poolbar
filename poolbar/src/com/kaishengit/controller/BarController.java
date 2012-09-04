package com.kaishengit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kaishengit.pojo.Account;
import com.kaishengit.pojo.Desk;
import com.kaishengit.service.BarService;
import com.kaishengit.service.DeskService;
import com.kaishengit.pojo.Bar;
import com.kaishengit.util.DateUtil;

@Controller
@RequestMapping("/bar")
public class BarController {

	@Autowired
	private BarService barService;
	
	@Autowired
	private DeskService deskService;
	
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
