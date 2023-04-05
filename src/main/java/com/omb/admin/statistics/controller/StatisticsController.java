package com.omb.admin.statistics.controller;

import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.omb.admin.statistics.service.StatisticsService;
import com.omb.admin.vo.AdminVO;

import lombok.Setter;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping(value = "/admin/*")
@Slf4j
public class StatisticsController {

	@Setter(onMethod_ = @Autowired)
	private StatisticsService statisticsService;

	@ResponseBody
	@GetMapping(value = "/statistics/category", produces = "application/json; charset=UTF-8")
	public String getCateList() {

		List<Map<String, Object>> list = statisticsService.selectCategory();

		JSONArray jsonList = new JSONArray();

		for (Map<String, Object> m : list) {
			JSONObject json = new JSONObject();
			for (Map.Entry<String, Object> entry : m.entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();

				json.put(key, value);
			}

			jsonList.put(json);
		}

		return jsonList.toString();
	}

	@ResponseBody
	@GetMapping(value = "/statistics/allCategory", produces = "application/json; charset=UTF-8")
	public String getAllCateList() {
		List<Map<String, Object>> list = statisticsService.selectAllCateStatic();

		JSONArray jsonList = new JSONArray();

		for (Map<String, Object> m : list) {
			JSONObject json = new JSONObject();
			for (Map.Entry<String, Object> entry : m.entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();

				json.put(key, value);
			}

			jsonList.put(json);
		}

		return jsonList.toString();
	}

	@GetMapping("/statistics/categoryList")
	public String cateChart(@ModelAttribute AdminVO admin, Model model) {
		log.info("chartChart() 실행...");
		admin = (AdminVO)model.getAttribute("adminLogin");
		return "admin/statistics/category";
	}

	@ResponseBody
	@GetMapping(value = "/statistics/product", produces = "application/json; charset=UTF-8")
	public String getProductList() {
		JSONArray jsonList = new JSONArray();
		List<Map<String, Integer>> list = statisticsService.selectProduct();
		
		for(Map<String, Integer> m : list) {
			JSONObject json = new JSONObject();
			for(Map.Entry<String, Integer> entry : m.entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();
				
				json.put(key, value);
			}
			jsonList.put(json);
		}
			
		return jsonList.toString();
	}
	
	public static JSONObject mapToJson(Map<String, Integer> map) {
		JSONObject json = new JSONObject();
		for (String key : map.keySet()) {
			Object value = map.get(key);
			json.put(key, value);
		}
		return json;
	}

	@ResponseBody
	@GetMapping(value = "/statistics/productAmount", produces = "application/json; charset=UTF-8")
	public String getProductAmountList() {
		List<Map<String, Integer>> list = statisticsService.selectAmount();

		JSONArray jsonList = new JSONArray();
		for (Map<String, Integer> m : list) {
			JSONObject json = new JSONObject();
			for (Map.Entry<String, Integer> entry : m.entrySet()) {
				String key = entry.getKey();
				Object value = entry.getValue();
				json.put(key, value);
			}
			jsonList.put(json);
			
		}

		return jsonList.toString();
	}

	@GetMapping("/statistics/productList")
	public String productChart(@ModelAttribute AdminVO admin, Model model) {
		log.info("productChart() 실행");
		admin = (AdminVO)model.getAttribute("adminLogin");
		return "admin/statistics/product";
	}
	
	@ResponseBody
	@GetMapping(value="/statistics/tradeLocal", produces="application/json; charset=UTF-8")
	public String getTradeLocal() {
		List<Map<String, Object>> list= statisticsService.selectLocal();
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
	
	@GetMapping("/statistics/localList")
	public String localChart(@ModelAttribute AdminVO admin, Model model) {
		log.info("localChart() 실행...");
		admin = (AdminVO)model.getAttribute("adminLogin");
		return "admin/statistics/local";
	}
}
