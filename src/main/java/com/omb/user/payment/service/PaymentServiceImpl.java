package com.omb.user.payment.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;
import java.util.Map;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.omb.user.payment.dao.PaymentDAO;
import com.omb.user.payment.vo.PaymentVO;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Service
public class PaymentServiceImpl implements PaymentService {

	@Value("${imp_key}")
	private String impKey;
	
	@Value("${imp_secret}")
	private String impSecret;
	
	@Setter(onMethod_ = @Autowired)
	private PaymentDAO paymentDAO;
	
	@ToString
	@Getter
	private class Response {
		private PaymentInfo response;
	}
	
	@ToString
	@Getter
	private class PaymentInfo{
		private int amount;
	}
	
	// API 요청으로 토큰 얻어오기
	@Override
	public String getToken() throws IOException {
		
		HttpsURLConnection conn = null;
		
		URL url = new URL("https://api.iamport.kr/users/getToken");		// 요청 url
		 
		conn = (HttpsURLConnection) url.openConnection();

		conn.setRequestMethod("POST");		// 요청 방식 post
		conn.setRequestProperty("Content-type", "application/json");	// 요청할 파라미터 전달 형식 설정
		conn.setRequestProperty("Accept", "application/json");	// 응답받은 데이터의 반환 형식 설정
		conn.setDoOutput(true);
		
		JsonObject json = new JsonObject();	// json 객체 생성

		json.addProperty("imp_key", impKey);		// 전달할 파라미터 값을 json 객체에 추가
		json.addProperty("imp_secret", impSecret);	// 전달할 파라미터 값을 json 객체에 추가
		
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		
		bw.write(json.toString());
		bw.flush();	// api 요청
		bw.close();

		// 응답객체 얻어온다.
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));

		Gson gson = new Gson();
		
		// 응답 객체 key 값 중 "response"을 찾아 String 타입 response에 담는다.
		String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();
		
		System.out.println(response);
		
		// 얻어온 응답 객체 key 값 중 "access_token"을 찾아 token 변수에 담는다.
		String token = gson.fromJson(response, Map.class).get("access_token").toString();

		br.close();
		conn.disconnect();

		return token;	// 토큰 리턴
	}

	
	// API 요청으로 결제정보 얻어오기
	@Override
	public int paymentInfo(String imp_uid, String access_token) throws IOException {
		
		HttpsURLConnection conn = null;
		 
	    URL url = new URL("https://api.iamport.kr/payments/" + imp_uid);
	 
	    conn = (HttpsURLConnection) url.openConnection();
	 
	    conn.setRequestMethod("GET");
	    conn.setRequestProperty("Authorization", access_token);
	    conn.setDoOutput(true);
	 
	    BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
	    
	    Gson gson = new Gson();
	    
	    Response response = gson.fromJson(br.readLine(), Response.class);
	    
	    br.close();
	    conn.disconnect();
	    
	    return response.getResponse().getAmount();	// 결제 금액 리턴 (int 타입)
	}

	
	// API 요청으로 결제취소 처리하기
	@Override
	public int paymentCancle(String access_token, String imp_uid, String reason) throws IOException {

		int result = 0;
		
		System.out.println("결제 취소 요청");
		System.out.println("-------------전달받은 데이터-------------");
		System.out.println("토큰 : " + access_token);
		System.out.println("결제번호 : " + imp_uid);
		
		HttpsURLConnection conn = null;
		URL url = new URL("https://api.iamport.kr/payments/cancel");
 
		conn = (HttpsURLConnection) url.openConnection();
 
		conn.setRequestMethod("POST");
 
		conn.setRequestProperty("Content-type", "application/json");
		conn.setRequestProperty("Accept", "application/json");
		conn.setRequestProperty("Authorization", access_token);
 
		conn.setDoOutput(true);
		
		JsonObject json = new JsonObject();
 
		json.addProperty("reason", reason);
		json.addProperty("imp_uid", imp_uid);
		//json.addProperty("amount", amount); 부분 취소 시 취소할 금액을 매개변수로 전달받아 입력
		//json.addProperty("checksum", amount);
 
		BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
 
		bw.write(json.toString());
		bw.flush();
		bw.close();
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
		
		Gson gson = new Gson();
 
		// 응답 객체 key 값 중 "response"을 찾아 String 타입 response에 담는다.
		String response = gson.fromJson(br.readLine(), Map.class).get("response").toString();
		
		System.out.println("취소처리 후 응답객체 : " + response);
		
		
		if(response != null) 
			result = 1;
				
		br.close();
		conn.disconnect();
		
		return result;
	}


	@Override
	public int insertPaymentInfo(PaymentVO pvo) {
		int inserResult = 0;
		
		inserResult = paymentDAO.insertPaymentInfo(pvo);
		
		return inserResult;
	}

	
	
	

	
}
