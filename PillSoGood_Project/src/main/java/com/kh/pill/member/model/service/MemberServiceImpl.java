package com.kh.pill.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pill.member.model.dao.MemberDao;
import com.kh.pill.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	// Spring 에서 MyBatis 를 사용하기 위한 SqlSessionTemplate 변수 선언
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao memberDao;
	
	@Override
	public Member loginMember(Member m) {

		Member loginUser = memberDao.loginMember(sqlSession, m);

		return loginUser;
	}

	@Override
	public int insertMember(Member m) {

		return memberDao.insertMember(sqlSession, m);
	}

	@Override
	public int updateMember(Member m) {

		return memberDao.updateMember(sqlSession, m);
	}

	@Override
	public int deleteMember(String userId) {
		
		return memberDao.deleteMember(sqlSession, userId);
	}

	@Override
	public int idCheck(String checkId) {
		
		return memberDao.idCheck(sqlSession, checkId);
	}

}
