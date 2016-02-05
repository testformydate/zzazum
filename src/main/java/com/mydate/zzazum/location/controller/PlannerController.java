package com.mydate.zzazum.location.controller;

import java.io.IOException;
import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mydate.zzazum.location.service.LocationDataService;
import com.mydate.zzazum.location.vo.LocationVo;

@Controller
public class PlannerController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(PlannerController.class);
	
	@Autowired
	private LocationDataService service;
	
	@RequestMapping(value = "/planner")
	public ModelAndView planner() throws IOException{
		ModelAndView modelAndView = new ModelAndView();
		
		ArrayList<LocationVo> list = service.selectAllData();
		System.out.println(list);
		modelAndView.addObject("list", list);
		modelAndView.setViewName("planner");
		return modelAndView;
	}
	
	public ModelAndView plannerSearch() throws IOException{
		ModelAndView modelAndView = new ModelAndView();
		
		return modelAndView;
	}
}
