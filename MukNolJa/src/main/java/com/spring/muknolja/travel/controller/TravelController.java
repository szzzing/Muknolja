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
public class TravelController {
	
	@Autowired
	private TravelService tService;
	
	private String serviceKey = "yYiPRe2yVa7guL2Njhvw%2BYtE7ElhOYjn4TqI3gBgD5OUZXhCHXU%2BXYs0vyzWxDH%2FWylixM81RDErIKEfOlZx0Q%3D%3D";
	
	@RequestMapping("travelList.tr")
	public String travelList(Model model, @RequestParam(value="page", required=false) Integer page, @RequestParam(value="areaCode", required=false) Integer areaCode) {
		
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		try {
			int pageNo = currentPage;
			String urlStr;
			
			if(areaCode ==null) {
				urlStr = "http://apis.data.go.kr/B551011/KorService/areaBasedList?serviceKey=" + serviceKey + "&numOfRows=20&pageNo=" + pageNo + "&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=Q&contentTypeId=12";
			}else {
				urlStr = "http://apis.data.go.kr/B551011/KorService/areaBasedList?serviceKey=" + serviceKey + "&numOfRows=20&pageNo=" + pageNo + "&MobileOS=ETC&MobileApp=AppTest&_type=json&listYN=Y&arrange=Q&contentTypeId=12&areaCode=" + areaCode;
			}
			
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
		return "travelList";
	}
	
	@RequestMapping("searchTravel.tr")
	public String searchTravel(@RequestParam("searchValue") String searchValue, @RequestParam(value="page", required=false) Integer page, Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		try {
			int pageNo = currentPage;
			String urlStr;
			String keyword = URLEncoder.encode(searchValue, "UTF-8");
			
			urlStr = "http://apis.data.go.kr/B551011/KorService/searchKeyword?serviceKey=" + serviceKey + "&MobileApp=AppTest&MobileOS=ETC&pageNo=" + pageNo + "&numOfRows=20&listYN=Y&&arrange=A&contentTypeId=12&keyword=" + keyword + "&_type=json";
			
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

			ArrayList<Travel> list = new ArrayList<Travel>();
			if(!(parseBody.get("items")).toString().equals("")) {
				JSONObject parseItems = (JSONObject)parseBody.get("items");
				JSONArray parseItem = (JSONArray)parseItems.get("item");
				for(Object arr : parseItem) {
					JSONObject tr = (JSONObject)arr;
					System.out.println(tr);
					
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
		
		return "travelList";
	}
	
	@RequestMapping("travelDetail.tr")
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
				JSONObject tDetail = (JSONObject)parseItem.get(i);
				
				String title = tDetail.get("title").toString();
				String tel = tDetail.get("tel").toString();
				String homePage = tDetail.get("homepage").toString();
				String addr = tDetail.get("addr1").toString();
				String overview = tDetail.get("overview").toString();
				String mapx = tDetail.get("mapx").toString();
				String mapy = tDetail.get("mapy").toString();
				
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
			
			String urlStr3 = "http://apis.data.go.kr/B551011/KorService/detailIntro?serviceKey=" + serviceKey + "&numOfRows=10&pageNo=1&MobileApp=AppTest&MobileOS=ETC&contentId=" + contentId + "&contentTypeId=12&_type=json";
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
				JSONObject tInfo = (JSONObject)parseItem3.get(i);
				
				String infocenter = tInfo.get("infocenter").toString();
				String opendate = tInfo.get("opendate").toString();
				String parking = tInfo.get("parking").toString();
				String restdate = tInfo.get("restdate").toString();
				String usetime = tInfo.get("usetime").toString();
				String chkbabycarriage = tInfo.get("chkbabycarriage").toString();
				String chkpet = tInfo.get("chkpet").toString();
				String chkcreditcard = tInfo.get("chkcreditcard").toString();
				String expagerange = tInfo.get("expagerange").toString();
				String expguide = tInfo.get("expguide").toString();
				
				infoList.add(infocenter);
				infoList.add(opendate);
				infoList.add(parking);
				infoList.add(restdate);
				infoList.add(usetime);
				infoList.add(chkbabycarriage);
				infoList.add(chkpet);
				infoList.add(chkcreditcard);
				infoList.add(expagerange);
				infoList.add(expguide);
				
				model.addAttribute("infoList", infoList);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ArrayList<Reply> list = tService.selectReply(contentId);
		int result = tService.countReply(contentId);
		
		model.addAttribute("rlist", list);
		model.addAttribute("replyCount", result);
		return "travelDetail";
	}
	
	@RequestMapping("insertReply.tr")
	@ResponseBody
	public void insertReply(@ModelAttribute Reply r, HttpServletResponse response) {
		int result = tService.insertReply(r);
		ArrayList<Reply> rlist = tService.selectReply(r.getRefBoardId());
		System.out.println(r);
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder();
		GsonBuilder gb2 = gb.setDateFormat("yyyy.MM.dd");
		Gson gson = gb2.create();
		try {
			gson.toJson(rlist, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("deleteReply.tr")
	public String deleteReply(@RequestParam("realDeleteRepId") int replyId, @RequestParam("contentId") int contentId) {
		int result = tService.deleteReply(replyId);
		if(result > 0) {
			return "redirect:travelDetail.tr?contentId=" + contentId;
		}else {
			throw new CommonException("댓글 삭제를 실패하였습니다.");
		}
	}
	
	
	
	
	
	
}