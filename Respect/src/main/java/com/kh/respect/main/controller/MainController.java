package com.kh.respect.main.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.respect.main.model.service.MainService;
import com.kh.respect.place.model.vo.Place;

@Controller
public class MainController {
	
	@Autowired
	private MainService service;
	
	@RequestMapping("/mainPage")
	public ModelAndView placeMainList(ModelAndView mv){
		
		List<Place> slist = service.selectMspList();
		List<Place> tlist = service.selectMtpList();
		List<Map<String, String>> mlist = service.selectMmpList();
		
		mv.addObject("slist", slist);
		mv.addObject("tlist", tlist);
		mv.addObject("mlist", mlist);
		mv.setViewName("main/main");
		
		return mv;
	}
	
	
	
	

}
