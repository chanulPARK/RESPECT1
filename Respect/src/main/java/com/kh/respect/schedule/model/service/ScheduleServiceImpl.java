package com.kh.respect.schedule.model.service;


import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.kh.respect.schedule.model.dao.ScheduleDao;
import com.kh.respect.schedule.model.vo.Schedule;
import com.kh.respect.schedule.model.vo.TimeTable;


@Service
public class ScheduleServiceImpl implements ScheduleService {

	@Autowired
	SqlSessionTemplate session;
	
	@Autowired
	private ScheduleDao dao;
	
	@Override
	
	public int insertSchedule(Schedule sc, List<TimeTable> list) {
		
		int result=0;
		int scheduleNo=0;
		result=dao.insertSchedule(session,sc);
		
		scheduleNo=sc.getScheduleNo();
		
		if(result>0)
		{
			
			if(list.size()>0)
			{
				
				for(TimeTable tt: list)
				{
					
					tt.setScheduleNo(scheduleNo);
					result=dao.insertTimeTable(session,tt);
				}
			}
		}
		return result;
	}

	@Override
	public List<Map<String, String>> selectScheduleList(int cPage, int numPerPage) {
		
		return dao.selectScheduleList(session,cPage,numPerPage);
	}

	@Override
	public int selectTotalCount() {
		return dao.selectTotalCount(session);
	}

	@Override
	public Map selectSchedule(int scheduleNo) {
		return dao.selectSchedule(session, scheduleNo);
	}

	@Override
	public List<Map> selectTimeTableList(int scheduleNo) {
		return dao.selectTimeTableList(session,scheduleNo);
	}

	@Override
	public int updateSchedule(Schedule sc, List<TimeTable> list) {
		int result=0;
		int scheduleNo=0;
		result=dao.updateSchedule(session,sc);
		System.out.println("업데이트 후 "+ result);
		scheduleNo=sc.getScheduleNo();
		result=dao.deleteTimeTable(session,scheduleNo);
		System.out.println("딜리트 후"+ result);
		if(result>0)
		{
			
			if(list.size()>0)
			{
				
				for(TimeTable tt: list)
				{
					
					
					result=dao.insertTimeTable(session,tt);
					System.out.println("인서트중");
				}
			}
		}
		return result;
	}

//	@Override
//	public int deleteSchedule(int scheduleNo) {
//		return dao.deleteSchedule(session, scheduleNo);
//	}
	
	
	
	
}
