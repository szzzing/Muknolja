package com.spring.muknolja.hotel.controller;

import java.io.File;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.hotel.model.vo.Room;

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
	
//	@RequestMapping("insertRoom.ho")
//	public String insertRoom(@ModelAttribute Room r, @RequestParam("file") ArrayList<MultipartFile> files, HttpServletRequest request) {
//		
//	}
}
