package com.mydate.zzazum.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.mydate.zzazum.model.mapper.LocationDataInter;
import com.mydate.zzazum.model.service.ApiLoadInter;
import com.mydate.zzazum.model.vo.LocationVo;

@Controller
public class ApiDbController {
	
	private static final Logger LOGGER = LoggerFactory.getLogger(ApiDbController.class);
	
	@Autowired
	private ApiLoadInter apiDbUpdateInter;
	
	/*@Autowired
	private LocationDataInter locationDataInter;*/
	
	/*@Autowired
	private ApiDbUpdateInter apiUpdateInter;*/
	
	@RequestMapping(value = "/test")
	public ModelAndView apiUpdate() throws IOException{
		
		ArrayList<LocationVo> list = new ArrayList<LocationVo>();
		
		list = apiDbUpdateInter.apiUpdate();
		/*int maxCode = Integer.parseInt(locationDataInter.selectMaxNo());*/
		
		for(LocationVo l: list){
			/*maxCode++;*/
			/*
			System.out.println("----------");
			System.out.println(l.getP_name());
			*/
			LocationVo location = new LocationVo();
			/*location.setP_no(maxCode);*/
			location.setP_name(l.getP_name());
			location.setP_lat(l.getP_lat());
			location.setP_lng(l.getP_lng());
			location.setP_addr(l.getP_addr());
			location.setP_image(l.getP_image());
			/*locationDataInter.insertApiData(location);*/
			System.out.println(location.getP_name());
		}
		
		return new ModelAndView("test");
	}
}
