package com.kh.pill.magazine.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class MagazineHashtag {
	
	private int magazineNo; //MAGAZINE_NO	NUMBER
	private String magazineHashtag;// MAGAZINE_HASHTAG	VARCHAR2(100 BYTE)
}
