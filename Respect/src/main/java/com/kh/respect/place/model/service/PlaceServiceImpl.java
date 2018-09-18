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

	@Override
	public List<Place> selectUserSpotList(String userId, int cPage, int numPerPage) {
		return dao.selectUserSpotList(sqlSession,userId,cPage,numPerPage);
	}

	@Override
	public int selectTotalUserCount(String userId) {
		
		return dao.selectTotalUserCount(sqlSession,userId);
	}

	@Override
	public List<Place> selectSearchList(int cPage, int numPerPage, String keyword) {
		return dao.selectSearchList(sqlSession,cPage,numPerPage,keyword);
	}

	@Override
	public int deleteSpot(int placeno) {
		return dao.deleteSpot(sqlSession,placeno);
	}

	@Override
	public int selectSearchCount(String keyword) {
		return dao.selectSearchCount(sqlSession,keyword);
	}
	
}
