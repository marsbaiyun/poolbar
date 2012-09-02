package com.kaishengit.controller;



import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kaishengit.pojo.Account;
import com.kaishengit.service.AccountService;

@Controller
@RequestMapping("/account")
public class AccountController {
	
	@Autowired
	private AccountService accountService;
	
	@RequestMapping(value="/inf",method=RequestMethod.GET)
	public String show () {
		return "account/inf";
	}
	
	@RequestMapping(value="/edite",method=RequestMethod.POST)
	public String edite (Account account,HttpSession session) {
		Account a = (Account) session.getAttribute("account");
		a.setName(account.getName());
		accountService.update(a);
		session.setAttribute("account", a);
		return "redirect:/account/inf";
	}

	@RequestMapping(value="/changepwd",method=RequestMethod.GET)
	public String changepwd () {
		return "account/changepwd";
	}
	
	@RequestMapping(value="/updatepwd",method=RequestMethod.POST)
	public ModelAndView updatepwd (String oldpwd,String newpwd,HttpSession session,Model model) {
		System.out.println(oldpwd);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/account/changepwd");
		Account a = (Account) session.getAttribute("account");
		if (oldpwd.equals(a.getPassword())) {
			a.setPassword(newpwd);
			accountService.update(a);
			session.setAttribute("account", a);
			mav.addObject("code", "001");
			return mav;
		} else {
			mav.addObject("code", "002");
			return mav;
		}
	}
}
