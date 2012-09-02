package com.kaishengit.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kaishengit.pojo.Account;
import com.kaishengit.pojo.Produce;
import com.kaishengit.service.ProduceService;

@Controller
@RequestMapping("/produce")
public class ProduceController {

	@Autowired
	private ProduceService produceService;
	
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public String list (Model model,HttpSession session) {
		Account account = (Account) session.getAttribute("account");
		List<Produce> producelist = produceService.findByBarid(account.getBar().getId());
		model.addAttribute("producelist",producelist);
		return "produce/list";
	}
	
	@RequestMapping(value="/save",method=RequestMethod.POST)
	public String save (Produce produce) {
		produceService.save(produce);
		return "redirect:list";
	}
	
	@RequestMapping(value="/update",method=RequestMethod.POST)
	public String update (Produce produce) {
		produceService.update(produce);
		return "redirect:list";
	}
	
	@RequestMapping(value="/del/{id}",method=RequestMethod.GET)
	public String delete (@PathVariable("id") String id) {
		produceService.delete(id);
		return "redirect:/produce/list";
	}
}
