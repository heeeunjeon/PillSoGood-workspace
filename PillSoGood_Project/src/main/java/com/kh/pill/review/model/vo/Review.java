package com.kh.pill.review.model.vo;

import java.sql.Date;
import java.util.ArrayList;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor //기본생성자
@Setter // setter메소드들
@Getter // getter메소드들
@ToString //toString메소드
public class Review {

	private int reviewNo; // REVIEW_NO	NUMBER
	private String reviewTitle; // REVIEW_TITLE	VARCHAR2(100 BYTE)
	private String reviewContent; // REVIEW_CONTENT	VARCHAR2(3000 BYTE)
	private Date reviewDate; // REVIEW_DATE	DATE
	private int reviewCount; // REVIEW_COUNT	NUMBER
	private int reviewGrade; // REVIEW_GRADE	NUMBER
	private String reviewStatus; // REVIEW_STATUS	CHAR(1 BYTE)
	
	// 일반 리뷰 조회용 VO
	private String memberName;
	private String memberId;
	private String subsStatus;
	private int replyCount;
	private ArrayList<ReviewFile> flist; // REVIEW_FILE 테이블에서 List 뽑아와서 List<Review>에 담을 변수
}
