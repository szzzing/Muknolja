package com.spring.muknolja.travel.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.muknolja.common.Pagination;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.travel.model.vo.Travel;

@Controller
public class TravelController {
	
	@RequestMapping("travelList.tr")
	public String travelList(Model model, @RequestParam(value="page", required=false) Integer page) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		try {
			
			String serviceKey = "yYiPRe2yVa7guL2Njhvw%2BYtE7ElhOYjn4TqI3gBgD5OUZXhCHXU%2BXYs0vyzWxDH%2FWylixM81RDErIKEfOlZx0Q%3D%3D";
			int pageNo = currentPage;
//			String keyword = URLEncoder.encode("경복궁", "UTF-8");
//			String urlStr = "http://apis.data.go.kr/B551011/KorService/searchKeyword?serviceKey=" + serviceKey + "&numOfRows=20&pageNo=" + pageNo + "&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=C&keyword=" + keyword;
			String urlStr = "http://apis.data.go.kr/B551011/KorService/areaBasedList?serviceKey=" + serviceKey + "&numOfRows=20&pageNo=" + pageNo + "&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=C&contentTypeId=12";
			
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
			// body로부터 items찾기
			JSONObject parseItems = (JSONObject)parseBody.get("items");
			
			JSONArray parseItem = (JSONArray)parseItems.get("item");
			
			System.out.println();
			System.out.println("--------------------------");
			System.out.println();
			System.out.println(parseBody.get("totalCount"));
			System.out.println();
			System.out.println("--------------------------");
			System.out.println();
			
			ArrayList<Travel> list = new ArrayList<Travel>();
			for(Object arr : parseItem) {
				JSONObject tr = (JSONObject)arr;
				
				Travel travel = new Travel();
				travel.setAddr(tr.get("addr1").toString());
				travel.setContentId(tr.get("contentid").toString());
				travel.setFirstImage(tr.get("firstimage").toString());
				travel.setMapx(tr.get("mapx").toString());
				travel.setMapy(tr.get("mapy").toString());
				travel.setReadCount(tr.get("readcount").toString());
				travel.setTel(tr.get("tel").toString());
				travel.setTitle(tr.get("title").toString());
				
				list.add(travel);
			}
			
			int listCount = Integer.parseInt(String.valueOf(parseBody.get("totalCount")));
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount);
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			
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