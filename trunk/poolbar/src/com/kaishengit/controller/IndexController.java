package com.kaishengit.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kaishengit.pojo.Account;
import com.kaishengit.service.AccountService;

@Controller
public class IndexController {
	
	@Autowired
	private AccountService accountService;
	
	@RequestMapping(value="/login",method=RequestMethod.POST)
	public String login (HttpSession session,Account account,RedirectAttributes redirectAttributes) {
		Account a = accountService.login(account);
		if (a == null) {
			redirectAttributes.addFlashAttribute("error", "用户名或者密码错误！");
			redirectAttributes.addFlashAttribute("account", a);
			return "redirect:/home";
		} else {
			session.setAttribute("account", a);
			return "redirect:/consume";
		}
	}
	

}
