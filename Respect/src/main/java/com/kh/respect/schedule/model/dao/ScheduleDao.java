package com.kh.respect.schedule.model.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.respect.schedule.model.vo.Schedule;
import com.kh.respect.schedule.model.vo.TimeTable;

public interface ScheduleDao {

	int insertSchedule(SqlSessionTemplate session, Schedule sc);
	int insertTimeTable(SqlSessionTemplate session, TimeTable tt);
	
}
