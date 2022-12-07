package com.spring.muknolja.hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HotelController {
	
	@RequestMapping("hotelList.ho")
	public String hotelList() {
		return "hotelList";
	}
	
	@RequestMapping("writeRoom.ho")
	public String insertRoomView() {
		return "writeRoom";
	}
	
	@RequestMapping("insertRoom.ho")
	public String insertRoom() {
		return null;
	}
}
