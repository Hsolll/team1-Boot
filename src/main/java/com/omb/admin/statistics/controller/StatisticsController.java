package com.omb.admin.statistics.controller;

import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.omb.admin.statistics.service.StatisticsService;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value="/admin/*")
@Slf4j
public class StatisticsController {
	
	@Setter(onMethod_=@Autowired)
	private StatisticsService statisticsService;
	
	@ResponseBody
	@GetMapping(value="/statistics/category", produces = "application/json; charset=UTF-8")
	public String getCateList(){
		
		List<Map<String, Object>> list = statisticsService.selectCategory();
		
		JSONArray jsonList = new JSONArray();
		
		for(Map<String, Object> m : list) {
			JSONObject json = new JSONObject();
			for(Map.Entry<String, Object> entry : m.entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();
				
				json.put(key, value);
			}
			
			jsonList.put(json);
		}
		
		return jsonList.toString();
	}
	
	@ResponseBody
	@GetMapping(value="/statistics/allCategory", produces = "application/json; charset=UTF-8")
	public String getAllCateList(){
		List<Map<String, Object>> list = statisticsService.selectAllCateStatic();
		
		JSONArray jsonList = new JSONArray();
		
		for(Map<String, Object> m : list) {
			JSONObject json = new JSONObject();
			for(Map.Entry<String, Object> entry : m.entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();
				
				json.put(key, value);
			}
			
			jsonList.put(json);
		}
		
		return jsonList.toString();
	}
	
	@GetMapping("/statistics/categoryList")
	public String cateChart() {
		log.info("chartChart() 실행...");
		
		return "admin/statistics/category";
	}
	
}
