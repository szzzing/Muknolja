package com.spring.muknolja.review.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.common.model.vo.Board;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.common.model.vo.Pagination;
import com.spring.muknolja.member.model.vo.Member;
import com.spring.muknolja.review.model.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService rService;
	
	
	private String serviceKey = "53PIgLInS%2B6lI57LYYEbd%2B4daak52bqwGs1s160gtU3hu09KJjsPN%2FWFFlkkOXi%2BwIrqVdEMUeICmQ0fTXFfZA%3D%3D";
	
	@RequestMapping("reviewList.re")
	public String reviewList(HttpSession session,@RequestParam(value="page", required=false) Integer page,Model model) {
		int currentPage = 1;
		if(page!=null) {
			currentPage = page;
		}
		int listCount = rService.getselectBoard();
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 12);
		Member m = (Member)session.getAttribute("loginUser");
		ArrayList<Board> board = rService.selectBoard(pi);
		model.addAttribute("board",board);
		 
		return "reviewList";
	}
	@RequestMapping("reviewDetail.re")
	public String reviewDetail() {
		return "reviewDetail";
	}
	@RequestMapping("reviewWrite.re")
	public String enrollH2(Member member,  HttpSession session) {
	
		return "reviewWrite";
	}
	@RequestMapping("reviewWrite2.re")
	public String reviewWriter2(HttpServletRequest request, HttpSession session,@RequestParam("file")ArrayList<MultipartFile> files) {
		System.out.println("나는"+files);
		
		
		return "reviewList";
		
	}
}
