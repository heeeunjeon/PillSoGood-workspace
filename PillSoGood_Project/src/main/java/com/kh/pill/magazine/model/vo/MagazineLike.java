package com.kh.pill.magazine.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class MagazineLike {

	private int magazineNo; //MAGAZINE_NO	NUMBER
	private String categoryName; //CATEGORY_NAME	VARCHAR2(30 BYTE)
}
