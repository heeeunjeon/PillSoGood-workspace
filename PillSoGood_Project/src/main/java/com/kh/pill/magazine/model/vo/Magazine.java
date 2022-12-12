package com.kh.pill.magazine.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Magazine {

	private int magazineNo; //MAGAZINE_NO	NUMBER
	private String magazineTitle; //MAGAZINE_TITLE	VARCHAR2(100 BYTE)
	private String magazineContent; //MAGAZINE_CONTENT	VARCHAR2(3000 BYTE)
	private int magazineCount; //MAGAZINE_COUNT	NUMBER
	private String magazineImgName; //MAGAZINE_IMG_NAME	VARCHAR2(1000 BYTE)
	private String categoryName; //CATEGORY_NAME	VARCHAR2(30 BYTE)
	private String magazineStatus; //MAGAZINE_STATUS	CHAR(1 BYTE)
	private String magazineHashtag; //MAGAZINE_HASHTAG	VARCHAR2(100 BYTE)
}
