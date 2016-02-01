package com.mydate.zzazum.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlannerController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(PlannerController.class);
	
	@RequestMapping(value = "/planner")
	public String planner(){
		
		return "planner";
	}
}
