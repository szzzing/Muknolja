package com.spring.muknolja.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.spring.muknolja.member.model.service.MemberService;
import com.spring.muknolja.member.model.vo.Member;

@SessionAttributes("loginUser")
@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	
	
	@RequestMapping(value = "loginView.me", method = RequestMethod.GET)
	public String loginView() {
		System.out.println("로그인 처리");
		return "login";
	}
	@RequestMapping(value = "login.me", method = RequestMethod.POST)
	public String login(Member m, Model model) {
		System.out.println(m);
		System.out.println(m.getPwd());
		Member loginUser = mService.login(m);
		System.out.println(loginUser);
		System.out.println(bcrypt);
		String encPwd = bcrypt.encode(m.getPwd());
		System.out.println(encPwd);
		if (bcrypt.matches(m.getPwd(), loginUser.getPwd())) {
			model.addAttribute("loginUser", loginUser);
			return "redirect:home.do";

		} else {
		return "myInfo";
		}
		
		
	}
	// 로그아웃 2
		@RequestMapping("logout.me")
		public String logout(SessionStatus status) {
			status.setComplete();
			return "redirect:home.do";
		}
	
}
