package com.kh.respect.schedule.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.kh.respect.common.Page;
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
	
	
	@RequestMapping("/schedule/scheduleReportInsert")
	public ModelAndView scheduleReview(int scheduleNo,String [] reportTitle, String [] reportContent)
	{
		ModelAndView mv= new ModelAndView();
		System.out.println();
		for(int i=0; i<reportTitle.length; i++)
		{
			System.out.println("제목 배열 :"+reportTitle[i]);
			System.out.println("내용 배열 :"+reportContent[i]);
		}
		
		mv.setViewName("schedule/scheduleReportView");
		return mv;
	}
	
	@RequestMapping("/schedule/scheduleReport")
	public ModelAndView scheduleReview(int scheduleNo)
	{
		ModelAndView mv= new ModelAndView();
		Map<String, String> map=service.selectOneScheduleView(scheduleNo);
		List<TimeTable> tt=service.selectOneTimetableView(scheduleNo);
		
		mv.addObject("viewList",map);
		mv.addObject("tt",tt);
		mv.setViewName("schedule/scheduleReportForm");
		return mv;
	}
	
	@RequestMapping("/schedule/myPlaceAddView")
	public String myPlaceAddView(String detailAddr,Model model)
	{
		model.addAttribute("detailAddr",detailAddr);
		return "schedule/myPlaceAddForm";
	}
	
	@RequestMapping("/schedule/scheduleView")
	public ModelAndView ScheduleView(HttpSession session,int scheduleNo)
	{
		ModelAndView mv= new ModelAndView();
		Map<String, String> map=service.selectOneScheduleView(scheduleNo);
		List<TimeTable> tt=service.selectOneTimetableView(scheduleNo);
		
		
		Gson gson=new Gson();
		String json = gson.toJson(tt);
		mv.addObject("viewList",map);
		mv.addObject("tt",json);

		
		
		//댓글
		List<Map<String, String>> scheduleReplyList = service.scheduleReplyList(scheduleNo);
        List<Map<String, String>> scheduleAttList = service.scheduleAttList();
	      
	      
	      mv.addObject("scheduleReplyList",scheduleReplyList);
	      mv.addObject("scheduleAttList",scheduleAttList);
	      mv.setViewName("schedule/scheduleView");
		return mv;
	}
	
	@RequestMapping("/schedule/scheduleList")
	public ModelAndView ScheduleList(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage)
	{
		ModelAndView mv=new ModelAndView();
		System.out.println("스케줄 컨트롤러 스케줄 리스트 첫페이지 : "+cPage);
		int numPerPage=8;
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
	public ModelAndView ScheduleListFilter(@RequestParam(value="cPage",required=false,defaultValue="1") int cPage, String tripType, String tripPartner, String sort)
	{
		
		ModelAndView mv=new ModelAndView();
		System.out.println("스케줄 컨트롤러 필터 sort:"+sort);
		System.out.println("스케줄 컨트롤러 필터 tripType:"+tripType);
		System.out.println("스케줄 컨트롤러 필터 partyName:"+tripPartner);
		
		int numPerPage=8;
		
		Map<String,String> map= new HashMap();
		map.put("tripType", tripType);
		map.put("partyName", tripPartner);
		map.put("sort", sort);
		
		
		int totalCount=service.selectTotalCount();
		List<Map<String,String>> list=service.selectScheduleFilter(map,numPerPage,cPage);
		System.out.println("스케줄 컨트롤러 게시물 리스트: "+list);
		
		mv.addObject("list",list);
		mv.addObject("totalContent",totalCount);
		mv.addObject("pageBar",Page.getPage(cPage, numPerPage, totalCount,"scheduleFilter"));
		mv.setViewName("schedule/scheduleList");
		
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
	
	
	
	   @RequestMapping("/scheduleReply/scheduleReplyWrite.do")
	   public ModelAndView scheduleReplyWrite(ScheduleReply schedulyReply, MultipartFile[] upFile, HttpServletRequest request) {
	      
	      String saveDir=request.getSession().getServletContext().getRealPath("/resources/upload/replyPicture");
	      
	      List<ScheduleReplyAttachment> attList=new ArrayList();
	      
	      File dir=new File(saveDir);
	      //경로가 없으면 경로를 만들어랏!!
	      if(dir.exists()==false) dir.mkdirs();
	      
	      for(MultipartFile f : upFile)
	      {
	         if(!f.isEmpty())
	         {
	            String originalFilename=f.getOriginalFilename();
	            //확장자 가져오기
	            String ext=originalFilename.substring(originalFilename.lastIndexOf(".")+1);
	            SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSS");
	            int rndNum=(int)(Math.random()*1000);
	            String renamedFileName=sdf.format(new Date(System.currentTimeMillis()));
	            renamedFileName+="_"+rndNum+"."+ext;
	            try 
	            {
	               /*서버의 해당경로에 파일을 저장하는 명령*/
	               f.transferTo(new File(saveDir+"/"+renamedFileName));
	            }
	            catch (Exception e) {
	               e.printStackTrace();
	            }
	            ScheduleReplyAttachment attach=new ScheduleReplyAttachment();
	            attach.setOriginName(originalFilename);
	            attach.setReNamed(renamedFileName);
	            attList.add(attach);
	         }
	      }
	      //파일업로드 끝~~
	      
	      int result=service.scheduleReplyWrite(schedulyReply,attList);
	      
	      String msg="";
	      String loc="";
	      if(result>0){
	         msg="댓글을 등록하였습니다!";
	         loc="/schedule/scheduleView?scheduleNo="+schedulyReply.getScheduleNo();
	      }
	      else{
	         msg="댓글등록에 실패하였습니다";
	         loc="/schedule/scheduleView?scheduleNo="+schedulyReply.getScheduleNo();
	      }
	      
	      ModelAndView mv=new ModelAndView();
	      mv.addObject("msg",msg);
	      mv.addObject("loc", loc);
	      mv.setViewName("common/msg");
	      return mv;
	   }
	   
	   
	   @RequestMapping("/scheduleReply/scheduleReplyWrite2.do")
	   public ModelAndView scheduleReplyWrite2(ScheduleReply schedulyReply) {
	      int result = service.scheduleReplyWrite2(schedulyReply);
	      
	      String msg="";
	      String loc="";
	      if(result>0){
	         msg="답글을 등록하였습니다!";
	         loc="/schedule/scheduleView?scheduleNo="+schedulyReply.getScheduleNo();
	      }
	      else{
	         msg="답글등록에 실패하였습니다";
	         loc="/schedule/scheduleView?scheduleNo="+schedulyReply.getScheduleNo();
	      }
	      
	      ModelAndView mv=new ModelAndView();
	      mv.addObject("msg",msg);
	      mv.addObject("loc", loc);
	      mv.setViewName("common/msg");
	      return mv;
	      
	   }
	   
	   
	   @RequestMapping("/scheduleReply/scheduleReplyDelete.do")
	   public ModelAndView scheduleReplyDelete(int replyNo, int scheduleNo) {
	      int result = service.scheduleReplyDelete(replyNo);
	      String msg="";
	      String loc="";
	      if(result>0) {
	         msg="댓글을 삭제하였습니다!";
	         loc="/schedule/scheduleView?scheduleNo="+scheduleNo;
	      }else {
	         msg="댓글 삭제에 실패하였습니다.";
	         loc="/schedule/scheduleView?scheduleNo="+scheduleNo;
	      }
	      ModelAndView mv=new ModelAndView();
	      mv.addObject("msg",msg);
	      mv.addObject("loc", loc);
	      mv.setViewName("common/msg");
	      return mv;
	   }
	   
	   @RequestMapping("/scheduleReply/scheduleReplyGood.do")
	   public ModelAndView scheduleReplyGood(ScheduleReply schedulyReply) {
	      
	      int check = service.scheduleReplyGoodCheck(schedulyReply);
	      String msg="";
	      String loc="";
	      if(check>0) {
	         msg="이미 추천하셨습니다.";
	         loc="/schedule/scheduleView?scheduleNo="+schedulyReply.getScheduleNo();
	      }else {
	         
	         service.insertscheduleReplyGood(schedulyReply);
	         
	         int result = service.scheduleReplyGood(schedulyReply.getReplyNo());   
	         
	         if(result>0) {
	            msg="추천을 하였습니다!";
	            loc="/schedule/scheduleView?scheduleNo="+schedulyReply.getScheduleNo();
	         }else {
	            msg="추천에 실패하였습니다.";
	            loc="/schedule/scheduleView?scheduleNo="+schedulyReply.getScheduleNo();
	         }
	      }
	      ModelAndView mv=new ModelAndView();
	      mv.addObject("msg",msg);
	      mv.addObject("loc", loc);
	      mv.setViewName("common/msg");
	      return mv;
	      
	   }
	
}
