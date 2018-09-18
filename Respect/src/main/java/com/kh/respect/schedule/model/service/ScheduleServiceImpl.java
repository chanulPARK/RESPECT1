package com.kh.respect.schedule.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

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

	
	
	//추천수정수정

		@Override
		public int goodCountCheck(Schedule schedule) {
			
			return dao.goodCountCheck(session,schedule);
		}

		@Override
		public int goodCountUp(Schedule schedule) {
			dao.insertScheduleGoodCount(session,schedule);
			return dao.goodCountUp(session,schedule);
		}

		@Override
		public int goodCountDown(Schedule schedule) {
			dao.deleteScheduleDownCount(session,schedule);
			return dao.goodCountDown(session,schedule);
		}
		
		//찜하기수정수정

		@Override
		public int bringCountCheck(Schedule schedule) {
			
			return dao.bringCountCheck(session,schedule);
		}

		@Override
		public int bringCountUp(Schedule schedule) {
			
			dao.insertSchedulebringCount(session,schedule);
			return dao.bringCountUp(session,schedule);
		}

		@Override
		public int bringCountDown(Schedule schedule) {
			dao.deleteBringDownCount(session,schedule);
			return dao.bringCountDown(session,schedule);
		}
	
	
	

	
}
