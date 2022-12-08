package com.spring.muknolja.travel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TravelController {
	
	@RequestMapping("travelList.tr")
	public String travelList() {
		return "travelList";
	}
	
	@RequestMapping("travelDetail.tr")
	public String travelDetail() {
		return "travelDetail";
	}
}
