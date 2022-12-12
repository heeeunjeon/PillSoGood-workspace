package com.kh.pill.magazine.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pill.common.model.vo.PageInfo;
import com.kh.pill.magazine.model.dao.MagazineDao;
import com.kh.pill.magazine.model.vo.Magazine;
import com.kh.pill.magazine.model.vo.MagazineLike;

@Service
public class MagazineServiceImpl implements MagazineService {

	@Autowired
	private MagazineDao magazineDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public int selectListCount() {
		
		return magazineDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Magazine> selectMagazineList(PageInfo pi) {

		return magazineDao.selectMagazineList(sqlSession, pi);		
	}

	@Override
	public Magazine selectMagazine(int magazineNo) {

		return magazineDao.selectMagazine(sqlSession, magazineNo);
	}

	@Override
	public int insertMagazine(Magazine mag) {

		return magazineDao.insertMagazine(sqlSession, mag);
	}

	@Override
	public int deleteMagazine(int magazineNo) {

		return magazineDao.deleteMagazine(sqlSession, magazineNo);
	}

	@Override
	public int updateMagazine(Magazine mag) {
		
		return magazineDao.updateMagazine(sqlSession, mag);
	}

	

}
