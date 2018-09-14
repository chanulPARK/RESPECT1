package com.kh.respect.meet.model.service;

import java.util.List;
import java.util.Map;

import com.kh.respect.meet.model.vo.Meet;


public interface MeetService {
	
	List<Map<String,String>> selectMeetList(int cPage, int numPerPage);
	int selectTotalCount();
	
	int insertMeet(Meet meet);
	
	List<Map<String, String>> searchMeetList(int cPage, int numPerPage, String start, String end, String area);
	
	Meet selectOne(int meetNo);
	
}
