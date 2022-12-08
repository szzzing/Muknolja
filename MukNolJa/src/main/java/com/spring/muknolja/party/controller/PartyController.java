package com.spring.muknolja.party.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PartyController {
	
	@RequestMapping("partyList.pa")
	public String partyList() {
		return "partyList";
	}
	
	@RequestMapping("partyDetail.pa")
	public String partyDetail() {
		return "partyDetail";
	}
	
	@RequestMapping("partyWrite.pa")
	public String partyWrtie() {
		return "partyWrite";
	}
}
