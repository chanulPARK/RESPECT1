package com.kh.respect.place.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.respect.place.model.vo.Place;
import com.kh.respect.place.model.vo.PlaceGood;
import com.kh.respect.place.model.vo.PlaceSpring;

@Repository
public class PlaceDaoImpl implements PlaceDao {

	SqlSessionTemplate sqlSession;

	@Override
	public int insertPlace(SqlSessionTemplate sqlSession, Place p) {
		return sqlSession.insert("spot.insertPlace", p);
	}
	
	@Override
	public int updatePlace(SqlSessionTemplate sqlSession, Place p) {
		return sqlSession.update("spot.updatePlace", p);
	}

	@Override
	public List<Place> selectSpotList(SqlSessionTemplate sqlSession, int cPage, int numPerPage) {
		return sqlSession.selectList("spot.selectSpotList", null, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int selectTotalCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("spot.selectTotalCount");
	}

	@Override
	public Place selectPlace(SqlSessionTemplate sqlSession, int placeno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("spot.selectSpot", placeno);
	}
	
	@Override
	public void updateSpotCnt(SqlSessionTemplate sqlSession, int spotno) {
		sqlSession.update("spot.updateSpotCnt", spotno);
	}

	@Override
	public List<Place> selectUserSpotList(SqlSessionTemplate sqlSession, String userId, int cPage, int numPerPage) {
		return sqlSession.selectList("spot.selectUserSpotList", userId, new RowBounds((cPage-1)*numPerPage, numPerPage));
		
	}

	@Override
	public int insertLike(SqlSessionTemplate sqlSession, PlaceGood pg) {
		// TODO Auto-generated method stub
		return sqlSession.insert("spot.insertLike", pg);
	}
	
	@Override
	public int deleteLike(SqlSessionTemplate sqlSession, PlaceGood pg) {
		// TODO Auto-generated method stub
		return sqlSession.delete("spot.deleteLike", pg);
	}
	
	@Override
	public PlaceGood selectLike(SqlSessionTemplate sqlSession, PlaceGood pg) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("spot.selectLike", pg);
	}
	
	@Override
	public int insertBring(SqlSessionTemplate sqlSession, PlaceGood pg) {
		// TODO Auto-generated method stub
		return sqlSession.insert("spot.insertBring", pg);
	}
	
	@Override
	public int deleteBring(SqlSessionTemplate sqlSession, PlaceGood pg) {
		// TODO Auto-generated method stub
		return sqlSession.delete("spot.deleteBring", pg);
	}
	
	@Override
	public PlaceGood selectBring(SqlSessionTemplate sqlSession, PlaceGood pg) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("spot.selectBring", pg);
	}
	
	

//	@Override
//	public List<PlaceSpring> spotSearchList(PlaceSpring p) throws Exception {
//		// TODO Auto-generated method stub
//		return sqlSession.selectList("spot.spotSearchList", p.getMinorcategory());
//	}
//
//	@Override
//	public Integer spotSearchListTotal(PlaceSpring p) throws Exception {
//		// TODO Auto-generated method stub
//		return sqlSession.selectOne("spot.spotSearchListTotal", p.getMinorcategory());
//	}
	
	@Override
	public int selectPlaceLikecnt(SqlSessionTemplate sqlSession, int placeno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("spot.selectPlaceLikecnt", placeno);
	}

	@Override
	public int selectPlaceBringcnt(SqlSessionTemplate sqlSession, int placeno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("spot.selectPlaceBringcnt", placeno);
	}
	
	public void increaseLike(SqlSessionTemplate sqlSession, int placeno) {
		sqlSession.update("spot.increaseLike", placeno);
	}
	
	public void decreaseLike(SqlSessionTemplate sqlSession, int placeno) {
		sqlSession.update("spot.decreaseLike", placeno);
	}
	
	public void increaseBring(SqlSessionTemplate sqlSession, int placeno) {
		sqlSession.update("spot.increaseBring", placeno);
	}
	
	public void decreaseBring(SqlSessionTemplate sqlSession, int placeno) {
		sqlSession.update("spot.decreaseBring", placeno);
	}

	public int insertMySpot(SqlSessionTemplate sqlSession, Place place) {
		return sqlSession.insert("spot.insertMyPlace", place);
	}
	
	@Override
	public List<Place> searchCategoryList(SqlSessionTemplate sqlSession, int cPage, int numPerPage, String minorcategory) {
		return sqlSession.selectList("spot.searchCategoryList", minorcategory, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int categoryTotalCount(SqlSessionTemplate sqlSession, String minorcategory) {
		return sqlSession.selectOne("spot.categoryTotalCount", minorcategory);
	}
	
	
	
	public int selectTotalUserCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("spot.selectTotalUserCount",userId);
	}

	@Override
	public List<Place> selectSearchList(SqlSessionTemplate sqlSession, int cPage, int numPerPage, String keyword) {
		return sqlSession.selectList("spot.selectSearchList", keyword, new RowBounds((cPage-1)*numPerPage, numPerPage));
	}

	@Override
	public int deleteSpot(SqlSessionTemplate sqlSession, int placeno) {
		return sqlSession.delete("spot.deleteSpot",placeno);
	}

	@Override
	public int selectSearchCount(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectOne("spot.selectSearchCount",keyword);
	}



}
