package com.kh.respect.schedule.model.service;

import java.util.List;
import java.util.Map;

import com.kh.respect.schedule.model.vo.Schedule;
import com.kh.respect.schedule.model.vo.ScheduleReply;
import com.kh.respect.schedule.model.vo.ScheduleReplyAttachment;
import com.kh.respect.schedule.model.vo.TimeTable;

public interface ScheduleService {

	int insertSchedule(Schedule sc, List<TimeTable> list);

	//좋아요증가부터

	int goodCountCheck(Schedule schedule);

	int goodCountUp(Schedule schedule);

	int goodCountDown(Schedule schedule);

	int bringCountCheck(Schedule schedule);

	int bringCountUp(Schedule schedule);

	int bringCountDown(Schedule schedule);
}
