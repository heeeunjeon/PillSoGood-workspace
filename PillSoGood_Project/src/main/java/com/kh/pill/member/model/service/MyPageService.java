package com.kh.pill.member.model.service;

import java.util.ArrayList;

import com.kh.pill.poll.model.vo.Poll;
import com.kh.pill.poll.model.vo.PollResult;

public interface MyPageService {
	
	
	
	
	// 설문 결과 조회용
	ArrayList<Poll> selectPollList(int memberNo);
	ArrayList<PollResult> selectPollResult(int memberNo);

}
