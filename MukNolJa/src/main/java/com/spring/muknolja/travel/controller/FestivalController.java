package com.spring.muknolja.travel.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.spring.muknolja.common.exception.CommonException;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.common.model.vo.Pagination;
import com.spring.muknolja.common.model.vo.Reply;
import com.spring.muknolja.travel.model.service.TravelService;
import com.spring.muknolja.travel.model.vo.Travel;

@Controller
public class FestivalController {
	
	@Autowired
	private TravelService tService;
	
	private String serviceKey = "yYiPRe2yVa7guL2Njhvw%2BYtE7ElhOYjn4TqI3gBgD5OUZXhCHXU%2BXYs0vyzWxDH%2FWylixM81RDErIKEfOlZx0Q%3D%3D";
	
	@RequestMapping("festivalList.tr")
	public String travelList(Model model, @RequestParam(value="page", required=false) Integer page, @RequestParam(value="areaCode", required=false) Integer areaCode) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		try {
			int pageNo = currentPage;
			String urlStr;
			
			if(areaCode ==null) {
				urlStr = "http://apis.data.go.kr/B551011/KorService/areaBasedList?serviceKey=" + serviceKey + "&numOfRows=20&pageNo=" + pageNo + "&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=Q&contentTypeId=15";
			}else {
				urlStr = "http://apis.data.go.kr/B551011/KorService/areaBasedList?serviceKey=" + serviceKey + "&numOfRows=20&pageNo=" + pageNo + "&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=Q&contentTypeId=15&areaCode=" + areaCode;
			}
			
			URL url = new URL(urlStr);
			BufferedReader bf;
			String line = "";
			String result = "";
			
			bf = new BufferedReader(new InputStreamReader(url.openStream()));
			
			while((line=bf.readLine())!=null){
                result=result.concat(line);
            }
			
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject)parser.parse(result);
			
			JSONObject parseResponse = (JSONObject)obj.get("response");
			JSONObject parseBody = (JSONObject)parseResponse.get("body");
			JSONObject parseItems = (JSONObject)parseBody.get("items");
			
			JSONArray parseItem = (JSONArray)parseItems.get("item");
			
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
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 20);
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			model.addAttribute("areaCode", areaCode);
			
			bf.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "festivalList";
	}
	
	@RequestMapping("searchFestival.tr")
	public String searchTravel(@RequestParam("searchValue") String searchValue, @RequestParam(value="page", required=false) Integer page, Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		try {
			int pageNo = currentPage;
			String urlStr;
			String keyword = URLEncoder.encode(searchValue, "UTF-8");
			
			urlStr = "http://apis.data.go.kr/B551011/KorService/searchKeyword?serviceKey=" + serviceKey + "&MobileApp=AppTest&MobileOS=ETC&pageNo=" + pageNo + "&numOfRows=20&listYN=Y&&arrange=A&contentTypeId=15&keyword=" + keyword + "&_type=json";
			
			URL url = new URL(urlStr);
			BufferedReader bf;
			String line = "";
			String result = "";
			
			bf = new BufferedReader(new InputStreamReader(url.openStream()));
			
			while((line=bf.readLine())!=null){
                result=result.concat(line);
            }
			
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject)parser.parse(result);
			JSONObject parseResponse = (JSONObject)obj.get("response");
			JSONObject parseBody = (JSONObject)parseResponse.get("body");
			JSONObject parseItems = (JSONObject)parseBody.get("items");
			JSONArray parseItem = (JSONArray)parseItems.get("item");
			
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
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 20);
			
			model.addAttribute("list", list);
			model.addAttribute("pi", pi);
			model.addAttribute("searchValue", searchValue);
			
			bf.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "festivalList";
	}
	
	@RequestMapping("festivalDetail.tr")
	public String travelDetail(@RequestParam("contentId") int contentId, @RequestParam(value="page", required=false) Integer page, Model model) {
		
		try {
			String urlStr = "http://apis.data.go.kr/B551011/KorService/detailCommon?serviceKey=" + serviceKey + "&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&contentId=" + contentId + "&defaultYN=Y&addrinfoYN=Y&mapinfoYN=Y&overviewYN=Y&_type=json";
			URL url = new URL(urlStr);
			BufferedReader bf;
			String line = "";
			String result = "";
			
			bf = new BufferedReader(new InputStreamReader(url.openStream()));
			
			while((line=bf.readLine())!=null) {
				result= result.concat(line);
			}
			
			JSONParser parser = new JSONParser();
			JSONObject obj = (JSONObject)parser.parse(result);
			
			JSONObject parseResponse = (JSONObject)obj.get("response");
			JSONObject parseBody = (JSONObject)parseResponse.get("body");
			JSONObject parseItems = (JSONObject)parseBody.get("items");
			JSONArray parseItem = (JSONArray)parseItems.get("item");
			
			for(int i = 0; i < parseItem.size(); i++) {
				JSONObject feDetail = (JSONObject)parseItem.get(i);
				
				String title = feDetail.get("title").toString();
				String tel = feDetail.get("tel").toString();
				String homePage = feDetail.get("homepage").toString();
				String addr = feDetail.get("addr1").toString();
				String overview = feDetail.get("overview").toString();
				String mapx = feDetail.get("mapx").toString();
				String mapy = feDetail.get("mapy").toString();
				
				model.addAttribute("title", title);
				model.addAttribute("tel", tel);
				model.addAttribute("homePage", homePage);
				model.addAttribute("addr", addr);
				model.addAttribute("overview", overview);
				model.addAttribute("mapx", mapx);
				model.addAttribute("mapy", mapy);
			}
			model.addAttribute("contentId", contentId);
			model.addAttribute("page", page);
			
			
			String urlStr2 = "http://apis.data.go.kr/B551011/KorService/detailImage?serviceKey=" + serviceKey + "&numOfRows=10&pageNo=1&MobileOS=ETC&MobileApp=AppTest&contentId=" + contentId + "&imageYN=Y&subImageYN=Y&_type=json";
			URL url2 = new URL(urlStr2);
			BufferedReader bf2;
			String line2 = "";
			String result2 = "";
			
			bf2 = new BufferedReader(new InputStreamReader(url2.openStream()));
			
			while((line2=bf2.readLine())!=null) {
				result2= result2.concat(line2);
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
			model.addAttribute("tList", tList);
			
			String urlStr3 = "http://apis.data.go.kr/B551011/KorService/detailIntro?serviceKey=" + serviceKey + "&numOfRows=10&pageNo=1&MobileApp=AppTest&MobileOS=ETC&contentId=" + contentId + "&contentTypeId=15&_type=json";
			URL url3 = new URL(urlStr3);
			BufferedReader bf3;
			String line3 = "";
			String result3 = "";
			
			bf3 = new BufferedReader(new InputStreamReader(url3.openStream()));
			
			while((line3=bf3.readLine())!=null) {
				result3= result3.concat(line3);
			}
			
			JSONParser parser3 = new JSONParser();
			JSONObject obj3 = (JSONObject)parser3.parse(result3);
			
			JSONObject parseResponse3 = (JSONObject)obj3.get("response");
			JSONObject parseBody3 = (JSONObject)parseResponse3.get("body");
			JSONObject parseItems3 = (JSONObject)parseBody3.get("items");
			JSONArray parseItem3 = (JSONArray)parseItems3.get("item");
			
			List<String> infoList = new ArrayList<String>();
			for(int i = 0; i < parseItem3.size(); i++) {
				JSONObject feInfo = (JSONObject)parseItem3.get(i);
				
				String agelimit = feInfo.get("agelimit").toString();
				String bookingplace = feInfo.get("bookingplace").toString();
				String discountinfofestival = feInfo.get("discountinfofestival").toString();
				String eventenddate = feInfo.get("eventenddate").toString();
				String eventhomepage = feInfo.get("eventhomepage").toString();
				String eventplace = feInfo.get("eventplace").toString();
				String eventstartdate = feInfo.get("eventstartdate").toString();
				String placeinfo = feInfo.get("placeinfo").toString();
				String playtime = feInfo.get("playtime").toString();
				String program = feInfo.get("program").toString();
				String spendtimefestival = feInfo.get("spendtimefestival").toString();
				String sponsor1 = feInfo.get("sponsor1").toString();
				String sponsor1tel = feInfo.get("sponsor1tel").toString();
				String sponsor2 = feInfo.get("sponsor2").toString();
				String sponsor2tel = feInfo.get("sponsor2tel").toString();
				String usetimefestival = feInfo.get("usetimefestival").toString();
				
				infoList.add(agelimit);
				infoList.add(bookingplace);
				infoList.add(discountinfofestival);
				infoList.add(eventenddate);
				infoList.add(eventhomepage);
				infoList.add(eventplace);
				infoList.add(eventstartdate);
				infoList.add(placeinfo);
				infoList.add(playtime);
				infoList.add(program);
				infoList.add(spendtimefestival);
				infoList.add(sponsor1);
				infoList.add(sponsor1tel);
				infoList.add(sponsor2);
				infoList.add(sponsor2tel);
				infoList.add(usetimefestival);
				
				model.addAttribute("infoList", infoList);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ArrayList<Reply> list = tService.selectReply(contentId);
		int result = tService.countReply(contentId);
		
		model.addAttribute("rlist", list);
		model.addAttribute("replyCount", result);
		return "festivalDetail";
	}
}