package com.kh.respect.schedule.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
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
		User user=(User)session.getAttribute("userLoggedIn");
		String userId=user.getUserId();
		
		List<Place> list=pservice.selectSpotList(1, 5);		
			
		List<Place> userList=pservice.selectUserSpotList(userId,1,5);
				
		List<Place> putList=myservice.putPlaceList(userId, 1, 5);
		
		mv.addObject("listBar",Page.getPageBarSC(1, 5, pservice.selectTotalCount(), 1));
		mv.addObject("userListBar",Page.getPageBarSC(1, 5, pservice.selectTotalUserCount(userId),2));
		mv.addObject("putListBar",Page.getPageBarSC(1, 5, myservice.putPlaceNum(userId),3));
		mv.addObject("putList",putList);
		mv.addObject("list",list);
		mv.addObject("userList",userList);
		mv.setViewName("schedule/scheduleWrite");
		return mv;
	}
	@RequestMapping("/schedule/scheduleWriteEnd")
	public ModelAndView ScheduleWriteEnd(HttpSession session, String partyName2, String title2, String startDate2, String endDate2, int people2, String travelTheme2, int openflag2, int represent, @RequestParam(value="timevalue", required=false) String[] timevalue, @RequestParam(value="placevalue",required=false) String[] placevalue )
	{
		
		
		User user=(User)session.getAttribute("userLoggedIn");
		String userId=user.getUserId();
		
		ModelAndView mv=new ModelAndView();
		Schedule sc=new Schedule();
		sc.setTitle(title2);
		sc.setStartDate(startDate2);
		sc.setEndDate(endDate2);
		sc.setPeopleNum(people2);
		sc.setTravelTheme(travelTheme2);
		sc.setPublicFlag(openflag2);
		sc.setPlaceNo(represent);
		sc.setUserId(userId);
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
	
	@RequestMapping(value="/schedule/placeList", method = RequestMethod.POST)
	public void placeListPaging(ModelAndView mv, int cPage, HttpServletResponse response, String keyword) throws Exception
	{	
		List<Place> list=new ArrayList<Place>();
		System.out.println(keyword);
		if(keyword==null)
		{
			list=pservice.selectSpotList(cPage, 5);
		}
		else
		{
			list=pservice.selectSearchList(cPage, 5,keyword);
		}
		
		
		
		String html="<a href='#'>관광지</a>|<a href='#'>숙소</a>|<a href='#'>음식점</a><hr>";
		for(Place p:list)
		{
			
			html+="<div class=' col-md-13 mt-3 justify-content-center' >";
			html+="<img class='mb-2' src='/respect/resources/upload/spot/thumbnail/"+p.getThumbnail()+"' style='width:85px;' height='60px;'>";
			html+="<br><p>"+p.getTitle()+"</p>";
			html+="<button class='btn mb-2' value='"+p.toString()+"' onclick='fn_add(event)'>일정등록</button></div><hr>";
		}
		if(keyword==null)
		{
			html+="<br><nav aria-label='Page navigation example'>"+Page.getPageBarSC(cPage, 5, pservice.selectTotalCount(), 1)+"</nav>";
		}
		else
		{
			html+="<br><nav aria-label='Page navigation example'>"+Page.getPageBarSC(cPage, 5, pservice.selectSearchCount(keyword), 1)+"</nav>";
		}
				
			
		response.getWriter().println(html);
				
	}
	@RequestMapping(value="/schedule/userList", method = RequestMethod.POST)
	public void userListPaging(ModelAndView mv, int cPage, HttpServletResponse response, HttpSession session) throws Exception
	{	
		User user=(User)session.getAttribute("userLoggedIn");
		String userId=user.getUserId();
		List<Place> list=pservice.selectUserSpotList(userId,1,5);
		
		
		String html="<a href='#'>관광지</a>|<a href='#'>숙소</a>|<a href='#'>음식점</a><hr>";
		for(Place p:list)
		{
			html+="<div class=' col-md-13 mt-3 justify-content-center' >";
			html+="<br><p>"+p.getTitle()+"</p>";
			html+="<button class='btn mb-2 mr-1' value='"+p.toString()+"' onclick='fn_addUPlace(event)'>일정등록</button></div><hr>";
			html+="<button class='btn mb-2' value='"+p.toString()+"' onclick='fn_deleteUserPlace(event)'>장소삭제</button></div><hr>";
		}
		html+="<br><nav aria-label='Page navigation example'>"+Page.getPageBarSC(cPage, 5, pservice.selectTotalUserCount(userId), 1)+"</nav>";		
				
		response.getWriter().println(html);
				
	}
	@RequestMapping(value="/schedule/putList", method = RequestMethod.POST)
	public void putListPaging(ModelAndView mv, int cPage, HttpServletResponse response,HttpSession session) throws Exception
	{	
		User user=(User)session.getAttribute("userLoggedIn");
		String userId=user.getUserId();
		List<Place> list=myservice.putPlaceList(userId, 1, 5);
		
		String html="<a href='#'>관광지</a>|<a href='#'>숙소</a>|<a href='#'>음식점</a><hr>";
		for(Place p:list)
		{
			html+="<div class=' col-md-13 mt-3 justify-content-center' >";
			html+="<img class='mb-2' src='/respect/resources/upload/spot/thumbnail/"+p.getThumbnail()+"' style='width:85px;' height='60px;'>";
			html+="<br><p>"+p.getTitle()+"</p>";
			html+="<button class='btn mb-2' value='"+p.toString()+"' onclick='fn_add(event)'>일정등록</button></div><hr>";
		}
		html+="<br><nav aria-label='Page navigation example'>"+Page.getPageBarSC(cPage, 5, myservice.putPlaceListTotalCount(userId), 1)+"</nav>";		
				
		response.getWriter().println(html);
				
	}
	
	@RequestMapping(value="/schedule/placeSearch", method = RequestMethod.POST)
	public void placeListSearch(ModelAndView mv, String keyword, HttpServletResponse response) throws Exception
	{	
		List<Place> list=pservice.selectSearchList(1, 5,keyword);
		String html="<a href='#'>관광지</a>|<a href='#'>숙소</a>|<a href='#'>음식점</a><hr>";
		for(Place p:list)
		{
			html+="<div class=' col-md-13 mt-3 justify-content-center' >";
			html+="<img class='mb-2' src='/respect/resources/upload/spot/thumbnail/"+p.getThumbnail()+"' style='width:85px;' height='60px;'>";
			html+="<br><p>"+p.getTitle()+"</p>";
			html+="<button class='btn mb-2' value='"+p.toString()+"' onclick='fn_add(event)'>일정등록</button></div><hr>";
		}
		html+="<br><nav aria-label='Page navigation example'>"+Page.getPageBarSC(1, 5, pservice.selectSearchCount(keyword), 1)+"</nav>";		
				
		response.getWriter().println(html);
				
	}
	
	@RequestMapping(value="/schedule/deletePlace", method = RequestMethod.POST)
	public void userListDelete(ModelAndView mv, int placeno, HttpServletResponse response, HttpSession session) throws Exception
	{	
		int result=pservice.deleteSpot(placeno);
		System.out.println(result);
		if(result>0)
		{
			
			User user=(User)session.getAttribute("userLoggedIn");
			String userId=user.getUserId();
			List<Place> list=pservice.selectUserSpotList(userId,1,5);
			
			
			String html="<a href='#'>관광지</a>|<a href='#'>숙소</a>|<a href='#'>음식점</a><hr>";
			for(Place p:list)
			{
				html+="<div class=' col-md-13 mt-3 justify-content-center' >";
				html+="<br><p>"+p.getTitle()+"</p>";
				html+="<button class='btn mb-2 mr-1' value='"+p.toString()+"' onclick='fn_addUPlace(event)'>일정등록</button></div>";
				html+="<button class='btn mb-2' value='"+p.toString()+"' onclick='fn_deleteUserPlace(event)'>장소삭제</button></div><hr>";
			}
			html+="<br><nav aria-label='Page navigation example'>"+Page.getPageBarSC(1, 5, pservice.selectTotalUserCount(userId), 1)+"</nav>";		
			
			response.getWriter().println(html);
		}
		else
		{
			String html="<script>alert('삭제실패')</script>";
			response.getWriter().println(html);
		}
		
	}
	
	@RequestMapping("schedule/updateSchedule")
	public ModelAndView updateSchedule(int scheduleNo,ModelAndView mv, HttpSession session)
	{
		User user=(User)session.getAttribute("userLoggedIn");
		String userId=user.getUserId();
		
		List<Place> list=pservice.selectSpotList(1, 5);		
			
		List<Place> userList=pservice.selectUserSpotList(userId,1,5);
				
		List<Place> putList=myservice.putPlaceList(userId, 1, 5);
		
		mv.addObject("listBar",Page.getPageBarSC(1, 5, pservice.selectTotalCount(), 1));
		mv.addObject("userListBar",Page.getPageBarSC(1, 5, pservice.selectTotalUserCount(userId),2));
		mv.addObject("putListBar",Page.getPageBarSC(1, 5, myservice.putPlaceNum(userId),3));
		mv.addObject("putList",putList);
		mv.addObject("list",list);
		mv.addObject("userList",userList);
		mv.addObject("scheduleNo",scheduleNo);
		Map sc=service.selectSchedule(scheduleNo);
		List<Map> ttList=service.selectTimeTableList(scheduleNo);
		
		
		Gson gson=new Gson();
		String json = gson.toJson(ttList);
		mv.addObject("schedule",sc);
		mv.addObject("ttList",json);
		mv.setViewName("schedule/scheduleUpdate");
		return mv;
	}
	
	@RequestMapping(value="/schedule/scheduleUpdateEnd", method = RequestMethod.POST)
	public ModelAndView ScheduleUpdateEnd(int scheduleNo, String partyName2, String title2, String startDate2, String endDate2, int people2, String travelTheme2, int openflag2, int represent, @RequestParam(value="timevalue", required=false) String[] timevalue, @RequestParam(value="placevalue",required=false) String[] placevalue )
	{
		System.out.println("여기오나?");
		ModelAndView mv=new ModelAndView();
		Schedule sc=new Schedule();
		sc.setTitle(title2);
		sc.setStartDate(startDate2);
		sc.setEndDate(endDate2);
		sc.setPeopleNum(people2);
		sc.setTravelTheme(travelTheme2);
		sc.setPublicFlag(openflag2);
		sc.setPlaceNo(represent);
		sc.setScheduleNo(scheduleNo);
		sc.setPartyName(partyName2);
		
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
				tt.setScheduleNo(scheduleNo);
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
					
					st=new StringTokenizer(placevalue[i], ",");
					tt.setPlaceNo(Integer.parseInt(st.nextToken()));
					tt.setScheduleNo(scheduleNo);
					list.add(tt);
				}
			}
			
		}
		
		int result=service.updateSchedule(sc,list);
		String msg="";
		String loc="";
		if(result>0)
		{
			msg="일정 수정 성공";
			loc="/";
		}
		else
		{
			msg="일정 수정 실패";
			loc="/";
		}
		
		mv.addObject("msg", msg);
		mv.addObject("loc",loc);
		mv.setViewName("common/msg");
		
		return mv;
		
		
	}
	
//	@RequestMapping("/schedule/deleteSchedule")
//	public ModelAndView deleteSchedule(int scheduleNo,ModelAndView mv)
//	{
//		int result=service.deleteSchedule(scheduleNo);
//		String msg="";
//		String loc="";
//		if(result>0)
//		{
//			msg="일정 삭제 성공";
//			loc="/";
//		}
//		else
//		{
//			msg="일정 삭제 실패";
//			loc="/";
//		}
//		
//		mv.addObject("msg", msg);
//		mv.addObject("loc",loc);
//		mv.setViewName("common/msg");
//		
//		return mv;
//	}
}
