package com.spring.muknolja.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController {
	
	@RequestMapping("adminPage.me")
	public String administratorPage() {
		return "adminPage";
	}
}
