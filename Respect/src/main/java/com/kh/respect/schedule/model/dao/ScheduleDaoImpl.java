package com.kh.respect.schedule.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.respect.schedule.model.vo.Schedule;
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

}
