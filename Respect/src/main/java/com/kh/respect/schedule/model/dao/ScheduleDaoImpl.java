package com.kh.respect.schedule.model.dao;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.respect.schedule.model.vo.Schedule;
import com.kh.respect.schedule.model.vo.ScheduleReply;
import com.kh.respect.schedule.model.vo.ScheduleReplyAttachment;
import com.kh.respect.schedule.model.vo.TimeTable;

@Repository
public class ScheduleDaoImpl implements ScheduleDao {

	@Override
	public int insertSchedule(SqlSessionTemplate session, Schedule sc) {
		System.out.println("스케줄 dao");
		return session.insert("schedule.insertSchedule",sc);
	}

	@Override
	public int insertTimeTable(SqlSessionTemplate session, TimeTable tt) {
		System.out.println("타임테이블 dao");
		return session.insert("schedule.insertTimeTable",tt);
	}

	
	//추천수정수정
	
		@Override
		public int goodCountCheck(SqlSessionTemplate session, Schedule schedule) {
			// TODO Auto-generated method stub
			return session.selectOne("schedule.goodCountCheck", schedule);
		}

		@Override
		public void insertScheduleGoodCount(SqlSessionTemplate session, Schedule schedule) {
			
			session.insert("schedule.insertScheduleGoodCount",schedule);
			
		}

		@Override
		public int goodCountUp(SqlSessionTemplate session, Schedule schedule) {
			// TODO Auto-generated method stub
			return session.update("schedule.goodCountUp", schedule);
		}

		@Override
		public void deleteScheduleDownCount(SqlSessionTemplate session, Schedule schedule) {
			
			session.delete("schedule.deleteScheduleDownCount",schedule);
		}

		@Override
		public int goodCountDown(SqlSessionTemplate session, Schedule schedule) {
			// TODO Auto-generated method stub
			return session.update("schedule.goodCountDown", schedule);
		}
		
		//찜하기 수정수정

		@Override
		public int bringCountCheck(SqlSessionTemplate session, Schedule schedule) {
			// TODO Auto-generated method stub
			return session.selectOne("schedule.bringCountCheck", schedule);
		}

		@Override
		public void insertSchedulebringCount(SqlSessionTemplate session, Schedule schedule) {
			session.insert("schedule.insertSchedulebringCount",schedule);
			
		}

		@Override
		public int bringCountUp(SqlSessionTemplate session, Schedule schedule) {
			// TODO Auto-generated method stub
			return session.update("schedule.bringCountUp", schedule);
		}

		@Override
		public void deleteBringDownCount(SqlSessionTemplate session, Schedule schedule) {
			session.delete("schedule.deleteBringDownCount",schedule);
			
		}

		@Override
		public int bringCountDown(SqlSessionTemplate session, Schedule schedule) {
			
			return session.update("schedule.bringCountDown", schedule);
		}
		
		
	
	
	
	
	

}
