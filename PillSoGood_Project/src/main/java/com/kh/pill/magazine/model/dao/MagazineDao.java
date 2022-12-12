package com.kh.pill.magazine.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.pill.common.model.vo.PageInfo;
import com.kh.pill.magazine.model.vo.Magazine;
import com.kh.pill.magazine.model.vo.MagazineLike;
import com.kh.pill.product.model.vo.ProductLike;

@Repository
public class MagazineDao {


	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("magazineMapper.selectListCount");
	}
	
	public ArrayList<Magazine> selectMagazineList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int limit = pi.getBoardLimit();
		int offset = (pi.getCurrentPage() - 1) * limit;
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("magazineMapper.selectMagazineList", null, rowBounds);
	}

	
	public Magazine selectMagazine(SqlSessionTemplate sqlSession, int magazineNo) {
		
		return sqlSession.selectOne("magazineMapper.selectMagazine", magazineNo);
	}
	

	public int insertMagazine(SqlSessionTemplate sqlSession, Magazine mag) {
		
		return sqlSession.insert("magazineMapper.insertMagazine", mag);
	}
	

	public int deleteMagazine(SqlSessionTemplate sqlSession, int magazineNo) {
		return sqlSession.update("magazineMapper.deleteMagazine", magazineNo);
	}

	
	public int updateMagazine(SqlSessionTemplate sqlSession, Magazine mag) {
		
		return sqlSession.update("magazineMapper.updateMagazine", mag);
	}


	
	
}
