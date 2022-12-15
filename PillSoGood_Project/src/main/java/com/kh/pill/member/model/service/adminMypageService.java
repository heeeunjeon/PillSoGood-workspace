package com.kh.pill.member.model.service;

import java.util.ArrayList;

import com.kh.pill.common.model.vo.PageInfo;
import com.kh.pill.member.model.vo.Member;

public interface adminMypageService {

	// 페이지 카운트 세기
	int selectListCount();

	// 회원 정보 조회 
	ArrayList<Member> selectList(PageInfo pi);

	// 회원 정보 상세 조회
	Member selectMember(int mno);

}
