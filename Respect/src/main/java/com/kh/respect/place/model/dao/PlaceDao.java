package com.kh.respect.place.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.respect.place.model.vo.Place;

public interface PlaceDao {
	List<Place> selectSpotList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);
	List<Place> selectUserSpotList(SqlSessionTemplate sqlSession, String userId, int cPage, int numPerPage);
	List<Place> selectSearchList(SqlSessionTemplate sqlSession,int cPage, int numPerPage,String keyword);
	int selectTotalCount(SqlSessionTemplate sqlSession);
	int insertSpot(SqlSessionTemplate sqlSession, Place p);
	Place selectSpot(SqlSessionTemplate sqlSession, int spotno);
	void updateSpotCnt(SqlSessionTemplate sqlSession, int spotno);
	int selectTotalUserCount(SqlSessionTemplate sqlSession,String userId);
	int deleteSpot(SqlSessionTemplate sqlSession,int placeno);
	int selectSearchCount(SqlSessionTemplate sqlSession,String keyword);
}
