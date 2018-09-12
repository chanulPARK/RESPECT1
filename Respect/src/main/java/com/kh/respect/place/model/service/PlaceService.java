package com.kh.respect.place.model.service;

import java.util.List;
import java.util.Map;

import com.kh.respect.place.model.vo.Place;

public interface PlaceService {
	List<Map<String, String>> selectSpotList(int cPage, int numPerPage);
	int selectTotalCount();
	int insertSpot(Place p);
	Place selectSpot(int spotno);
}
