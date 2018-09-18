package com.kh.respect.schedule.model.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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

	@Override
	public List<Map<String, String>> selectScheduleList(SqlSessionTemplate session, int cPage, int numPerPage) {
		
		return session.selectList("schedule.selectScheduleList",null,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}
	@Override
	public int selectTotalCount(SqlSessionTemplate session) {
		
		return session.selectOne("schedule.selectTotalCount");
	}

	@Override
	public List<Map<String, String>> selectScheduleFilter(SqlSessionTemplate session, Map<String, String> map,
			int numPerPage, int cPage) {
		return session.selectList("schedule.selectScheduleFilter",map,new RowBounds((cPage-1)*numPerPage,numPerPage));
	}

	@Override
	public Map<String, String> selectOneScheduleView(SqlSessionTemplate session, int scheduleNo) {
		return session.selectOne("schedule.selectOneScheduleView",scheduleNo);
	}

	@Override
	public List<TimeTable> selectOneTimetableView(SqlSessionTemplate session, int scheduleNo) {
		return session.selectList("schedule.selectOneTimetableView",scheduleNo);
	}

	
	
	//댓글
	//스케쥴댓글
	   @Override
	   public int scheduleReplyWrite(SqlSessionTemplate session, ScheduleReply schedulyReply) {
	      // TODO Auto-generated method stub
	      return session.insert("schedule.scheduleReplyWrite",schedulyReply);
	   }

	   @Override
	   public void scheduleReplyCountUpdate(SqlSessionTemplate session, int scheduleNo) {
	      // TODO Auto-generated method stub
	      session.update("schedule.scheduleReplyCountUpdate",scheduleNo);
	   }

	   @Override
	   public int insertScheduleReplyAttach(SqlSessionTemplate session, ScheduleReplyAttachment a) {
	      // TODO Auto-generated method stub
	      return session.insert("schedule.insertScheduleReplyAttach",a);
	   }
	   

	   @Override
	   public int scheduleReplyWrite2(SqlSessionTemplate session, ScheduleReply schedulyReply) {
	      // TODO Auto-generated method stub
	      return session.insert("schedule.scheduleReplyWrite2",schedulyReply);
	   }


	   @Override
	   public void scheduleReplyReplyCountUpdate(SqlSessionTemplate session, int replyRefNo) {
	      session.update("schedule.scheduleReplyReplyCountUpdate",replyRefNo);
	      
	   }

	   @Override
	   public int scheduleReplyDelete(SqlSessionTemplate session, int replyNo) {
	      // TODO Auto-generated method stub
	      return session.delete("schedule.scheduleReplyDelete",replyNo);
	   }

	   @Override
	   public int scheduleReplyGood(SqlSessionTemplate session, int replyNo) {
	      // TODO Auto-generated method stub
	      return session.update("schedule.scheduleReplyGood",replyNo);
	   }

	   @Override
	   public int scheduleReplyGoodCheck(SqlSessionTemplate session, ScheduleReply schedulyReply) {
	      // TODO Auto-generated method stub
	      return session.selectOne("schedule.scheduleReplyGoodCheck", schedulyReply);
	   }

	   @Override
	   public void insertscheduleReplyGood(SqlSessionTemplate session, ScheduleReply schedulyReply) {
	      // TODO Auto-generated method stub
	      session.insert("schedule.insertscheduleReplyGood", schedulyReply);
	   }

	   @Override
	   public List<Map<String, String>> scheduleReplyList(SqlSessionTemplate session, int scheduleNo) {
	      // TODO Auto-generated method stub
	      return session.selectList("schedule.scheduleReplyList",scheduleNo);
	   }

	   @Override
	   public List<Map<String, String>> scheduleAttList(SqlSessionTemplate session) {
	      // TODO Auto-generated method stub
	      return session.selectList("schedule.scheduleAttList");
	   }
	
	

	
	
}
