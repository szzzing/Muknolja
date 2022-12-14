package com.spring.muknolja.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	// ï¿½Î±×¾Æ¿ï¿½ 2
		@RequestMapping("logout.me")
		public String logout(HttpSession session, SessionStatus status) {
			session.removeAttribute("loginUser");
			status.setComplete();
			return "redirect:home.do";
		}
		
	
		@RequestMapping("loding.me")
		public String loding(@RequestParam("load") String load,@RequestParam("weather") String weather, Model model) {
			System.out.println(load);
			model.addAttribute("load", load);
			System.out.println(weather);
			model.addAttribute("weather", weather);
			return "loading";
		}
		@RequestMapping("enrollE.me")
			public String enrollE() {
				return "enrollE";
			}
		
		@RequestMapping("checkEmail.me")
		@ResponseBody
		
			public String checkEmail(@RequestParam("email")String email) {
			
			int count = mService.checkEmail(email);
			
			String result = count == 0 ? "yes" : "no";
			
			return result;
		}
		
		@RequestMapping("enroll.me")
		public String enroll(@RequestParam("email")String email, Model model) {
			model.addAttribute("email", email);
			return "enroll";
		}
		@RequestMapping("checkId.me")
		@ResponseBody
		public String checkId(@RequestParam("id")String id) {
			int count = mService.checkId(id);
			String result = count == 0 ? "yes" : "no";
			return result;
			
		}
		@RequestMapping("myInfo.me")
		public String myInfo() {
			return"myInfo";
		}
		@RequestMapping("checkNickName.me")
		@ResponseBody
		public String checknickName(@RequestParam("nickName")String nickName) {
			int count = mService.checkNickName(nickName);
			String result = count == 0 ? "yes" : "no";
			return result;
			
		}
		@RequestMapping("insertm.me")
		public String insert(@ModelAttribute Member m, @RequestParam("gender")String gender) {
			System.out.println(gender);
			if(gender.trim().equals("¼ºº°")) {
				m.setGender(null);	
			}else if(gender.trim().equals("³²ÀÚ")) {
				m.setGender("M");	
			}else if(gender.trim().equals("¿©ÀÚ")) {
				m.setGender("F");	
			}
			
			System.out.println("³ª´Â" + m);
			String encPwd = bcrypt.encode(m.getPwd());

			m.setPwd(encPwd);
			int result = mService.insertMember(m);
			System.out.println("¼ıÀÚ" + result);
			if (result > 0) {
				return "login";
			} else {
				return "home";
			}
			
			
		}
}
