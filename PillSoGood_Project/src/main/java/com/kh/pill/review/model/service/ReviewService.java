package com.kh.pill.review.model.service;

import java.util.ArrayList;

import com.kh.pill.common.model.vo.PageInfo;
import com.kh.pill.review.model.vo.Review;
import com.kh.pill.review.model.vo.ReviewFile;
import com.kh.pill.review.model.vo.ReviewReply;

public interface ReviewService {

	// 베스트 리뷰 게시글 리스트 조회
	ArrayList<Review> selectBestList();
	// 베스트 리뷰 게시글 첨부파일 rno별 조회
	ArrayList<ReviewFile> selectBestReviewFile(int rno);
	
	// 일반 리뷰 게시판 리스트 조회 서비스 + 페이징처리
	// 일반 리뷰 게시글의 총 개수
	int selectListCount();
	// 일반 리뷰 게시글 리스트 조회
	ArrayList<Review> selectList(PageInfo pi, String order);
	// 일반 리뷰 게시글 첨부파일 rno별 조회
	ArrayList<ReviewFile> selectReviewFile(int rno);
	// 일반 리뷰 게시글 댓글개수 rno별 조회
	int selectReplyCount(int rno);
	
	// 리뷰 게시글 상세 조회 서비스
	// 리뷰 게시글 조회수 증가
	int increaseCount(int reviewNo);
	// 리뷰 게시글 상세 조회 요청
	Review selectReview(int ReviewNo);
	
	// 리뷰 게시글 삭제 서비스
	int deleteReview(int reviewNo);
	
	// 리뷰 게시글 수정 서비스
	int updateReview(Review r);
	
	// 리뷰 댓글 리스트 조회용 서비스 (Ajax)
	ArrayList<ReviewReply> selectReviewReplyList(int reviewNo);	
	// 리뷰 댓글 작성용 서비스 (Ajax)
	int insertReviewReply(ReviewReply r);
	// 리뷰 댓글 삭제용 서비스 (Ajax)
	int deleteReviewReply(int replyNo);
	
	// 임시 리뷰 게시글 작성 서비스 
	int insertRawReview(Review r);
	// 임시 리뷰 게시글 조회 서비스
	Review selectRawReview(int memberNo);

	// 리뷰 사진 첨부 서비스 
	int insertReviewFile(ReviewFile reviewFile);
	
	// 리뷰 첨부 사진 조회 서비스
	ArrayList<ReviewFile> selectNewReviewFile(int rawReviewNo);

	// 리뷰 게시글 작성 서비스
	int insertReview(Review r);
	
	
	
	

	
	
	
	
	
	
	
}
