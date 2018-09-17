package com.kh.respect.place.model.service;

import java.util.List;
import java.util.Map;

import com.kh.respect.place.model.vo.Place;
import com.kh.respect.place.model.vo.PlaceSpring;

public interface PlaceService {
	List<Place> selectSpotList(int cPage, int numPerPage);
	List<Place> selectUserSpotList(String userId, int cPage, int numPerPage);
	int selectTotalCount();
	int insertSpot(Place p);
	Place selectSpot(int spotno);
	void updateSpotCnt(int spotno);
	Map<String, Object> spotSearchList(PlaceSpring palce) throws Exception;
}
