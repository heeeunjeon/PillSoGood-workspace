package com.kh.pill.question.model.service;

import java.util.ArrayList;

import com.kh.pill.common.model.vo.PageInfo;
import com.kh.pill.question.model.vo.Question;

public interface QuestionService {
	
	// 리스트조회
	int selectListCount(int memberNo);
	ArrayList<Question> selectQuestionList(int memberNo, PageInfo pi);
	
	// 상세조회
	Question selectQuestion(int questionNo);
	
	// 작성
	int insertQuestion(Question q);
	
	// 수정
	int updateQuestion(Question q);
	
	// 삭제
	int deleteQuestion(int questionNo);
	
}
