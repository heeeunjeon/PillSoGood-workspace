package com.kh.pill.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.pill.common.model.vo.PageInfo;
import com.kh.pill.member.model.dao.MyPageDao;
import com.kh.pill.order.model.vo.Order;
import com.kh.pill.poll.model.vo.Poll;
import com.kh.pill.poll.model.vo.PollResult;
import com.kh.pill.product.model.vo.Product;

@Service
public class MyPageServiceImpl implements MyPageService {
	
	@Autowired
	private MyPageDao myPageDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	/**
	 * 전체 주문내역 수
	 */
	@Override
	public int selectMyOrderListCount(int memberNo) {
		return myPageDao.selectMyOrderListCount(sqlSession, memberNo);
	}
	
	/**
	 * 주문내역 전체 조회
	 */
	@Override
	public ArrayList<Order> selectMyOrderList(PageInfo pi, int memberNo) {
		return myPageDao.selectMyOrderList(sqlSession, pi, memberNo);
	}

	/**
	 * 주문내역의 제품명 조회
	 */
	@Override
	public ArrayList<Product> selectMyOrderProducts(String orderNo) {
		return myPageDao.selectMyOrderProducts(sqlSession, orderNo);
	}
	
	
	
	
	/**
	 * 설문조사 결과 조회용 서비스
	 */
	@Override
	public ArrayList<PollResult> selectPollResult(int memberNo) {
		
		return myPageDao.selectPollResult(sqlSession, memberNo);
	}



	/**
	 * 설문조사 결과 조회용 서비스
	 */
	@Override
	public ArrayList<Poll> selectPollList(int memberNo) {
		
		return myPageDao.selectPollList(sqlSession, memberNo);
	}




}
