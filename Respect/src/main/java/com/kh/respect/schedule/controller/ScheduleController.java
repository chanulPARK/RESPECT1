package com.kh.respect.schedule.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.respect.common.Page;
import com.kh.respect.mySchedule.model.service.MyScheduleService;
import com.kh.respect.place.model.service.PlaceService;
import com.kh.respect.place.model.vo.Place;
import com.kh.respect.schedule.model.service.ScheduleService;
import com.kh.respect.schedule.model.vo.Schedule;
import com.kh.respect.schedule.model.vo.TimeTable;
import com.kh.respect.user.model.vo.User;

@Controller
public class ScheduleController {

	@Autowired 
	private ScheduleService service;
	@Autowired
	private PlaceService pservice;
	@Autowired 
	private MyScheduleService myservice;
	
	
	
	@RequestMapping("/schedule/scheduleList")
	public ModelAndView ScheduleList(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage)
	{
		ModelAndView mv=new ModelAndView();
		System.out.println("스케줄 컨트롤러 스케줄 리스트 첫페이지 : "+cPage);
		int numPerPage=9;
		List<Map<String,String>> list=service.selectScheduleList(cPage,numPerPage);
		System.out.println("스케줄 컨트롤러 게시물 리스트: "+list);
		
		int totalCount=service.selectTotalCount();
		System.out.println("스케줄 컨트롤러 게시물 갯수: "+totalCount);
		mv.addObject("list",list);
		mv.addObject("totalContent",totalCount);
		mv.addObject("pageBar",Page.getPage(cPage, numPerPage, totalCount,"scheduleList"));
		mv.setViewName("schedule/scheduleList");
		return mv;

	}
	
	@RequestMapping("/schedule/scheduleFilter")
	public ModelAndView ScheduleListFilter(String theme, int tripstate, String order)
	{
		ModelAndView mv=new ModelAndView();
		return mv;
	}
	
	@RequestMapping("/schedule/scheduleWrite")
	public ModelAndView ScheduleWrite(HttpSession session, ModelAndView mv)
	{
		
		List<Place> list=new ArrayList<Place>();
		list=pservice.selectSpotList(1, 5);
		List<Place> userList=new ArrayList<Place>();
		User user=(User)session.getAttribute("userLoggedIn");
		String userId=user.getUserId();
		userList=pservice.selectUserSpotList(userId,1,5);
		List<Place> putList=myservice.putPlaceList(userId, 1, 5);
		mv.addObject("putList",putList);
		mv.addObject("list",list);
		mv.addObject("userList",userList);
		mv.setViewName("schedule/scheduleWrite");
		return mv;
	}
	@RequestMapping("/schedule/scheduleWriteEnd")
	public ModelAndView ScheduleWriteEnd(HttpServletRequest request, String partyName2, String title2, String startDate2, String endDate2, int people2, String travelTheme2, int openflag2, int represent, @RequestParam(value="timevalue", required=false) String[] timevalue, @RequestParam(value="placevalue",required=false) String[] placevalue )
	{
		
		/*HttpSession session=request.getSession();
		User user=(User)session.getAttribute("userLoggedIn");*/
		
		ModelAndView mv=new ModelAndView();
		Schedule sc=new Schedule();
		sc.setTitle(title2);
		sc.setStartDate(startDate2);
		sc.setEndDate(endDate2);
		sc.setPeopleNum(people2);
		sc.setTravelTheme(travelTheme2);
		sc.setPublicFlag(openflag2);
		sc.setPlaceNo(represent);
		sc.setUserId("acll8029");
		sc.setPartyName(partyName2);
		System.out.println();
		TimeTable tt=null;
		List<TimeTable> list=new ArrayList<TimeTable>();
		if(timevalue!=null)
		{
			if(timevalue[0].length()==1)
			{
				tt=new TimeTable();
				tt.setDay(Integer.parseInt(timevalue[0]));
				tt.setTime(Integer.parseInt(timevalue[1]));
				tt.setPlaceNo(Integer.parseInt(placevalue[0]));
				list.add(tt);
			}
			else
			{
				for(int i=0; i<timevalue.length; i++)
				{
					tt=new TimeTable();
					
					StringTokenizer st=new StringTokenizer(timevalue[i],",");
					tt.setDay(Integer.parseInt(st.nextToken()));
					tt.setTime(Integer.parseInt(st.nextToken()));
					System.out.println(tt.getDay());
					System.out.println(tt.getTime());
					st=new StringTokenizer(placevalue[i], ",");
					tt.setPlaceNo(Integer.parseInt(st.nextToken()));
					System.out.println(tt.getPlaceNo());
					list.add(tt);
				}
			}
			
		}
		System.out.println("여기까지오나?");
		int result=service.insertSchedule(sc,list);
		String msg="";
		String loc="";
		if(result>0)
		{
			msg="일정 등록 성공";
			loc="/";
		}
		else
		{
			msg="일정 등록 실패";
			loc="/";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
		
		
	}
}
