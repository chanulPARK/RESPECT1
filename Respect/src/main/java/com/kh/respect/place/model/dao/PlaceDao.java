package com.kh.respect.place.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.respect.place.model.vo.Place;
import com.kh.respect.place.model.vo.PlaceGood;
import com.kh.respect.place.model.vo.PlaceSpring;

public interface PlaceDao {
	List<Place> selectSpotList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);
	List<Place> selectUserSpotList(SqlSessionTemplate sqlSession, String userId, int cPage, int numPerPage);
	int selectTotalCount(SqlSessionTemplate sqlSession);
	int insertSpot(SqlSessionTemplate sqlSession, Place p);
	Place selectSpot(SqlSessionTemplate sqlSession, int spotno);
	void updateSpotCnt(SqlSessionTemplate sqlSession, int spotno);
//	List<PlaceSpring> spotSearchList(PlaceSpring p) throws Exception;
//	Integer spotSearchListTotal(PlaceSpring p) throws Exception;
	int insertLike(SqlSessionTemplate sqlSession, PlaceGood pg);
	int deleteLike(SqlSessionTemplate sqlSession, PlaceGood pg);
	PlaceGood selectLike(SqlSessionTemplate sqlSession, PlaceGood pg);
	
}
