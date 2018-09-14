package com.kh.respect.meet.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.respect.meet.model.vo.Meet;

@Repository
public class MeetDaoImpl implements MeetDao {

	@Override
	public List<Map<String, String>> selectMeetList(SqlSessionTemplate sqlSession, int cPage, int numPerPage) {
		
		return sqlSession.selectList("meet.selectMeetList", null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}
	
	@Override
	public int selectTotalCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("meet.selectTotalCount");
	}

	@Override
	public int insertMeet(SqlSessionTemplate sqlSession, Meet meet) {
		return sqlSession.insert("meet.insertMeet", meet);
	}

	@Override
	public List<Map<String, String>> searchMeetList(SqlSessionTemplate sqlSession, int cPage, int numPerPage, String start, String end, String area) {
		Map<String, String> map = new HashMap();
		map.put("start", start);
		map.put("end", end);
		map.put("area", area);
		
		return sqlSession.selectList("meet.searchMeetList", map, new RowBounds((cPage-1)*numPerPage, numPerPage));
		
	}

	@Override
	public Meet selectOne(SqlSessionTemplate sqlSession, int meetNo) {
		return sqlSession.selectOne("meet.selectOne", meetNo);
	}
	
	
	

}
