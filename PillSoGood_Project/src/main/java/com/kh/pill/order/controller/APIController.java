package com.kh.pill.order.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.pill.member.model.vo.Member;
import com.siot.IamportRestClient.IamportClient;
import com.siot.IamportRestClient.exception.IamportResponseException;
import com.siot.IamportRestClient.response.AccessToken;
import com.siot.IamportRestClient.response.IamportResponse;
import com.siot.IamportRestClient.response.Payment;

@Controller
public class APIController {
	
	public static final String IMP_KEY = "1727133848405455";
	public static final String IMP_SECRET = "OCjfwc1lxL1LMNxWqq38WJceT8I24xn8k1e6UGT23s9nxtmFtMouX70Sk09YOR2S3OXI578aeko6jxIB";
	public static final String TOKEN_URL = "https://api.iamport.kr/users/getToken";
	
	private IamportClient client = new IamportClient(IMP_KEY, IMP_SECRET);
	
	@ResponseBody
	@RequestMapping(value="/verifyIamport/{imp_uid}")
	public IamportResponse<Payment> verifyIamportPOST(@PathVariable(value = "imp_uid") String imp_uid) throws IamportResponseException, IOException {
	    return client.paymentByImpUid(imp_uid);
	}
	
	@ResponseBody
	@RequestMapping(value="/users/getToken")
	public IamportResponse<AccessToken> getToken() throws IamportResponseException, IOException {
	    return client.getAuth();
	}
	
	/*
	@ResponseBody
	@RequestMapping(value="billing.do", produces="text/html; charset=UTF-8")
	public String getCustomeruid(String token, String card_number, String expiry, String birth, String pwd_2digit, HttpSession session) throws IOException {
		
		// String customer_uid = ((Member)session.getAttribute("loginUser")).getMemberNo() + "_" + card_number.substring(16, 20);
		String customer_uid = 1 + "_" + card_number.substring(15);
		
		URL requestUrl = new URL("https://api.iamport.kr/subscribe/customers/" + customer_uid);
		
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		
		urlConnection.setRequestMethod("POST");
		
		urlConnection.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
		urlConnection.setRequestProperty("Accept", "application/json");
		urlConnection.setRequestProperty("Authorization", token);
		urlConnection.setDoOutput(true);
		
		JSONObject jObj = new JSONObject();
		jObj.put("pg", "nice");
		jObj.put("card_number", card_number);
		jObj.put("expiry", expiry);
		jObj.put("birth", birth);
		jObj.put("pwd_2digit", pwd_2digit);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(urlConnection.getOutputStream()));
		bw.write(jObj.toString());
		bw.flush();
		bw.close();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseType = "";
		String line; // null
		
		while((line = br.readLine()) != null) {
			
			responseType += line;
		}
		
		br.close();
		urlConnection.disconnect();
		

		System.out.println(token);
		System.out.println(card_number);
		System.out.println(birth);
		System.out.println(pwd_2digit);
		
		System.out.println(responseType);
		
		return responseType;
	}
	*/
	
	@ResponseBody
	@RequestMapping(value="billing.do", produces="application/json; charset=UTF-8")
	public String firstSubscription(String name, int amount, String token, String card_number, String expiry, String birth, String pwd_2digit, HttpSession session) throws IOException {
		
		// String customer_uid = ((Member)session.getAttribute("loginUser")).getMemberNo() + "_" + card_number.substring(16, 20);
		String orderNo = "" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + ((int)(Math.random() * 90000) + 10000);
		String customer_uid = 1 + "_" + card_number.substring(15);
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		URL requestUrl = new URL("https://api.iamport.kr/subscribe/payments/onetime");
		
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		
		urlConnection.setRequestMethod("POST");
		
		urlConnection.setRequestProperty("Access-Control-Allow-Origin", "http://localhost:8006");
		urlConnection.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
		urlConnection.setRequestProperty("Accept", "application/json");
		urlConnection.setRequestProperty("Authorization", token);
		urlConnection.setDoOutput(true);
		
		JSONObject jObj = new JSONObject();
		jObj.put("pg", "nice");
		jObj.put("merchant_uid", orderNo);
		jObj.put("name", name);
		jObj.put("amount", amount);
		jObj.put("card_number", card_number);
		jObj.put("expiry", expiry);
		jObj.put("birth", birth);
		jObj.put("pwd_2digit", pwd_2digit);
		jObj.put("buyer_name", "홍길동");
		// jObj.put("buyer_name", "loginUser.getMemberName()");
		jObj.put("buyer_email", "aaa@naver.com");
		// jObj.put("buyer_email", "loginUser.getEmail()");
		jObj.put("customer_uid", customer_uid);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(urlConnection.getOutputStream()));
		bw.write(jObj.toString());
		bw.flush();
		bw.close();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseType = "";
		String line; // null
		
		while((line = br.readLine()) != null) {
			
			responseType = line;
			System.out.println(responseType);
		}
		
		br.close();
		urlConnection.disconnect();
		
		return responseType;
	}
	
	@ResponseBody
	@RequestMapping(value="schedule.do", produces="application/json; charset=UTF-8")
	public String paySchdule(String token, String customer_uid, String name, int amount, Integer time, HttpSession session) throws Exception {
		
		time.intValue();
		System.out.println(time);
		time += 60;
		System.out.println(time);
		
		String orderNo = "" + new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()) + ((int)(Math.random() * 90000) + 10000);
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		URL requestUrl = new URL("https://api.iamport.kr/subscribe/payments/schedule");
		
		HttpURLConnection urlConnection = (HttpURLConnection)requestUrl.openConnection();
		
		urlConnection.setRequestMethod("POST");
		
		urlConnection.setRequestProperty("Access-Control-Allow-Origin", "http://localhost:8006");
		urlConnection.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
		urlConnection.setRequestProperty("Accept", "application/json");
		urlConnection.setRequestProperty("Authorization", token);
		urlConnection.setDoOutput(true);
		
		JSONObject schedule = new JSONObject();
		schedule.put("merchant_uid", orderNo);
		schedule.put("schedule_at", time);
		schedule.put("currency", "KRW");
		schedule.put("amount", amount);
		schedule.put("name", name);
		schedule.put("buyer_name", "홍길동");
		// schdule.put("buyer_name", "loginUser.getMemberName()");
		schedule.put("buyer_email", "aaa@naver.com");
		// schdule.put("buyer_email", "loginUser.getEmail()");
		
		JSONArray jArr = new JSONArray();
		jArr.add(schedule);
		
		JSONObject jObj = new JSONObject();
		jObj.put("customer_uid", customer_uid);
		jObj.put("schedules", jArr);
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(urlConnection.getOutputStream()));
		bw.write(jObj.toString());
		bw.flush();
		bw.close();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
		
		String responseType = "";
		String line; // null
		
		while((line = br.readLine()) != null) {
			
			responseType += line;
			System.out.println(responseType);
		}
		
		br.close();
		urlConnection.disconnect();
		
		return responseType;
	}
	
	
	@PostMapping(value="/iamport/webhook", produces="application/json; charset=UTF-8;")
	public void webhookTest(@RequestBody HashMap<String,Object> webhook_param) {
		
		System.out.println(webhook_param);
		
		String merchantUid = webhook_param.get("merchant_uid").toString();
		
		System.out.println(merchantUid);
	}
	
	
	
}
