package com.kh.respect.place.model.service;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.respect.place.model.dao.PlaceDao;
import com.kh.respect.place.model.vo.Place;

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
	
}
