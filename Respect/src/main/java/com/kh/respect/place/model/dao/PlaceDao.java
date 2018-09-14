package com.kh.respect.place.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.respect.place.model.vo.Place;

public interface PlaceDao {
	List<Place> selectSpotList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);
	List<Place> selectUserSpotList(SqlSessionTemplate sqlSession, String userId, int cPage, int numPerPage);
	int selectTotalCount(SqlSessionTemplate sqlSession);
	int insertSpot(SqlSessionTemplate sqlSession, Place p);
	Place selectSpot(SqlSessionTemplate sqlSession, int spotno);
	void updateSpotCnt(SqlSessionTemplate sqlSession, int spotno);
}
