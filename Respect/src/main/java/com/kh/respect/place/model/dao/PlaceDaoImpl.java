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

}
