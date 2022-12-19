package com.spring.muknolja.travel.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.common.model.vo.Pagination;
import com.spring.muknolja.travel.model.vo.Travel;

@Controller
public class TravelController {
	
	private String serviceKey = "yYiPRe2yVa7guL2Njhvw%2BYtE7ElhOYjn4TqI3gBgD5OUZXhCHXU%2BXYs0vyzWxDH%2FWylixM81RDErIKEfOlZx0Q%3D%3D";
	
	@RequestMapping("travelList.tr")
	public String travelList(Model model, @RequestParam(value="page", required=false) Integer page) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		try {
			int pageNo = currentPage;
//			String keyword = URLEncoder.encode("경복궁", "UTF-8");
//			String urlStr = "http://apis.data.go.kr/B551011/KorService/searchKeyword?serviceKey=" + serviceKey + "&numOfRows=20&pageNo=" + pageNo + "&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=C&keyword=" + keyword;
			String urlStr = "http://apis.data.go.kr/B551011/KorService/areaBasedList?serviceKey=" + serviceKey + "&numOfRows=20&pageNo=" + pageNo + "&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=Q&contentTypeId=12";
			
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
	public String travelDetail(@RequestParam("contentId") String contentId, @RequestParam(value="page", required=false) Integer page, @RequestParam("mapx") String mapx, @RequestParam("mapy") String mapy, Model model) {
		
		try {
			String urlStr = "http://apis.data.go.kr/B551011/KorService/detailCommon?serviceKey=" + serviceKey + "&contentId=" + contentId + "&defaultYN=Y&addrinfoYN=Y&overviewYN=Y&MobileOS=ETC&MobileApp=AppTest&_type=json";
			URL url = new URL(urlStr);
			BufferedReader bf;
			String line = "";
			String result = "";
			
			bf = new BufferedReader(new InputStreamReader(url.openStream()));
			
			while((line=bf.readLine())!=null) {
				result= result.concat(line);
				System.out.println(result);
			}
			
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject)parser.parse(result);
			
			JSONObject parseResponse = (JSONObject)obj.get("response");
			JSONObject parseBody = (JSONObject)parseResponse.get("body");
			JSONObject parseItems = (JSONObject)parseBody.get("items");
			JSONArray parseItem = (JSONArray)parseItems.get("item");
			
			for(int i = 0; i < parseItem.size(); i++) {
				JSONObject tDetail = (JSONObject)parseItem.get(i);
				
				String title = tDetail.get("title").toString();
				String tel = tDetail.get("tel").toString();
				String homePage = tDetail.get("homepage").toString();
				String addr = tDetail.get("addr1").toString();
				String overview = tDetail.get("overview").toString();
				
				model.addAttribute("title", title);
				model.addAttribute("tel", tel);
				model.addAttribute("homePage", homePage);
				model.addAttribute("addr", addr);
				model.addAttribute("overview", overview);
			}
			model.addAttribute("contentId", contentId);
			model.addAttribute("mapx", mapx);
			model.addAttribute("mapy", mapy);
			model.addAttribute("page", page);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		try {
			String urlStr2 = "http://apis.data.go.kr/B551011/KorService/detailImage?serviceKey=" + serviceKey + "&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&contentId=" + contentId + "&imageYN=Y&subImageYN=Y&_type=json";
			URL url2 = new URL(urlStr2);
			BufferedReader bf;
			String line2 = "";
			String result2 = "";
			
			bf = new BufferedReader(new InputStreamReader(url2.openStream()));
			
			while((line2=bf.readLine())!=null) {
				result2= result2.concat(line2);
				System.out.println(result2);
			}
			
			JSONParser parser2 = new JSONParser();
			JSONObject obj2 = (JSONObject)parser2.parse(result2);
			
			JSONObject parseResponse2 = (JSONObject)obj2.get("response");
			JSONObject parseBody2 = (JSONObject)parseResponse2.get("body");
			JSONObject parseItems2 = (JSONObject)parseBody2.get("items");
			JSONArray parseItem2 = (JSONArray)parseItems2.get("item");
			
			List<String> tList = new ArrayList<String>();
			for(int i = 0; i < parseItem2.size(); i++) {
				JSONObject tPhoto = (JSONObject)parseItem2.get(i);
				String originPhoto = tPhoto.get("originimgurl").toString();
				tList.add(originPhoto);
			}
//			model.addAttribute("tList", tList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "travelDetail";
	}
}