package com.kh.respect.schedule.model.service;

import java.util.List;

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
		System.out.println("서비스들어오나?");
		int result=0;
		int scheduleNo=0;
		result=dao.insertSchedule(session,sc);
		
		scheduleNo=sc.getScheduleNo();
		System.out.println("스케줄인서트 후 : "+scheduleNo);
		if(result>0)
		{
			System.out.println("타임테이블 조건문");
			if(list.size()>0)
			{
				
				for(TimeTable tt: list)
				{
					System.out.println("타임테이블 for문");
					tt.setScheduleNo(scheduleNo);
					result=dao.insertTimeTable(session,tt);
				}
			}
		}
		return result;
	}

	
}
