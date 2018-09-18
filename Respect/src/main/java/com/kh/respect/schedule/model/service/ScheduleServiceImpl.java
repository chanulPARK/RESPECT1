package com.kh.respect.schedule.model.service;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.respect.schedule.model.dao.ScheduleDao;
import com.kh.respect.schedule.model.vo.Schedule;
import com.kh.respect.schedule.model.vo.ScheduleReply;
import com.kh.respect.schedule.model.vo.ScheduleReplyAttachment;
import com.kh.respect.schedule.model.vo.TimeTable;


@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	SqlSessionTemplate session;
	
	@Autowired
	private ScheduleDao dao;
	
	@Override
	
	public int insertSchedule(Schedule sc, List<TimeTable> list) {
		System.out.println("서비스들어오나?");
		int result=0;
		int scheduleNo=0;
		result=dao.insertSchedule(session,sc);
		
		scheduleNo=sc.getScheduleNo();
		System.out.println("스케줄인서트 후 : "+scheduleNo);
		if(result>0)
		{
			System.out.println("타임테이블 조건문");
			if(list.size()>0)
			{
				
				for(TimeTable tt: list)
				{
					System.out.println("타임테이블 for문");
					tt.setScheduleNo(scheduleNo);
					result=dao.insertTimeTable(session,tt);
				}
			}
		}
		return result;
	}

	@Override
	public List<Map<String, String>> selectScheduleList(int cPage, int numPerPage) {
		
		return dao.selectScheduleList(session,cPage,numPerPage);
	}

	@Override
	public int selectTotalCount() {
		return dao.selectTotalCount(session);
	}

	

	@Override
	public List<Map<String, String>> selectScheduleFilter(Map<String, String> map, int numPerPage, int cPage) {
		return dao.selectScheduleFilter(session,map,numPerPage,cPage);
	}

	@Override
	public Map<String, String> selectOneScheduleView(int scheduleNo) {
		return dao.selectOneScheduleView(session, scheduleNo);
	}

	@Override
	public List<TimeTable> selectOneTimetableView(int scheduleNo) {
		return dao.selectOneTimetableView(session,scheduleNo);
	}
	
	
	//댓글
	
	//스케쥴댓글
	   @Override
	   public int scheduleReplyWrite(ScheduleReply schedulyReply, List<ScheduleReplyAttachment> attList) {
	      int result = 0;
	      int scheduleNo=0;
	      int replyNo=0;
	      scheduleNo = schedulyReply.getScheduleNo();
	      dao.scheduleReplyCountUpdate(session,scheduleNo);
	      result = dao.scheduleReplyWrite(session, schedulyReply);
	      replyNo = schedulyReply.getReplyNo();
	      if(attList.size()>0) {
	         for(ScheduleReplyAttachment a : attList) {
	            a.setReplyNo(replyNo);
	            result= dao.insertScheduleReplyAttach(session,a);
	         }
	      }
	      
	      
	      return result;
	      
	      
	      
	   }
	   
	   

	   @Override
	   public int scheduleReplyWrite2(ScheduleReply schedulyReply) {
	      int replyRefNo = schedulyReply.getReplyRef();
	      int scheduleNo = schedulyReply.getScheduleNo();
	      dao.scheduleReplyReplyCountUpdate(session, replyRefNo);
	      dao.scheduleReplyCountUpdate(session, scheduleNo);
	      return dao.scheduleReplyWrite2(session, schedulyReply);
	   }

	   @Override
	   public int scheduleReplyDelete(int replyNo) {
	      
	      return dao.scheduleReplyDelete(session, replyNo);
	   }

	   @Override
	   public int scheduleReplyGood(int replyNo) {
	      // TODO Auto-generated method stub
	      return dao.scheduleReplyGood(session, replyNo);
	   }

	   @Override
	   public int scheduleReplyGoodCheck(ScheduleReply schedulyReply) {
	      
	      return dao.scheduleReplyGoodCheck(session,schedulyReply);
	   }

	   @Override
	   public void insertscheduleReplyGood(ScheduleReply schedulyReply) {
	      
	      dao.insertscheduleReplyGood(session,schedulyReply);
	   }

	   @Override
	   public List<Map<String, String>> scheduleReplyList(int scheduleNo) {
	      
	      return dao.scheduleReplyList(session, scheduleNo);
	   }

	   @Override
	   public List<Map<String, String>> scheduleAttList() {
	      // TODO Auto-generated method stub
	      return dao.scheduleAttList(session);
	   }

	
	
	


	
	
	
	
	
	
}
