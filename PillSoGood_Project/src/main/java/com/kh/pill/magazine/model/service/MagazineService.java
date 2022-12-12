package com.kh.pill.magazine.model.service;

import java.util.ArrayList;

import com.kh.pill.common.model.vo.PageInfo;
import com.kh.pill.magazine.model.vo.Magazine;
import com.kh.pill.magazine.model.vo.MagazineLike;

public interface MagazineService {

	int selectListCount();
	
	ArrayList<Magazine> selectMagazineList(PageInfo pi);
	
	Magazine selectMagazine(int magazineNo);

	int insertMagazine(Magazine mag);
	
	int deleteMagazine(int magazineNo);
	
	int updateMagazine(Magazine mag);
	

}
