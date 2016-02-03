package com.mydate.zzazum.location.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mydate.zzazum.location.repository.LocationDataInter;
import com.mydate.zzazum.location.service.ApiLoadService;
import com.mydate.zzazum.location.service.LocationDataService;
import com.mydate.zzazum.location.vo.LocationVo;

@Controller
public class ApiDbController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(ApiDbController.class);
	
	@Autowired
	private LocationDataService locationDataService;

	@RequestMapping(value = "/test")
	public ModelAndView apiLoad() throws IOException{
		
		return new ModelAndView("test");
	}
	
	@RequestMapping(value = "/test", method=RequestMethod.POST)
	public ModelAndView apiUpdate(LocationVo location) throws IOException {
		boolean b = locationDataService.insertApiData(location);
		System.out.println(b);
		return new ModelAndView("test");
	}
}
