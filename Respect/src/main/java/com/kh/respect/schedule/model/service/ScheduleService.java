package com.kh.respect.schedule.model.service;

import java.util.List;
import java.util.Map;

import com.kh.respect.schedule.model.vo.Schedule;
import com.kh.respect.schedule.model.vo.TimeTable;

public interface ScheduleService {

	int insertSchedule(Schedule sc, List<TimeTable> list);

	List<Map<String, String>> selectScheduleList(int cPage, int numPerPage);

	int selectTotalCount();
	
	Map selectSchedule(int scheduleNo);
	
	List<Map> selectTimeTableList(int scheduleNo);
	
	int updateSchedule(Schedule sc, List<TimeTable> list);
	
//	int deleteSchedule(int scheduleNo);
	
}
