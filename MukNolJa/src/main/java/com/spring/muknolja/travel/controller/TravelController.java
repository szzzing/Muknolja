package com.spring.muknolja.travel.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TravelController {
	
	@RequestMapping("travelList.tr")
	public String travelList(Model model) {
		
		String serviceKey = "yYiPRe2yVa7guL2Njhvw%2BYtE7ElhOYjn4TqI3gBgD5OUZXhCHXU%2BXYs0vyzWxDH%2FWylixM81RDErIKEfOlZx0Q%3D%3D";
		String urlStr = "http://apis.data.go.kr/B551011/KorService/searchKeyword?serviceKey=" + serviceKey + "&MobileApp=AppTest&MobileOS=ETC&pageNo=1&numOfRows=10&listYN=Y&&arrange=A&contentTypeId=12&keyword=%EA%B0%95%EC%9B%90&_type=json";
		
		try {
			URL url = new URL(urlStr);
			BufferedReader bf;
			String line = "";
			String result = "";
			
			// 관광정보 받아오기
			bf = new BufferedReader(new InputStreamReader(url.openStream()));
			
			//버퍼에 있는 정보를 하나의 문자열로 변환
			while((line=bf.readLine())!=null){
                result=result.concat(line);
//                System.out.println(result);  // 받아온 데이터를 확인해봅니다.
            }
			
			// Json parser를 만들어 만들어진 문자열 데이터를 객체화
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject)parser.parse(result);
			
			// Top레벨 단계인 response 키를 가지고 데이터 파싱
			JSONObject parseResponse = (JSONObject)obj.get("response");
			// response로부터 body 찾기
			JSONObject parseBody = (JSONObject)parseResponse.get("body");
			System.out.println(parseBody);
			// body로부터 items찾기
			JSONObject parseItems = (JSONObject)parseBody.get("items");
			
			JSONArray parseItem = (JSONArray)parseItems.get("item");
			
			
			JSONObject travel;
			
			for(int i = 0; i < parseItem.size(); i++) {
				travel = (JSONObject)parseItem.get(i);
				model.addAttribute("travel", travel);
			}
			
			bf.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "travelList";
	}
	
	@RequestMapping("travelDetail.tr")
	public String travelDetail() {
		return "travelDetail";
	}
}
