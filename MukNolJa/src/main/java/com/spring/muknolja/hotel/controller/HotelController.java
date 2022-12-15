package com.spring.muknolja.hotel.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.muknolja.common.exception.CommonException;
import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.hotel.model.service.HotelService;
import com.spring.muknolja.hotel.model.vo.Hotel;
import com.spring.muknolja.hotel.model.vo.Reservation;
import com.spring.muknolja.hotel.model.vo.Room;
import com.spring.muknolja.member.model.vo.Member;

@Controller
public class HotelController {
	
	@Autowired
	private HotelService hService;
	
	@RequestMapping("hotelList.ho")
	public String hotelList() {
		return "hotelList";
	}
	
	@RequestMapping("hotelDetail.ho")
	public String hotelDetail(@RequestParam("hotelId") int hotelId, Model model) {
		Hotel hotel = hService.selectHotel(hotelId);
		AttachedFile hotelImg = hService.selectHotelImg(hotelId);
		ArrayList<Room> roomArray = hService.selectAllRoom(hotelId);
		ArrayList<AttachedFile> roomThumbnail = new ArrayList<AttachedFile>();
		
		for(Room r : roomArray) {
			AttachedFile thumb = hService.selectRoomThumbnail(r.getRoomId());
			roomThumbnail.add(thumb);
		}
		
		model.addAttribute("hotel", hotel);
		model.addAttribute("hotelImg", hotelImg);
		model.addAttribute("roomArray", roomArray);
		model.addAttribute("roomThumbnail", roomThumbnail);
		return "hotelDetail";
	}
	
	@RequestMapping("writeRoom.ho")
	public String insertRoomView() {
		return "writeRoom";
	}
	
	@RequestMapping("insertRoom.ho")
	public String insertRoom(@ModelAttribute Room r, @RequestParam("roomImg") ArrayList<MultipartFile> files, HttpServletRequest request) {
		
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
		int roomResult = hService.insertRoom(r);
		
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
			System.out.println("�뙆�씪 �쟾�넚 �뿉�윭" + e.getMessage());
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
	public String writeHotel() {
		return "writeHotel";
	}
	
	@RequestMapping("insertHotel.ho")
	public String insertHotel(@ModelAttribute Hotel h, @RequestParam("hotelImg") ArrayList<MultipartFile> files, HttpServletRequest request, HttpSession session) {
		System.out.println("컨트롤러");
		Member m = (Member)session.getAttribute("loginUser");
		
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
		r.setMemberId(m.getId());
		
		Room room = hService.selectRoom(r.getRoomId());
		Hotel hotel = hService.selectHotel(room.getHotelId());
		int currentReservationId = hService.getCurrentReservationId();
		
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
		
		int reservationResult = hService.insertReservation(r);
//		int reserveResult = hService.insertReserve();
		
		model.addAttribute("r", r);
		
		return "successReservation";
	}
}
