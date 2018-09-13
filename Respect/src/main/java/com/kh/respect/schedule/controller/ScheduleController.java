package com.kh.respect.schedule.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.respect.place.model.vo.Place;
import com.kh.respect.schedule.model.service.ScheduleService;
import com.kh.respect.schedule.model.vo.Schedule;

@Controller
public class ScheduleController {

	@Autowired 
	private ScheduleService service;
	
	@RequestMapping("/schedule/scheduleWrite")
	public ModelAndView ScheduleWrite(ModelAndView mv)
	{
		
		List<Place> list=new ArrayList<Place>();
		list.add(new Place(1,"중구네 카페","제주시 연동 680-7"));
		list.add(new Place(2,"중구네 음식점","애월읍 광령리 2698"));
		list.add(new Place(3,"중구네 관광지","이호동 1600-1"));
		list.add(new Place(4,"중구네 공항","서귀포시 효돈순환로 441"));
		list.add(new Place(5,"중구네 휴게소","제주시"));
		mv.addObject("list",list);
		mv.setViewName("schedule/scheduleWrite");
		return mv;
	}
	@RequestMapping("/schedule/scheduleWriteEnd")
	public void ScheduleWriteEnd(String title2, String startDate2, String endDate2, String people2, String travelTheme2, String openflag2, @RequestParam(value="timevalue", required=false) String[] timevalue, @RequestParam(value="placevalue",required=false) String[] placevalue)
	{
		Schedule sc=new Schedule();
		sc.setTitle(title2);
		sc.setStartDate(startDate2);
		sc.setEndDate(endDate2);
		sc.setPeopleNum(Integer.parseInt(people2));
		sc.setTravelTheme(travelTheme2);
		sc.setPublicFlag(Integer.parseInt(openflag2));
		
		if(timevalue!=null)
		{
			if(timevalue[0].length()==1)
			{
				String times=String.join(",", timevalue);
				String places=String.join(",", placevalue);
				System.out.println("값1개 시간: "+times);
				System.out.println("값1개 장소: "+places);
			}
			else
			{
				for(int i=0; i<timevalue.length; i++)
				{
					System.out.println("시간: "+timevalue[i]);
					System.out.println("장소: "+placevalue[i]);
				}
			}
			
		}
		
		
	}
}