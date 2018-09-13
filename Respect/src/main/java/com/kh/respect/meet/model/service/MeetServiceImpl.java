package com.kh.respect.meet.model.service;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.respect.meet.model.dao.MeetDao;
import com.kh.respect.meet.model.vo.Meet;

@Service
public class MeetServiceImpl implements MeetService {

	@Autowired
	MeetDao dao;
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<Map<String, String>> selectMeetList(int cPage, int numPerPage) {
		
		return dao.selectMeetList(sqlSession, cPage, numPerPage);
	}


	@Override
	public int selectTotalCount() {
		return dao.selectTotalCount(sqlSession);
	}


	@Override
	public int insertMeet(Meet meet) {
		int result = dao.insertMeet(sqlSession, meet);
		return result;
	}


	@Override
	public List<Map<String, String>> searchMeetList(int cPage, int numPerPage, String start, String end, String area) {
		return dao.searchMeetList(sqlSession, cPage, numPerPage, start, end, area);
	}


	@Override
	public Meet selectOne(int meetNo) {
		return dao.selectOne(sqlSession, meetNo);
	}
	
	

}
