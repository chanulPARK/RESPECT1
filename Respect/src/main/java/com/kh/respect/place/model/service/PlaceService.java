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
	int insertPlace(Place p);
	Place selectPlace(int placeno);
	int updatePlace(Place p);
	void updateSpotCnt(int spotno);
	int insertLike(PlaceGood pg);
	int deleteLike(PlaceGood pg);
	PlaceGood selectLike(PlaceGood pg);
	int insertBring(PlaceGood pg);
	int deleteBring(PlaceGood pg);
	PlaceGood selectBring(PlaceGood pg);
	void increaseLike(int placeno);
	void decreaseLike(int placeno);
	int selectPlaceLikecnt(int placeno);
	void increaseBring(int placeno);
	void decreaseBring(int placeno);
	int selectPlaceBringcnt(int placeno);
	List<Place> searchCategoryList(int cPage, int numPerPage, String minorcategory);
	int categoryTotalCount(String minorcategory);

	int insertMySpot(Place place);
	int selectTotalUserCount(String userId);
	int deleteSpot(int placeno);
	int selectSearchCount(String keyword);

}
