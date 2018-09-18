package com.kh.respect.place.model.service;

import java.util.List;

import com.kh.respect.place.model.vo.Place;

public interface PlaceService {
	List<Place> selectSpotList(int cPage, int numPerPage);
	List<Place> selectUserSpotList(String userId, int cPage, int numPerPage);
	List<Place> selectSearchList(int cPage, int numPerPage, String keyword );
	int selectTotalCount();
	int insertSpot(Place p);
	Place selectSpot(int spotno);
	void updateSpotCnt(int spotno);
	int selectTotalUserCount(String userId);
	int deleteSpot(int placeno);
	int selectSearchCount(String keyword);
}
