package com.omb.admin.main.controller;

import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.omb.admin.depositInfo.service.AdmDepositInfoService;
import com.omb.admin.depositInfo.vo.AdmDepositInfoVO;
import com.omb.admin.product.service.AdmProductService;
import com.omb.admin.statistics.service.StatisticsService;
import com.omb.user.product.vo.ProductVO;
import com.omb.user.serviceCenter.service.ServiceCenterService;

import lombok.Setter;

@Controller
@RequestMapping("/admin/*")
public class AdmMainController {
	
	@Setter(onMethod_=@Autowired)
	private AdmProductService admProductService;
	
	@Setter(onMethod_=@Autowired)
	private AdmDepositInfoService admDepositService;
	
	@Setter(onMethod_=@Autowired)
	private ServiceCenterService serviceCenterService;
	
	@Setter(onMethod_=@Autowired)
	private StatisticsService statisticsService;
	
	@GetMapping("/main")
	public String admMain() {
		return "admin/main/adminMain";
	}
	
	@ResponseBody
	@GetMapping("/main/queuedCnt")
	public int productCnt(ProductVO vo) {
		int cnt = 0;
		cnt = admProductService.queuedCnt(vo);
		
		return cnt;
	}
	
	@ResponseBody
	@GetMapping("/main/depositCnt")
	public int depositCnt(AdmDepositInfoVO vo) {
		int cnt = 0;
		cnt = admDepositService.selectDepositCnt(vo);
		return cnt;
	}
	
	@ResponseBody
	@GetMapping("/main/serviceCnt")
	public int serviceCnt() throws Exception{
		int cnt = 0;
		cnt = serviceCenterService.selectNoReplyCnt();
		return cnt;
	}
	
	@ResponseBody
	@GetMapping(value="/main/getUsers", produces = "application/json; charset=UTF-8")
	public String getUserStatistics() {
		List<Map<String, Object>> list = statisticsService.selectUser();
		JSONArray jsonList = new JSONArray();
		for(Map<String, Object> m:list) {
			JSONObject json = new JSONObject();
			for(Map.Entry<String, Object> entry:m.entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();
				json.put(key, value);
			}
			jsonList.put(json);
		}
		return jsonList.toString();
	}
	
	@ResponseBody
	@GetMapping(value="/main/getOrders", produces = "application/json; charset=UTF-8")
	public String getOrderStatistics() {
		List<Map<String, Object>> list = statisticsService.selectOrder();
		JSONArray jsonList = new JSONArray();
		for(Map<String, Object> m:list) {
			JSONObject json = new JSONObject();
			for(Map.Entry<String, Object> entry:m.entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();
				json.put(key, value);
			}
			jsonList.put(json);
		}
		return jsonList.toString();
	}
}
