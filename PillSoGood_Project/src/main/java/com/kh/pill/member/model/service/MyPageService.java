package com.kh.pill.member.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.pill.common.model.vo.PageInfo;
import com.kh.pill.order.model.vo.Order;
import com.kh.pill.poll.model.vo.Poll;
import com.kh.pill.poll.model.vo.PollResult;
import com.kh.pill.product.model.vo.Product;

public interface MyPageService {
	
	// 주문조회
	int selectMyOrderListCount(int memberNo);
	ArrayList<Order> selectMyOrderList(PageInfo pi, int memberNo);
	// 주문내역의 상품정보들 조회
	ArrayList<Product> selectMyOrderProducts(String orderNo);
	
	// 주문조회 기간별 검색
	int searchOrderListByDateCount(HashMap<String, String> map);
	ArrayList<Order> searchOrderListByDate(PageInfo pi, HashMap<String, String> map);
	
	// 설문 결과 조회용
	ArrayList<Poll> selectPollList(int memberNo);
	ArrayList<PollResult> selectPollResult(int memberNo);

}
