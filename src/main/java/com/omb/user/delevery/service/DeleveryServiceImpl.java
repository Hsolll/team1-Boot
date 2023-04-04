package com.omb.user.delevery.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URL;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.gson.JsonObject;
import com.omb.user.delevery.vo.Delevery;

@Service
public class DeleveryServiceImpl implements DeleveryService {

	@Value("${smartParcel_key}")
	private String apiKey;
	
	// API 요청으로 택배사 코드, 이름 얻어오기
	@Override
	public String companyList() throws IOException {
		
		String inputLine = null;
        StringBuilder outResult = new StringBuilder();
        
		HttpsURLConnection conn = null;
	      
	 	URL url = new URL("https://info.sweettracker.co.kr/api/v1/companylist");	// 요청 url

	 	conn = (HttpsURLConnection) url.openConnection();
	 	
	 	conn.setRequestMethod("GET");      // 요청 방식
		conn.setRequestProperty("Content-type", "application/json");   // 요청할 파라미터 전달 형식 설정
		conn.setRequestProperty("Accept", "application/json");   // 응답받은 데이터의 반환 형식 설정
		conn.setDoOutput(true);
		
		JsonObject json = new JsonObject();   // json 객체 생성

	    json.addProperty("t_key", apiKey);      // 전달할 파라미터 값을 json 객체에 추가
	    
	    BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	      
	    bw.write(json.toString());
	    bw.flush();   // api 요청
	    bw.close();
	    
	    // 응답객체 얻어온다.
	    BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
	    
	    while ((inputLine = br.readLine()) != null) {
            outResult.append(inputLine);
        }
	    
		br.close();
		conn.disconnect();
	    
		return outResult.toString();
	}
	
	
	// API 요청으로 배송조회하기
		@Override
		public String trackingInfo(Delevery delevery) throws IOException {
			
			String inputLine = null;
	        StringBuilder outResult = new StringBuilder();
	        
			HttpsURLConnection conn = null;
			// "https://info.sweettracker.co.kr/api/v1/trackingInfo?t_code=04&t_invoice=654064742334&t_key=DCio8T09wvhbq6Y57InCog"
			
		 	URL url = new URL("https://info.sweettracker.co.kr/api/v1/trackingInfo");	// 요청 url

		 	conn = (HttpsURLConnection) url.openConnection();
		 	
		 	conn.setRequestMethod("GET");      // 요청 방식
			conn.setRequestProperty("Content-type", "application/json");   // 요청할 파라미터 전달 형식 설정
			conn.setRequestProperty("Accept", "application/json");   // 응답받은 데이터의 반환 형식 설정
			conn.setDoOutput(true);
			
			JsonObject json = new JsonObject();   // json 객체 생성
			json.addProperty("t_code", delevery.getT_code());		// 전달할 파라미터 값을 json 객체에 추가
			json.addProperty("t_invoice", delevery.getT_invoice());
		    json.addProperty("t_key", apiKey);      
		    
		    BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
		      
		    bw.write(json.toString());
		    bw.flush();   // api 요청
		    bw.close();
		    
		    // 응답객체 얻어온다.
		    BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
		    
		    while ((inputLine = br.readLine()) != null) {
	            outResult.append(inputLine);
	        }
		    
			br.close();
			conn.disconnect();
		    
			return outResult.toString();
		}

}
