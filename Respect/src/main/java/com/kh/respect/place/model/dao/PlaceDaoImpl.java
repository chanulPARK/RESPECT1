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
	public int insertSpot(SqlSessionTemplate sqlSession, Place p) {
		return sqlSession.insert("spot.insertPlace", p);
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
	public Place selectSpot(SqlSessionTemplate sqlSession, int spotno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("spot.selectSpot", spotno);
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
	
	


}
