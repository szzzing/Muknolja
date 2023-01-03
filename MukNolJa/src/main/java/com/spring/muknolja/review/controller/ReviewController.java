package com.spring.muknolja.review.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.common.model.vo.Board;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.common.model.vo.Pagination;
import com.spring.muknolja.common.model.vo.Reply;
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
	public String reviewDetail(@RequestParam ("boardId") int boardId, Model model,HttpSession session,@RequestParam(value="page", required=false) Integer page) {
		Board board = rService.boardDetail(boardId);
		ArrayList<AttachedFile> img = rService.boardImg(boardId);
		int replyCount = rService.CountReply(boardId);
		model.addAttribute("board", board);
		model.addAttribute("img", img);
		session.setAttribute("image", img);
		model.addAttribute("replyCount", replyCount);
		int currentPage = 1;
		if(page!=null) {
			currentPage = page;
		}
		int listCount = rService.getselectBoard();
		System.out.println(boardId);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 10);
		ArrayList<Reply> reply = rService.selectReply(pi,boardId);
		
		model.addAttribute("reply",reply);
		return "reviewDetail";
	}
	@RequestMapping("reviewWrite.re")
	public String enrollH2(Member member,  HttpSession session) {
	
		return "reviewWrite";
	}
	@RequestMapping("reviewWrite2.re")
	public String reviewWriter2(HttpServletRequest request,Board board, HttpSession session,@RequestParam("file")ArrayList<MultipartFile> files) {
		System.out.println("나는"+files);
		Member m = (Member)session.getAttribute("loginUser");
		System.out.println(board);
		
		return "redirect:reviewList.re";
		
	}
	@RequestMapping("checkHeart.re")
	@ResponseBody
	public String checkHeart(@RequestParam("boardId")int boardId, @RequestParam("id")String id) {
		System.out.println("돼?"+id);
		System.out.println("boardId");
		return "1";
	}
	
	@RequestMapping("insertReply.re")
	@ResponseBody
	public String insertReply(@RequestParam("boardId")int boardId,@RequestParam("replyContent")String replyContent,Reply reply, @RequestParam("writer")String writer) {
		reply.setReplyWriter(writer);
		reply.setReplyContent(replyContent);
		reply.setRefBoardId(boardId);
		return "1";
	}
}
