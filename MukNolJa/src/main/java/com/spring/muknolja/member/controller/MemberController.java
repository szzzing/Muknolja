package com.spring.muknolja.member.controller;

import javax.servlet.http.HttpSession;

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
		System.out.println("�α��� ó��");
		return "login";
	}
	@RequestMapping(value = "login.me", method = RequestMethod.POST)
	public String login(Member m, Model model, HttpSession session) {
		System.out.println(m);
		System.out.println(m.getPwd());
		Member loginUser = mService.login(m);
		System.out.println(loginUser);
		System.out.println(bcrypt);
		String encPwd = bcrypt.encode(m.getPwd());
		System.out.println(encPwd);
		if (bcrypt.matches(m.getPwd(), loginUser.getPwd())) {
			session.setAttribute("loginUser", loginUser);
			return "redirect:home.do";

		} else {
		return "myInfo";
		}
		
		
	}
	// �α׾ƿ� 2
		@RequestMapping("logout.me")
		public String logout(HttpSession session) {
			session.removeAttribute("loginUser");
			return "redirect:home.do";
		}
	
}
