package com.spring.muknolja.hotel.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.spring.muknolja.common.exception.CommonException;
import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.hotel.model.service.HotelService;
import com.spring.muknolja.hotel.model.vo.Hotel;
import com.spring.muknolja.hotel.model.vo.LikeHotel;
import com.spring.muknolja.hotel.model.vo.Review;
import com.spring.muknolja.hotel.model.vo.Reservation;
import com.spring.muknolja.hotel.model.vo.Reserve;
import com.spring.muknolja.hotel.model.vo.ReserveDate;
import com.spring.muknolja.hotel.model.vo.Room;
import com.spring.muknolja.member.model.vo.Member;

@Controller
public class HotelController {
	
	@Autowired
	private HotelService hService;
	
	@RequestMapping("hotelAdmin.ho")
	public String hotelAdmin(HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		if(m.getMemberType().equals("H")) {
			Hotel hotel = hService.selectHotelbyId(m.getId());
			model.addAttribute("hotel", hotel);
			
			return "hotelAdmin";
		} else {
			throw new CommonException("호텔 사업자가 아닙니다.");
		}
	}
	
	@RequestMapping("hotelList.ho")
	public String hotelList() {
		return "hotelList";
	}
	
	@RequestMapping("hotelDetail.ho")
	public String hotelDetail(@RequestParam("hotelId") int hotelId, HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		
		Hotel hotel = hService.selectHotel(hotelId);
		AttachedFile hotelImg = hService.selectHotelImg(hotelId);
		ArrayList<Room> roomArray = hService.selectAllRoom(hotelId);
		ArrayList<AttachedFile> roomThumbnail = hService.selectAllRoomThumbnail(hotelId);
		
		if(m!=null) {
			LikeHotel l = new LikeHotel();
			l.setId(m.getId());
			l.setHotelId(hotel.getHotelId());
			
			int isLikeHotel = hService.isLikeHotel(l);
			model.addAttribute("isLikeHotel", isLikeHotel);
		}
		
		model.addAttribute("hotel", hotel);
		model.addAttribute("hotelImg", hotelImg);
		model.addAttribute("roomArray", roomArray);
		model.addAttribute("roomThumbnail", roomThumbnail);
		return "hotelDetail";
	}
	
	// 작성 가능한 리뷰
	@RequestMapping("writableReview.ho")
	@ResponseBody
	public void reviewWaiting(HttpServletResponse response, @RequestParam("id") String id, @RequestParam("hotelId") int hotelId) {
		
		ArrayList<Reservation> reservationList = new ArrayList<Reservation>();
		HashMap map = new HashMap();
		map.put("memberId", id);
		map.put("hotelId", hotelId);
		reservationList = hService.writableReview(map);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new Gson();
		GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy.MM.dd");
		gson = gb.create();
		
		try {
			gson.toJson(reservationList, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	//리뷰 전체보기
	@RequestMapping(value="reviewList.ho", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void reviewList(@RequestParam("hotelId") int hotelId, HttpServletResponse response) {
		HashMap map = new HashMap();

		ArrayList<Review> reviewList = hService.selectReviewList(hotelId);
		int reviewCount = hService.selectReviewCount(hotelId);
		int avgRating = hService.selectAvgRating(hotelId);
		
		map.put("reviewList", reviewList);
		map.put("reviewCount", reviewCount);
		map.put("avgRating", avgRating);
		
		response.setContentType("application/json; charset=UTF-8");
		Gson gson = new Gson();
		GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy.MM.dd");
		gson = gb.create();
		
		try {
			gson.toJson(map, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping(value="insertReview.ho", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void insertReview(@ModelAttribute Review review) {
		int result = hService.insertReview(review);
	}
	
	@RequestMapping("writeRoom.ho")
	public String writeRoom(HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		if(!m.getMemberType().equals("H")) {
			throw new CommonException("사업자 회원이 아닙니다.");
		}
		
		Hotel hotel = hService.selectHotelbyId(m.getId());
		model.addAttribute("hotel", hotel);
		return "writeRoom";
	}
	
	@RequestMapping("insertRoom.ho")
	public String insertRoom(@ModelAttribute Room r, @RequestParam("roomImg") ArrayList<MultipartFile> files, HttpSession session, HttpServletRequest request) {
		Member m = (Member)session.getAttribute("loginUser");
		
		int roomResult = hService.insertRoom(r);
		
		ArrayList<AttachedFile> list = new ArrayList();
		for(MultipartFile file : files) {
			String fileName = file.getOriginalFilename();
			if(!fileName.equals("")) {
				String fileType = fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase();
				
				if(fileType.equals("png") || fileType.equals("jpg") || fileType.equals("gif") || fileType.equals("jpeg")) {
					String[] returnArr = saveFile(file, request);
					
					if(returnArr[1] != null) {
						AttachedFile attm = new AttachedFile();
						attm.setFileName(file.getOriginalFilename());
						attm.setFileModifyName(returnArr[1]);
						attm.setFileLink(returnArr[0]);
						
						list.add(attm);
					}
				}
			}
		}
		
		for(int i = 0; i < list.size(); i++) {
			AttachedFile a = list.get(i);
			if(i == 0) {
				a.setFileThumbnail("Y");
			} else {
				a.setFileThumbnail("N");
			}
			a.setFileType("H");
		}
		
		int attmResult = 0;
		
		if(!list.isEmpty()) {
			attmResult = hService.insertRoomAttm(list);
		}
		
		if(roomResult + attmResult == list.size()*2+1) {
			return "hotelList";
		} else {
			for(AttachedFile a : list) {
				deleteFile(a.getFileModifyName(), request);
			}
			throw new CommonException("객실 등록 실패");
		}
	}
	
	private String[] saveFile(MultipartFile file, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		
		File folder = new File(savePath);
		if(!folder.exists()) {
			folder.mkdir();
		}
		
		String uuid = UUID.randomUUID().toString();

		String originFileName = file.getOriginalFilename();
		String renameFileName = uuid + originFileName.substring(originFileName.lastIndexOf("."));
		
		String renamePath = folder + "\\" + renameFileName;
		
		try {
			file.transferTo(new File(renamePath));
		} catch (Exception e) {
			System.out.println("파일 업로드 실패" + e.getMessage());
		}
		
		String[] returnArr = new String[2];
		returnArr[0] = savePath;
		returnArr[1] = renameFileName;
		
		return returnArr;
	}
	
	public void deleteFile(String fileName, HttpServletRequest request) {
		String root = request.getSession().getServletContext().getRealPath("resources");
		String savePath = root + "\\uploadFiles";
		
		File f = new File(savePath + "\\" + fileName);
		if(f.exists()) {
			f.delete();
		}
	}
	
	@RequestMapping("writeHotel.ho")
	public String writeHotel(HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		if(!m.getMemberType().equals("H")) {
			throw new CommonException("사업자 회원이 아닙니다.");
		}
		return "writeHotel";
	}
	
	@RequestMapping("insertHotel.ho")
	public String insertHotel(@ModelAttribute Hotel h, @RequestParam("hotelImg") ArrayList<MultipartFile> files, HttpServletRequest request, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		
		h.setEntId(m.getId());
		
		ArrayList<AttachedFile> list = new ArrayList();
		for(MultipartFile file : files) {
			String fileName = file.getOriginalFilename();
			if(!fileName.equals("")) {
				String fileType = fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase();
				
				if(fileType.equals("png") || fileType.equals("jpg") || fileType.equals("gif") || fileType.equals("jpeg")) {
					String[] returnArr = saveFile(file, request);
					
					if(returnArr[1] != null) {
						AttachedFile attm = new AttachedFile();
						attm.setFileName(file.getOriginalFilename());
						attm.setFileModifyName(returnArr[1]);
						attm.setFileLink(returnArr[0]);
						
						list.add(attm);
					}
				}
			}
		}
		
		for(int i = 0; i < list.size(); i++) {
			AttachedFile a = list.get(i);
			if(i == 0) {
				a.setFileThumbnail("Y");
			} else {
				a.setFileThumbnail("N");
			}
			a.setFileType("H");
		}
		
		int attmResult = 0;
		int hotelResult = hService.insertHotel(h);
		
		if(!list.isEmpty()) {
			attmResult = hService.insertHotelAttm(list);
		}
		
		if(hotelResult + attmResult == list.size()*2+1) {
			return "hotelList";
		} else {
			for(AttachedFile a : list) {
				deleteFile(a.getFileModifyName(), request);
			}
			throw new CommonException("호텔 등록 실패");
		}
	}
	
	@RequestMapping("writeReservation.ho")
	public String writeReservation(@ModelAttribute Reservation r, Model model, HttpSession session) {
		
		Member m = (Member)session.getAttribute("loginUser");
		if(!m.getMemberType().equals("H")) {
			throw new CommonException("사업자 회원이 아닙니다.");
		}
		r.setMemberId(m.getId());
		
		Room room = hService.selectRoom(r.getRoomId());
		Hotel hotel = hService.selectHotel(room.getHotelId());
		int currentReservationId = hService.getCurrentReservationId();
		
		int dates = ReserveDate.dateDif(r.getCheckinDate(), r.getCheckoutDate());
		r.setPaymentAmount((room.getRoomPrice())*dates);
		
		model.addAttribute("hotel", hotel);
		model.addAttribute("room", room);
		model.addAttribute("r", r);
		model.addAttribute("currentReservationId", currentReservationId);
		
		return "writeReservation";
	}
	
	@RequestMapping(value="insertReservation.ho")
	public String insertReservation(@ModelAttribute Reservation r, Model model, HttpSession session) {
		Member m = (Member)session.getAttribute("loginUser");
		r.setMemberId(m.getId());
		
		// Reserve 테이블 삽입
		ArrayList<Reserve> list = new ArrayList();
		int dates = ReserveDate.dateDif(r.getCheckinDate(), r.getCheckoutDate());
		
		for(int i=0;i<dates;i++) {
			Date d = ReserveDate.datePlus(r.getCheckinDate(), i);
			Reserve reserve = new Reserve();
			reserve.setReservationDate(d);
			reserve.setRoomId(r.getRoomId());
			
			list.add(reserve);
		}
		
		HashMap map = new HashMap();
		map.put("r", r);
		map.put("list", list);
		
		int reservationResult = hService.insertReservation(map);
		
		model.addAttribute("r", r);
		
		return "successReservation";
	}
	
	@RequestMapping(value="insertLikeHotel.ho", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void insertLikeHotel(@ModelAttribute LikeHotel l) {
		int result = hService.insertLikeHotel(l);
	}
	
	@RequestMapping(value="deleteLikeHotel.ho", produces="application/json; charset=UTF-8")
	@ResponseBody
	public void deleteLikeHotel(@ModelAttribute LikeHotel l) {
		int result = hService.deleteLikeHotel(l);
	}
}
