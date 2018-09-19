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
import com.kh.respect.place.model.vo.PlaceGood;
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
	public int insertPlace(Place p) {
		return dao.insertPlace(sqlSession, p);
	}
	
	@Override
	public int updatePlace(Place p) {
		return dao.updatePlace(sqlSession, p);
	}

	@Override
	public Place selectPlace(int placeno) {
		return dao.selectPlace(sqlSession, placeno);
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
	public int insertLike(PlaceGood pg) {
		// TODO Auto-generated method stub
		return dao.insertLike(sqlSession, pg);
	}
	
	@Override
	public int deleteLike(PlaceGood pg) {
		// TODO Auto-generated method stub
		return dao.deleteLike(sqlSession, pg);
	}
	
	@Override
	public PlaceGood selectLike(PlaceGood pg) {
		// TODO Auto-generated method stub
		return dao.selectLike(sqlSession, pg);
	}
	
	@Override
	public int selectPlaceLikecnt(int placeno) {
		// TODO Auto-generated method stub
		return dao.selectPlaceLikecnt(sqlSession, placeno);
	}
	
	@Override
	public int insertBring(PlaceGood pg) {
		// TODO Auto-generated method stub
		return dao.insertBring(sqlSession, pg);
	}
	
	@Override
	public int deleteBring(PlaceGood pg) {
		// TODO Auto-generated method stub
		return dao.deleteBring(sqlSession, pg);
	}
	
	@Override
	public int selectPlaceBringcnt(int placeno) {
		// TODO Auto-generated method stub
		return dao.selectPlaceBringcnt(sqlSession, placeno);
	}
	
	@Override
	public PlaceGood selectBring(PlaceGood pg) {
		// TODO Auto-generated method stub
		return dao.selectBring(sqlSession, pg);
	}
	
	@Override
	public List<Place> searchCategoryList(int cPage, int numPerPage, String minorcategory) {
		return dao.searchCategoryList(sqlSession, cPage, numPerPage, minorcategory);
	}

	@Override
	public int categoryTotalCount(String minorcategory) {
		return dao.categoryTotalCount(sqlSession, minorcategory);
	}
	
	

//	@Override
//	@Transactional
//	public Map<String, Object> spotSearchList(PlaceSpring palce) throws Exception {
//		Map<String, Object> map = new HashMap<String, Object>();
//		
//		final int dataPerPage = 10;
//		int page = palce.getPage();
//		
//		int first = page * dataPerPage + 1;
//		int last = first + dataPerPage - 1;
//		
//		palce.setFirst(first);
//		palce.setLast(last);
//		
//		Integer total = dao.spotSearchListTotal(palce);
//		Integer totalPages = (int)Math.ceil(total / dataPerPage);
//		
//		map.put("total", total);
//		map.put("totalPages", totalPages);
//		map.put("list", dao.spotSearchList(palce));
//		
//		return map;
//	}

	@Override
	public void increaseLike(int placeno) {
		dao.increaseLike(sqlSession, placeno);
	}

	@Override
	public void decreaseLike(int placeno) {
		dao.decreaseLike(sqlSession, placeno);
	}
	
	@Override
	public void increaseBring(int placeno) {
		dao.increaseBring(sqlSession, placeno);
	}

	@Override
	public void decreaseBring(int placeno) {
		dao.decreaseBring(sqlSession, placeno);
	}

	public int insertMySpot(Place place) {
		return dao.insertMySpot(sqlSession,place);
	}
	
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
		return dao.selectSearchCount(sqlSession, keyword);
	}

	
}
