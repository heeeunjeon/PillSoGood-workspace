package com.kh.pill.order.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.kh.pill.member.model.vo.Member;
import com.kh.pill.order.model.service.OrderService;
import com.kh.pill.order.model.vo.Order;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.request.CardInfo;
import com.siot.IamportRestClient.request.OnetimePaymentData;
import com.siot.IamportRestClient.request.ScheduleData;
import com.siot.IamportRestClient.request.ScheduleEntry;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class APIController {
	
	public static final String IMP_KEY = "1727133848405455";
	public static final String IMP_SECRET = "OCjfwc1lxL1LMNxWqq38WJceT8I24xn8k1e6UGT23s9nxtmFtMouX70Sk09YOR2S3OXI578aeko6jxIB";
	public static final String TOKEN_URL = "https://api.iamport.kr/users/getToken";
	
	private IamportClient client = new IamportClient(IMP_KEY, IMP_SECRET);
	
	@Autowired
	private OrderService orderService;
	
	@ResponseBody
	@RequestMapping(value="/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> verifyIamport(@PathVariable(value = "imp_uid")String impUid) throws IamportResponseException, IOException {
	    return client.paymentByImpUid(impUid);
	}
	
	@ResponseBody
	@RequestMapping(value="/users/getToken")
	public IamportResponse<AccessToken> getToken() throws IamportResponseException, IOException {
	    return client.getAuth();
	}
	
	@ResponseBody
	@RequestMapping(value="/subscribe/payments/onetime")
	public IamportResponse<Payment> onetime(String merchant_uid, BigDecimal amount, String name, String card_number, String expiry, String birth, String pwd_2digit, Member m) throws IamportResponseException, IOException {
		OnetimePaymentData onetimeData = new OnetimePaymentData(merchant_uid, amount, new CardInfo(card_number, expiry, birth, pwd_2digit));
		onetimeData.setPg("nice");
		String customer_uid = m.getMemberId() + "_" + card_number.substring(15);
		onetimeData.setCustomer_uid(customer_uid);
		onetimeData.setName(name);
		onetimeData.setBuyerName(m.getMemberName());
		onetimeData.setBuyerEmail(m.getEmail());
		onetimeData.setBuyerPostcode(m.getAddressZip());
		onetimeData.setBuyerAddr(m.getAddress1() + " " + m.getAddress2());
		
		return client.onetimePayment(onetimeData);
	}
	
	@ResponseBody
	@RequestMapping(value="/subscribe/payments/schedule")
	public void subscribeSchedule(String merchant_uid, String response) throws Exception {
		
		JsonObject payment = JsonParser.parseString(response).getAsJsonObject();
		
		Date schedule_at = new Date(payment.get("paidAt").getAsLong() + 60000);
		
		ScheduleEntry entry = new ScheduleEntry(merchant_uid, schedule_at, payment.get("amount").getAsBigDecimal());
		entry.setName(payment.get("name").getAsString());
		entry.setBuyerName(payment.get("buyerName").getAsString());
		entry.setBuyerEmail(payment.get("buyerEmail").getAsString());
		
		ScheduleData scheduleData = new ScheduleData(payment.get("customerUid").getAsString());
		scheduleData.addSchedule(entry);
		
		client.subscribeSchedule(scheduleData);
	}
	
	/*
	@GetMapping(value="/subscribe/customers/{customer_uid}")
	public IamportResponse<BillingCustomer> getCustomerUid(@PathVariable(value = "customer_uid")String customerUid) throws IamportResponseException, IOException {
	    return client.getBillingCustomer(customerUid);
	}
	*/
	
	@GetMapping(value="/payments/{imp_uid}")
	public IamportResponse<Payment> getPayments(@PathVariable(value="imp_uid")String impUid) throws IamportResponseException, IOException {
		return client.paymentByImpUid(impUid);
	}
	
	
	@RequestMapping(value="/iamport/webhook")
	public void webhookTest(@RequestBody HashMap<String,Object> webhook) throws Exception {
		
		if(webhook.get("status").toString().equals("paid")) {
			
			String impUid = webhook.get("imp_uid").toString();
			
			Payment p = getPayments(impUid).getResponse();
			
			System.out.println(p.getMerchantUid().substring(0, 14));
			
			Order o = new Order();
			o.setOrderNo(p.getMerchantUid());
			o.setOrderDate(p.getMerchantUid().substring(0, 14));
			o.setOrderPrice(p.getAmount().intValue());
			o.setOrderReceipt(p.getReceiptUrl());
			o.setSubsStatus("Y");
			o.setAddress("(" + p.getBuyerPostcode() + ") " + p.getBuyerAddr());
			
			orderService.insertOrder(o);
			
			ObjectMapper mapper = new ObjectMapper();
			String response = mapper.writeValueAsString(p);
			
			String merchantUid = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + ((int)(Math.random() * 90000) + 10000);
			
			subscribeSchedule(merchantUid, response);
		}
	}
	
	
	
}
