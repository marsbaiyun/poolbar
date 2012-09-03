package com.kaishengit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kaishengit.mapper.BarMapper;

@Controller
@RequestMapping("/bar")
public class BarController {

	@Autowired
	private BarMapper barMapper;
	
	@RequestMapping(value="/main",method=RequestMethod.GET)
	public String menu () {
		return "bar/main";
	}
	
	
}
