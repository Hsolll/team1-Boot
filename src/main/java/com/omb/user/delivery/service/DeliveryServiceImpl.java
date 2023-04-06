package com.omb.user.delivery.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;

import javax.net.ssl.HttpsURLConnection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.omb.user.delivery.dao.DeliveryDAO;
import com.omb.user.delivery.vo.DeliveryVO;

import lombok.Setter;

@Service
public class DeliveryServiceImpl implements DeliveryService {

	@Value("${smartParcel_key}")
	private String apiKey;
	
	@Setter(onMethod_ = @Autowired)
	private DeliveryDAO deliveryDAO;
	
	// API 요청으로 택배사 코드, 이름 얻어오기
	@Override
	public String companyList() throws IOException {
		
		String inputLine = null;
        StringBuilder outResult = new StringBuilder();
        
		HttpsURLConnection conn = null;
	      
	 	URL url = new URL("https://info.sweettracker.co.kr/api/v1/companylist?t_key="+apiKey);	// 요청 url

	 	conn = (HttpsURLConnection) url.openConnection();
	 	
	 	conn.setRequestMethod("GET");      // 요청 방식
		conn.setRequestProperty("Content-type", "application/json");   // 요청할 파라미터 전달 형식 설정
		conn.setRequestProperty("Accept", "application/json");   // 응답받은 데이터의 반환 형식 설정
		conn.setDoOutput(true);
		
		//JsonObject json = new JsonObject();   // json 객체 생성

	    //json.addProperty("t_key", apiKey);      // 전달할 파라미터 값을 json 객체에 추가
	    
	    //BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
	      
	    //bw.write(json.toString());
	    //bw.flush();   // api 요청
	    //bw.close();
	    
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
		public String deliveryTracking(DeliveryVO delivery) throws IOException {
			
	        StringBuffer site = new StringBuffer("https://info.sweettracker.co.kr/api/v1/trackingInfo");
	        site.append("?" + URLEncoder.encode("t_key", "UTF-8") + "=" + apiKey);
			site.append("&" + URLEncoder.encode("t_code", "UTF-8") + "=" + URLEncoder.encode(delivery.getT_code(), "UTF-8"));			/* 페이지 번호 - 필수 */
			site.append("&" + URLEncoder.encode("t_invoice", "UTF-8") + "=" + URLEncoder.encode(delivery.getT_invoice(), "UTF-8"));
	        
			URL url = new URL(site.toString());	// 요청 url
	        
			HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
		 	
		 	conn.setRequestMethod("GET");      // 요청 방식
			conn.setRequestProperty("Content-type", "application/json");   // 요청할 파라미터 전달 형식 설정
			conn.setRequestProperty("Accept", "application/json");   // 응답받은 데이터의 반환 형식 설정
			conn.setDoOutput(true);
			
			int resCode = conn.getResponseCode();
			System.out.println("응답코드 : " + resCode);
		    
		    // 응답객체 얻어온다.
		    BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		    
		    String inputLine = null;
	        StringBuilder outResult = new StringBuilder();
	        
		    while ((inputLine = br.readLine()) != null) {
	            outResult.append(inputLine);
	        }
		    
			br.close();
			conn.disconnect();
		    
			return outResult.toString();
		}


		@Override
		public int insertDeliveryInfo(DeliveryVO delevery) {
			int result = deliveryDAO.insertDeliveryInfo(delevery);
			return result;
		}


		@Override
		public DeliveryVO selectDeliveryInfo(DeliveryVO delivery) {
			DeliveryVO detail = deliveryDAO.selectDeliveryInfo(delivery);
			detail.setT_key(apiKey);
			return detail;
		}

}
