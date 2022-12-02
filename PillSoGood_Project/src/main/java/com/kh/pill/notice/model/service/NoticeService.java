package com.kh.pill.notice.model.service;

import java.util.ArrayList;

import com.kh.pill.common.model.vo.PageInfo;
import com.kh.pill.notice.model.vo.Notice;

public interface NoticeService {
	
	int selectListCount();
	

	ArrayList<Notice> selectList(PageInfo pi);
	

	int increaseCount(int boardNo);
	
	Notice selectBoard(int boardNo);
	

	int deleteBoard(int boardNo);
	

	int updateBoard(Notice n);
	
}
