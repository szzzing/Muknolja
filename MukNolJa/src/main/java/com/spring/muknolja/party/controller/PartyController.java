package com.spring.muknolja.party.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;

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
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.common.model.vo.Pagination;
import com.spring.muknolja.common.model.vo.Reply;
import com.spring.muknolja.member.model.vo.Member;
import com.spring.muknolja.party.model.service.PartyService;
import com.spring.muknolja.party.model.vo.Party;

@Controller
public class PartyController {
	
	@Autowired
	private PartyService pService;
	
	@RequestMapping("partyList.pa")
	public String partyList(@RequestParam(value="page", required=false) Integer page, Model model) {
		int currentPage = 1;
		if(page != null) {
			currentPage = page;
		}
		
		int listCount = pService.getListCount();
		
		PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 8);
		
		ArrayList<Party> pList = pService.selectPartyList(pi);
		
		if(pList != null) {
			model.addAttribute("pi", pi);
			model.addAttribute("pList", pList);
			return "partyList";
		}else {
			throw new CommonException("동행리스트 조회에 실패하였습니다.");
		}
	}
	
	@RequestMapping("selectParty.pa")
	public String partyDetail(@RequestParam("pId") int pId, @RequestParam(value="writer", required=false) String writer, HttpSession session, Model model) {
		Member m = (Member)session.getAttribute("loginUser");
		Party p = pService.selectParty(pId);
		ArrayList<Reply> rList = pService.selectReply(pId);
		int result = pService.countReply(pId);
		int partyCount = pService.countParty(pId);
		int checkParty = 0;
		
		if(m != null) {
			HashMap<String, Object> map = new HashMap<String, Object>();
			map.put("boardId", pId);
			map.put("memberId", ((Member)session.getAttribute("loginUser")).getId());
			checkParty = pService.checkParty(map);
		}
		
		if(p != null) {
			model.addAttribute("p", p);
			model.addAttribute("rList", rList);
			model.addAttribute("replyCount", result);
			model.addAttribute("partyCount", partyCount);
			model.addAttribute("checkParty", checkParty);
			return "partyDetail";
		}else {
			throw new CommonException("동행 상세보기 조회에 실패하였습니다.");
		}
	}
	
	@RequestMapping("partyWrite.pa")
	public String partyWrtie() {
		return "partyWrite";
	}
	
	@RequestMapping("insertParty.pa")
	public String insertParty(HttpSession session, HttpServletRequest request, @ModelAttribute Party p, @ModelAttribute AttachedFile af, @RequestParam("firstFile") MultipartFile firstFile) {
		String boardWriter = ((Member)session.getAttribute("loginUser")).getId();
		p.setPartyWriter(boardWriter);
		
		if(!firstFile.getOriginalFilename().equals("")) {
			String[] returnArr = AttachedFile.saveFile(firstFile, request);
			
			if(returnArr[1] != null) {
				af.setFileName(firstFile.getOriginalFilename());
				af.setFileModifyName(returnArr[1]);
				af.setFileLink(returnArr[0]);
			}
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("p", p);
		map.put("af", af);
		
		int result = pService.insertBoard(map);
		
		if(result > 0) {
			return "redirect:partyList.pa";
		}else {
			throw new CommonException("동행게시판 입력에 실패하였습니다.");
		}
	}
	
	@RequestMapping("updateForm.pa")
	public String updateForm(@RequestParam("partyId") int pId,@RequestParam("nowParticipate") int nowParticipate, Model model) {
		Party p = pService.selectParty(pId);
		p.setNowParticipate(nowParticipate);
		model.addAttribute("p", p);
		return "updateParty";
	}
	
	@RequestMapping("updateParty.pa")
	public String updateParty(@ModelAttribute Party p, @ModelAttribute AttachedFile af, @RequestParam(value="firstFile", required=false) MultipartFile firstFile, HttpSession session, HttpServletRequest request, Model model) {
		
		if(!firstFile.getOriginalFilename().equals("")) {
			String[] returnArr = AttachedFile.saveFile(firstFile, request);
			
			if(returnArr[1] != null) {
				af.setFileName(firstFile.getOriginalFilename());
				af.setFileModifyName(returnArr[1]);
				af.setFileLink(returnArr[0]);
			}
		}
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("p", p);
		map.put("af", af);
		
		int result = pService.updateParty(map);
		
		if(result > 2) {
			model.addAttribute("pId", p.getPartyId());
			model.addAttribute("writer", ((Member)session.getAttribute("loginUser")).getNickName());
			return "redirect:selectParty.pa";
		}else {
			throw new CommonException("동행게시판 수정에 실패하였습니다.");
		}
	}
	
	@RequestMapping("deleteParty.pa")
	public String deleteParty(@RequestParam("partyId") int partyId, @RequestParam("fileId") int fileId, @RequestParam(value="managerCheck", required = true) int check) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("partyId", partyId);
		map.put("fileId", fileId);
		
		int result = pService.deleteParty(map);
		
		if(check == 0) {
			return "redirect:memberManagement.me";
		} else {
			return "redirect:partyList.pa";
		}
	}
	
	@RequestMapping("insertReply.pa")
	public void insertReply(@ModelAttribute Reply r, HttpServletResponse response) {
		int result = pService.insertReply(r);
		ArrayList<Reply> rList = pService.selectReply(r.getRefBoardId());
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder();
		GsonBuilder gb2 = gb.setDateFormat("yyyy.MM.dd");
		Gson gson = gb2.create();
		try {
			gson.toJson(rList, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("selectReReply.pa")
	public void selectReReply(@RequestParam("refReplyId") int refReplyId, HttpServletResponse response) {
		ArrayList<Reply> rrList = pService.selectReReply(refReplyId);
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder();
		GsonBuilder gb2 = gb.setDateFormat("yyyy.MM.dd");
		Gson gson = gb2.create();
		try {
			gson.toJson(rrList, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	@RequestMapping("insertReReply.pa")
	public void insertReReply(@ModelAttribute Reply r, HttpServletResponse response) {
		int result = pService.insertReReply(r);
		ArrayList<Reply> rrList = pService.selectReReply(r.getRefReplyId());
		response.setContentType("application/json; charset=UTF-8");
		GsonBuilder gb = new GsonBuilder();
		GsonBuilder gb2 = gb.setDateFormat("yyyy.MM.dd");
		Gson gson = gb2.create();
		try {
			gson.toJson(rrList, response.getWriter());
		} catch (JsonIOException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	@RequestMapping("deleteReply.pa")
	public String deleteReply(@RequestParam("realDeleteRepId") int replyId, @RequestParam("partyId") int partyId, @RequestParam("writer") String writer) {
		int result = pService.deleteReply(replyId);
		if(result > 0) {
			return "redirect:selectParty.pa?pId=" + partyId + "&writer=" + writer;
		}else {
			throw new CommonException("댓글 삭제를 실패하였습니다.");
		}
	}
	
	@RequestMapping(value="participate.pa", produces="application/text;charset=UTF-8")
	@ResponseBody
	public String participate(@RequestParam("boardId") int boardId, @RequestParam("memberId") String memberId) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("boardId", boardId);
		map.put("memberId", memberId);
		
		int checkParty = pService.checkParty(map);
		
		if(checkParty == 0) {
			pService.participate(map);
		}
		
		int partyCount = pService.countParty(boardId);
		
		return partyCount + "";
	}
	
	@RequestMapping(value="deleteParticipate.pa", produces="application/text;charset=UTF-8")
	@ResponseBody
	public String deleteParticipate(@RequestParam("boardId") int boardId, @RequestParam("memberId") String memberId, Model model) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("boardId", boardId);
		map.put("memberId", memberId);
		
		int checkParty = pService.checkParty(map);
		
		if(checkParty == 1) {
			pService.deleteParticipate(map);
		}
		
		int partyCount = pService.countParty(boardId);
		
		model.addAttribute(checkParty);
		
		return partyCount + "";
	}
	
	
	
}
