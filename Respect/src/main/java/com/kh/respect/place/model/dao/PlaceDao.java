package com.kh.respect.place.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.respect.place.model.vo.Place;
import com.kh.respect.place.model.vo.PlaceGood;

public interface PlaceDao {
	List<Place> selectSpotList(SqlSessionTemplate sqlSession, int cPage, int numPerPage);
	List<Place> selectUserSpotList(SqlSessionTemplate sqlSession, String userId, int cPage, int numPerPage);
	List<Place> selectSearchList(SqlSessionTemplate sqlSession,int cPage, int numPerPage,String keyword);
	int selectTotalCount(SqlSessionTemplate sqlSession);
	int insertSpot(SqlSessionTemplate sqlSession, Place p);
	Place selectSpot(SqlSessionTemplate sqlSession, int spotno);
	void updateSpotCnt(SqlSessionTemplate sqlSession, int spotno);

//	List<PlaceSpring> spotSearchList(PlaceSpring p) throws Exception;
//	Integer spotSearchListTotal(PlaceSpring p) throws Exception;
	int insertLike(SqlSessionTemplate sqlSession, PlaceGood pg);
	int deleteLike(SqlSessionTemplate sqlSession, PlaceGood pg);
	PlaceGood selectLike(SqlSessionTemplate sqlSession, PlaceGood pg);
	

	int insertMySpot(SqlSessionTemplate sqlSession, Place place);
	int selectTotalUserCount(SqlSessionTemplate sqlSession,String userId);
	int deleteSpot(SqlSessionTemplate sqlSession,int placeno);
	int selectSearchCount(SqlSessionTemplate sqlSession,String keyword);

}
