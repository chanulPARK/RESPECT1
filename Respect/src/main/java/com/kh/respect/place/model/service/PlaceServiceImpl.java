package com.kh.respect.place.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.respect.place.model.dao.PlaceDao;
import com.kh.respect.place.model.vo.Place;
import com.kh.respect.place.model.vo.PlaceSpring;

@Service
public class PlaceServiceImpl implements PlaceService {
	
	@Autowired
	PlaceDao dao;
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Place> selectSpotList(int cPage, int numPerPage) {
		return dao.selectSpotList(sqlSession, cPage, numPerPage);
	}

	@Override
	public int selectTotalCount() {
		return dao.selectTotalCount(sqlSession);
	}

	@Override
	public int insertSpot(Place p) {
		int result = dao.insertSpot(sqlSession, p);
		
		return result;
	}

	@Override
	public Place selectSpot(int spotno) {
		return dao.selectSpot(sqlSession, spotno);
	}
	
	@Override
	public void updateSpotCnt(int spotno) {
		dao.updateSpotCnt(sqlSession, spotno);
	}

	@Override
	public List<Place> selectUserSpotList(String userId, int cPage, int numPerPage) {
		return dao.selectUserSpotList(sqlSession,userId,cPage,numPerPage);
	}

	@Override
	@Transactional
	public Map<String, Object> spotSearchList(PlaceSpring palce) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		
		final int dataPerPage = 10;
		int page = palce.getPage();
		
		int first = page * dataPerPage + 1;
		int last = first + dataPerPage - 1;
		
		palce.setFirst(first);
		palce.setLast(last);
		
		Integer total = dao.spotSearchListTotal(palce);
		Integer totalPages = (int)Math.ceil(total / dataPerPage);
		
		map.put("total", total);
		map.put("totalPages", totalPages);
		map.put("list", dao.spotSearchList(palce));
		
		return map;
	}
	
}
