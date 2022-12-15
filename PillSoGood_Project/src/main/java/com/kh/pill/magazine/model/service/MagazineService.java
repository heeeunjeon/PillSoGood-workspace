package com.kh.pill.magazine.model.service;

import java.util.ArrayList;
import java.util.List;

import com.kh.pill.common.model.vo.PageInfo;
import com.kh.pill.magazine.model.vo.Magazine;
import com.kh.pill.magazine.model.vo.MagazinePage;

public interface MagazineService {

	int selectListCount();
	
	ArrayList<Magazine> selectMagazineList(PageInfo pi);
	
	Magazine selectMagazine(int magazineNo);

	int insertMagazine(Magazine mag);
	
	int deleteMagazine(int magazineNo);
	
	int updateMagazine(Magazine mag);

	// 조회수
	int updateViewCount(int magazineNo);
	
	// 이전글 최신글
	MagazinePage magazinePage(int magazineNo);

	// 카테고리
	List<Magazine> getMagazine(int categoryNo);
}
