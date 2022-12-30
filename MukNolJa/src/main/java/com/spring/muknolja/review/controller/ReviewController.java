package com.spring.muknolja.review.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.member.model.vo.Member;
import com.spring.muknolja.review.model.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService rService;
	
	
	private String serviceKey = "53PIgLInS%2B6lI57LYYEbd%2B4daak52bqwGs1s160gtU3hu09KJjsPN%2FWFFlkkOXi%2BwIrqVdEMUeICmQ0fTXFfZA%3D%3D";
	
	@RequestMapping("reviewList.re")
	public String reviewList() {
		String ul ="private String serviceKey = \"53PIgLInS%2B6lI57LYYEbd%2B4daak52bqwGs1s160gtU3hu09KJjsPN%2FWFFlkkOXi%2BwIrqVdEMUeICmQ0fTXFfZA%3D%3D";
		
		
		return "reviewList";
	}
	@RequestMapping("reviewDetail.re")
	public String reviewDetail() {
		return "reviewDetail";
	}
	@RequestMapping("reviewWrite.me")
	public String enrollH2(Member member, @RequestParam("file")ArrayList<MultipartFile> files, HttpServletRequest request, HttpSession session) {
		System.out.println("나는"+files);
		ArrayList<AttachedFile> list = new ArrayList();
		for(MultipartFile file : files) {
			String fileName = file.getOriginalFilename();
			if(!fileName.equals("")) {
				String fileType = fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase();
				
				if(fileType.equals("png") || fileType.equals("jpg") || fileType.equals("gif") || fileType.equals("jpeg")) {
					String[] returnArr = AttachedFile.saveFile(file, request);
					
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
		return "reviewWrite";
	}
	@RequestMapping("reviewwrite2.re")
	public String reviewWriter2(@RequestParam("contentId") int conetntId, HttpSession session) {
		
		return "reviewList";
		
	}
}
