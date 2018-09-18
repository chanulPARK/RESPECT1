package com.kh.respect.place.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.respect.place.model.vo.Place;

@Repository
public class PlaceDaoImpl implements PlaceDao {

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
	public int insertMySpot(SqlSessionTemplate sqlSession, Place place) {
		return sqlSession.insert("spot.insertMyPlace", place);
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
