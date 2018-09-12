package com.kh.respect.meet.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.respect.meet.model.vo.Meet;

public interface MeetDao {
	
	List<Map<String,String>> selectMeetList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);
	int selectTotalCount(SqlSessionTemplate sqlSession);
	
	int insertMeet(SqlSessionTemplate sqlSession, Meet meet);
	
	List<Map<String,String>> searchMeetList(SqlSessionTemplate sqlSession, int cPage, int numPerPage, String start, String end, String area);
}
