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

	List<Map<String, String>> selectScheduleList(SqlSessionTemplate session, int cPage, int numPerPage);
	int selectTotalCount(SqlSessionTemplate session);

	Map<String, String> selectOneScheduleView(SqlSessionTemplate session, int scheduleNo);
	List<Map<String, String>> selectScheduleFilter(SqlSessionTemplate session, Map<String, String> map, int numPerPage,
			int cPage);
	List<TimeTable> selectOneTimetableView(SqlSessionTemplate session, int scheduleNo);
	
	//댓글
	
   int scheduleReplyWrite(SqlSessionTemplate session, ScheduleReply schedulyReply);
   void scheduleReplyCountUpdate(SqlSessionTemplate session, int scheduleNo);
   int insertScheduleReplyAttach(SqlSessionTemplate session, ScheduleReplyAttachment a);
   int scheduleReplyWrite2(SqlSessionTemplate session, ScheduleReply schedulyReply);
   void scheduleReplyReplyCountUpdate(SqlSessionTemplate session, int replyRefNo);
   int scheduleReplyDelete(SqlSessionTemplate session, int replyNo);
   int scheduleReplyGood(SqlSessionTemplate session, int replyNo);
   int scheduleReplyGoodCheck(SqlSessionTemplate session, ScheduleReply schedulyReply);
   void insertscheduleReplyGood(SqlSessionTemplate session, ScheduleReply schedulyReply);
   List<Map<String, String>> scheduleReplyList(SqlSessionTemplate session, int scheduleNo);
   List<Map<String, String>> scheduleAttList(SqlSessionTemplate session);

	Map selectSchedule(SqlSessionTemplate session,int scheduleNo);

	
	List<Map> selectTimeTableList(SqlSessionTemplate session,int scheduleNo);
	int updateSchedule(SqlSessionTemplate session, Schedule sc);
	int deleteTimeTable(SqlSessionTemplate session, int scheduleNo);
//	int deleteSchedule(SqlSessionTemplate session, int scheduleNo);

}
