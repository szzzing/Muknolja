package com.spring.muknolja.review.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.common.model.vo.Board;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.common.model.vo.Pagination;
import com.spring.muknolja.common.model.vo.Reply;
import com.spring.muknolja.common.model.vo.Report;
import com.spring.muknolja.member.model.vo.Member;
import com.spring.muknolja.review.model.service.ReviewService;

@Controller
public class ReviewController {
	
	@Autowired
	private ReviewService rService;
	
	
	private String serviceKey = "53PIgLInS%2B6lI57LYYEbd%2B4daak52bqwGs1s160gtU3hu09KJjsPN%2FWFFlkkOXi%2BwIrqVdEMUeICmQ0fTXFfZA%3D%3D";
	
	@RequestMapping("reviewList.re")
	public String reviewList(HttpSession session,@RequestParam(value="area", required=false) Integer area,@RequestParam(value="page", required=false) Integer page,Model model) {
		int currentPage = 1;
		if(page!=null) {
			currentPage = page;
			
		}
		System.out.println(area);
		int Sarea = 1;
		if(area!=null) {
			 Sarea = area;
		}
		System.out.println(Sarea);
		if(page!=null) {
			currentPage = page;
		}
		int listCount = rService.getselectBoard(Sarea);
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 12);
		Member m = (Member)session.getAttribute("loginUser");
		ArrayList<Board> board = rService.selectBoard(pi,Sarea);
		model.addAttribute("board",board);
		model.addAttribute("pi",pi);
		return "reviewList";
	}
	@RequestMapping("selectBoardd.re")
	public void selectBoardd(@RequestParam("boardId")int boardId, HttpServletResponse response) {
		int replyCount = rService.CountReply(boardId);
		HashMap<String, Object> map = new HashMap<>();
		map.put("replyCount", replyCount);
				
		ArrayList<Reply> reply1 = rService.selectReply(boardId);
		ArrayList<Reply> reply = new ArrayList<Reply>();
		for(int i = 0; i < reply1.size(); i++) {
			Reply num = reply1.get(i);
			Reply reply11Reply = rService.selectReply1(num);
			reply.add(reply11Reply);
		}
		
		map.put("reply",reply);
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder();
		GsonBuilder gb2 = gb.setDateFormat("yyyy-MM-dd");
		Gson gson = gb2.create();
		try {
			gson.toJson(map, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping("reviewDetail.re")
	public String reviewDetail(@RequestParam ("boardId") int boardId, Model model,HttpSession session,@RequestParam(value="page", required=false) Integer page) {
		Board board = rService.boardDetail(boardId);
		System.out.println(board);
		ArrayList<AttachedFile> img = rService.boardImg(boardId);
		System.out.println(img);
		
		model.addAttribute("board", board);
		
		model.addAttribute("img", img);
		session.setAttribute("image", img);
		int replyCount = rService.CountReply(boardId);
		System.out.println(replyCount);
		HashMap<String, Object> map = new HashMap<>();
		model.addAttribute("replyCount", replyCount);
				
		
		ArrayList<Reply> reply1 = rService.selectReply(boardId);
		System.out.println( reply1);
		ArrayList<Reply> reply = new ArrayList<Reply>();
		for(int i = 0; i < reply1.size(); i++) {
			Reply num = reply1.get(i);
			Reply reply11Reply = rService.selectReply1(num);
			reply.add(reply11Reply);
			System.out.println(1);
		}
		System.out.println("너냐" + reply);
		
		model.addAttribute("reply",reply);
		
		
		
		
		System.out.println(boardId);
		
		
		
		return "reviewDetail";
	}
	@RequestMapping("reviewWrite.re")
	public String enrollH2(Member member,  HttpSession session) {
	
		return "reviewWrite";
	}
	@RequestMapping("reviewWrite2.re")
	public String reviewWriter2(HttpServletRequest request,Board board, HttpSession session,@RequestParam("file")ArrayList<MultipartFile> files) {
		
		Member m = (Member)session.getAttribute("loginUser");
		System.out.println("파일"+files);
		String id = m.getId();
		ArrayList<AttachedFile> list = new ArrayList();
		for(MultipartFile file : files) {
			String fileName = file.getOriginalFilename();
			if(!fileName.equals("")) {
				String fileType = fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase();
				
				if(fileType.equals("png") || fileType.equals("jpg") || fileType.equals("gif") || fileType.equals("jpeg")|| fileType.equals("jfif")) {
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
		for(int i = 0; i < list.size(); i++) {
			AttachedFile a = list.get(i);
			if(i == 0) {
				a.setFileThumbnail("Y");
			} else {
				a.setFileThumbnail("N");
			}
		}
	    board.setBoardWriter(id);
	    System.out.println(board);
	    System.out.println("사진"+list);
	    HashMap<String, Object> map = new HashMap<>();
	    map.put("b", board);
	    map.put("list", list);
		int result = rService.insertBoard(map);
		
		return "redirect:reviewList.re";
		
	}
	@RequestMapping("checkHeart.re")
	@ResponseBody
	public String checkHeart(@RequestParam("boardId")int boardId, @RequestParam("id")String id) {
		System.out.println("돼?"+id);
		System.out.println("boardId");
		return "1";
	}
	@RequestMapping("insertRere.re")
	@ResponseBody
	public String insertRere(@RequestParam("boardId")int boardId, @RequestParam("replyId")int rereplyId,
							@RequestParam("content")String content, HttpSession session, Reply reply) {
		Member m = (Member)session.getAttribute("loginUser");
		String id = m.getId();
		reply.setReplyWriter(id);
		reply.setRefBoardId(boardId);
		reply.setReplyContent(content);
		reply.setRefReplyId(rereplyId);
		
		int result = rService.insertReRe(reply);
		System.out.println(reply);
		return "1";
	}
	
	@RequestMapping("insertReply.re")
	@ResponseBody
	public int insertReply(HttpServletRequest request, HttpServletResponse response,@RequestParam("boardId")int refBoardId,@RequestParam("replyContent")String replyContent,Reply reply, @RequestParam("writer")String replyWriter) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("application/json; charset=UTF-8");
		
		reply.setReplyWriter(replyWriter);
		reply.setReplyContent(replyContent);
		reply.setRefBoardId(refBoardId);
		System.out.println(replyWriter);
		System.out.println(replyContent);
		System.out.println(refBoardId);
		int insert = rService.insertReply(reply);
		
		return insert;
	}

	@RequestMapping("selectRe.re")
	@ResponseBody
	public void selectReReply(@RequestParam("replyId") int refReplyId, HttpServletResponse response) {
		System.out.println(refReplyId);
		ArrayList<Reply> rrList = rService.selectRe(refReplyId);
		System.out.println(rrList);
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder();
		GsonBuilder gb2 = gb.setDateFormat("yyyy-MM-dd");
		Gson gson = gb2.create();
		try {
			gson.toJson(rrList, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@RequestMapping("report.re")
	@ResponseBody
	public int insertReport( @RequestParam("replyId")int replyId,
							@RequestParam("content")String content, @RequestParam("title")String title,
							HttpSession session,Report report) {
		report.setReportContent(content);
		report.setTargetId(replyId);
		report.setReportTitle(title);
		Member m = (Member)session.getAttribute("loginUser");
		String id = m.getId();
		report.setMemberId(id);
		System.out.println(report);
		int result = rService.insertReport(report);
		return result;
		
	}
}
