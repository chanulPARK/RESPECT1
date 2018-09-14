package com.kh.respect.schedule.model.service;

import java.util.List;

import com.kh.respect.schedule.model.vo.Schedule;
import com.kh.respect.schedule.model.vo.TimeTable;

public interface ScheduleService {

	int insertSchedule(Schedule sc, List<TimeTable> list);
}
