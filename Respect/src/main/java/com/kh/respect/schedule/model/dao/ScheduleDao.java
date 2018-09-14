package com.kh.respect.schedule.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.respect.schedule.model.vo.Schedule;
import com.kh.respect.schedule.model.vo.TimeTable;

public interface ScheduleDao {

	int insertSchedule(SqlSessionTemplate session, Schedule sc);
	int insertTimeTable(SqlSessionTemplate session, TimeTable tt);
	List<Map<String, String>> selectScheduleList(SqlSessionTemplate session, int cPage, int numPerPage);
	int selectTotalCount(SqlSessionTemplate session);
	
}
