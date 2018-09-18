package com.kh.respect.schedule.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.respect.place.model.service.PlaceService;
import com.kh.respect.place.model.vo.Place;
import com.kh.respect.schedule.model.service.ScheduleService;
import com.kh.respect.schedule.model.vo.Schedule;
import com.kh.respect.schedule.model.vo.ScheduleReply;
import com.kh.respect.schedule.model.vo.ScheduleReplyAttachment;
import com.kh.respect.schedule.model.vo.TimeTable;
import com.kh.respect.user.model.vo.User;

@Controller
public class ScheduleController {

	@Autowired 
	private ScheduleService service;
	@Autowired
	private PlaceService pservice;
	
	@RequestMapping("/schedule/scheduleWrite")
	public ModelAndView ScheduleWrite(HttpSession session, ModelAndView mv)
	{
		
		List<Place> list=new ArrayList<Place>();
		list=pservice.selectSpotList(1, 5);
		List<Place> userList=new ArrayList<Place>();
		User user=(User)session.getAttribute("userLoggedIn");
		String userId=user.getUserId();
		userList=pservice.selectUserSpotList(userId,1,5);
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
	
	
	//좋아요 증가및 감소
		// 뷰 호출할때 int goodCheck를 넘겨 0인지 1인지 구분하고 jsp에서 구분 (0은 추천안함, 1은이미 추천함) 
		@RequestMapping("/schedul/goodCountUpdate")
		public ModelAndView goodCountUpdate(Schedule schedule) {
			ModelAndView mv = new ModelAndView();
			int goodCheck = service.goodCountCheck(schedule);
			String msg = "";
			String loc = "";
			if(goodCheck==0) {
				int result2 = service.goodCountUp(schedule);
				if(result2>0) {
					msg = "추천이 완료되었습니다.";
					loc="/schedule/scheduleView?scheduleNo="+schedule.getScheduleNo();
				}else {
					msg = "추천에 실패했습니다.";
					loc="/schedule/scheduleView?scheduleNo="+schedule.getScheduleNo();
				}
			}else {
				int result = service.goodCountDown(schedule);
				if(result >0) {
					msg = "추천이 취소되었습니다.";
					loc="/schedule/scheduleView?scheduleNo="+schedule.getScheduleNo();
				}else {
					msg = "추천이 취소에 실패했습니다.";
					loc="/schedule/scheduleView?scheduleNo="+schedule.getScheduleNo();
				}
			}
			mv.addObject("msg",msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
			return mv;
		}
		
		//찜하기 증가및 감소
		// 뷰 호출할때 int bringCheck를 넘겨 0인지 1인지 구분하고 jsp에서 구분 (0은 찜안함, 1은이미 찜함) 
		@RequestMapping("/schedul/bringCountUpdate")
		public ModelAndView bringCountUpdate(Schedule schedule) {
			ModelAndView mv = new ModelAndView();
			int bringCheck = service.bringCountCheck(schedule);
			String msg = "";
			String loc = "";
			
			if(bringCheck==0) {
				int result = service.bringCountUp(schedule)	;
				if(result>0) {
					msg="찜한 목록에 추가되었습니다.";
					loc="/schedule/scheduleView?scheduleNo="+schedule.getScheduleNo();
				}else {
					msg="찜하기에 실패했습니다.";
					loc="/schedule/scheduleView?scheduleNo="+schedule.getScheduleNo();
				}
			}else {
				int result2 = service.bringCountDown(schedule);
				if(result2>0) {
					msg="찜하기가 취소되었습니다.";
					loc="/schedule/scheduleView?scheduleNo="+schedule.getScheduleNo();
				}else {
					msg="찜하기취소에 실패했습니다.";
					loc="/schedule/scheduleView?scheduleNo="+schedule.getScheduleNo();
				}
			}
			
			mv.addObject("msg",msg);
			mv.addObject("loc", loc);
			mv.setViewName("common/msg");
			return mv;
		}
	
	
	
}
