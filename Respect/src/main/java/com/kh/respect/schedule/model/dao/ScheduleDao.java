package com.kh.respect.schedule.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.respect.schedule.model.vo.Schedule;
import com.kh.respect.schedule.model.vo.ScheduleReply;
import com.kh.respect.schedule.model.vo.ScheduleReplyAttachment;
import com.kh.respect.schedule.model.vo.TimeTable;

public interface ScheduleDao {

	int insertSchedule(SqlSessionTemplate session, Schedule sc);
	int insertTimeTable(SqlSessionTemplate session, TimeTable tt);

	//추천수정수정
		int goodCountCheck(SqlSessionTemplate session, Schedule schedule);
		void insertScheduleGoodCount(SqlSessionTemplate session, Schedule schedule);
		int goodCountUp(SqlSessionTemplate session, Schedule schedule);
		void deleteScheduleDownCount(SqlSessionTemplate session, Schedule schedule);
		int goodCountDown(SqlSessionTemplate session, Schedule schedule);
		//찜하기 수정수정
		int bringCountCheck(SqlSessionTemplate session, Schedule schedule);
		void insertSchedulebringCount(SqlSessionTemplate session, Schedule schedule);
		int bringCountUp(SqlSessionTemplate session, Schedule schedule);
		void deleteBringDownCount(SqlSessionTemplate session, Schedule schedule);
		int bringCountDown(SqlSessionTemplate session, Schedule schedule);
}
