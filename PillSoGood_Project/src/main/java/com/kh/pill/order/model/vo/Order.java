package com.kh.pill.order.model.vo;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class Order {
	
	private String orderNo;
	private String orderDate;
	private int orderPrice;
	private int subsCount;
	private String customerUid;
	private String orderReceipt;
	private String orderStatus;
	private String subsStatus;
	private int delivery;
	private String address;
}
