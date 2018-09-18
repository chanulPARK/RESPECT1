package com.kh.respect.schedule.model.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.respect.schedule.model.vo.Schedule;
import com.kh.respect.schedule.model.vo.TimeTable;

@Repository
public class ScheduleDaoImpl implements ScheduleDao {

	@Override
	public int insertSchedule(SqlSessionTemplate session, Schedule sc) {
		
		return session.insert("schedule.insertSchedule",sc);
	}

	@Override
	public int insertTimeTable(SqlSessionTemplate session, TimeTable tt) {
		
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
	public Map selectSchedule(SqlSessionTemplate session, int scheduleNo) {
		return session.selectOne("schedule.selectSchedule",scheduleNo);
	}

	@Override
	public List<Map> selectTimeTableList(SqlSessionTemplate session, int scheduleNo) {
		return session.selectList("schedule.selectTimeTableList",scheduleNo);
	}

	@Override
	public int updateSchedule(SqlSessionTemplate session, Schedule sc) {
		return session.update("schedule.updateSchedule",sc);
	}

	@Override
	public int deleteTimeTable(SqlSessionTemplate session, int scheduleNo) {
		return session.delete("schedule.deleteTimeTable",scheduleNo);
	}

//	@Override
//	public int deleteSchedule(SqlSessionTemplate session, int scheduleNo) {
//		
//		return session.delete("schedule.scheduleDelete",scheduleNo);
//	}

	

	
}
