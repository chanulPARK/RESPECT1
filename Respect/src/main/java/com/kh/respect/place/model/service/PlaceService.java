package com.kh.respect.place.model.service;

import java.util.List;
import java.util.Map;

import com.kh.respect.place.model.vo.Place;
import com.kh.respect.place.model.vo.PlaceGood;
import com.kh.respect.place.model.vo.PlaceSpring;

public interface PlaceService {
	List<Place> selectSpotList(int cPage, int numPerPage);
	List<Place> selectUserSpotList(String userId, int cPage, int numPerPage);
	List<Place> selectSearchList(int cPage, int numPerPage, String keyword );
	int selectTotalCount();
	int insertSpot(Place p);
	Place selectSpot(int spotno);
	void updateSpotCnt(int spotno);

//	Map<String, Object> spotSearchList(PlaceSpring palce) throws Exception;
	int insertLike(PlaceGood pg);
	int deleteLike(PlaceGood pg);
	PlaceGood selectLike(PlaceGood pg);

	int insertMySpot(Place place);
	int selectTotalUserCount(String userId);
	int deleteSpot(int placeno);
	int selectSearchCount(String keyword);

}
