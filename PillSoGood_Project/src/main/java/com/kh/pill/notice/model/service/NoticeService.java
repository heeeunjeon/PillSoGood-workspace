package com.kh.pill.notice.model.service;

import java.util.ArrayList;

import com.kh.pill.common.model.vo.PageInfo;
import com.kh.pill.notice.model.vo.Notice;

public interface NoticeService {
	
	int selectListCount();
	

	ArrayList<Notice> selectList(PageInfo pi);
	
	int insertNotice(Notice n);

	int increaseCount(int noticeNo);
	
	ArrayList<Notice> selectNotice(int noticeNo);
	

	int deleteNotice(int noticeNo);
	

	int updateNotice(Notice n);
	
	Notice selectUpdateNotice(int noticeNo);
	
}
