package com.spring.muknolja.party.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.spring.muknolja.common.exception.CommonException;
import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.common.model.vo.Pagination;
import com.spring.muknolja.member.model.vo.Member;
import com.spring.muknolja.party.model.service.PartyService;
import com.spring.muknolja.party.model.vo.Party;

@Controller
public class PartyController {
	
	@Autowired
	private PartyService pService;
	
	@RequestMapping("partyList.pa")
	public String partyList(@RequestParam(value="page", required=true) Integer page, Model model) {
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
		Party p = pService.selectParty(pId);
		if(p != null) {
			model.addAttribute("p", p);
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
	public String updateForm(@RequestParam("partyId") int pId, Model model) {
		Party p = pService.selectParty(pId);
		model.addAttribute("p", p);
		return "updateParty";
	}
	
	@RequestMapping("updateParty.pa")
	public String updateParty(@ModelAttribute Party p, @ModelAttribute AttachedFile af, @RequestParam("firstFile") MultipartFile firstFile, HttpSession session, HttpServletRequest request, Model model) {
		
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
	public String deleteParty(@RequestParam("partyId") int partyId, @RequestParam("fileId") int fileId) {
		
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("partyId", partyId);
		map.put("fileId", fileId);
		
		int result = pService.deleteParty(map);
		
		return "redirect:partyList.pa";
	}
	
	
	
	
	
	
	
}
