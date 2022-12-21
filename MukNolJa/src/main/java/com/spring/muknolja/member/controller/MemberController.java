package com.spring.muknolja.member.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

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

import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.common.model.vo.Pagination;
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
		Member loginUser = mService.login(m);

		String encPwd = bcrypt.encode(m.getPwd());

		if (bcrypt.matches(m.getPwd(), loginUser.getPwd())) {
			session.setAttribute("loginUser", loginUser);
			
			if(loginUser.getMemberType().equals("A")) {
				ArrayList<Member> today = mService.selectVisitToday();
				ArrayList<Map<String, Integer>> visitList = mService.selectVisitList();
				
				model.addAttribute("today", today);
				model.addAttribute("visitList", visitList);
				
				return "adminPage";
			}
			return "redirect:home.do";

		} else {
		return "myInfo";
		}
		
		
	}
	// �α׾ƿ� 2
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
			if(gender.trim().equals("성별")) {
				m.setGender(null);	
			}else if(gender.trim().equals("남자")) {
				m.setGender("M");	
			}else if(gender.trim().equals("여자")) {
				m.setGender("F");	
			}
			
			System.out.println("����" + m);
			String encPwd = bcrypt.encode(m.getPwd());

			m.setPwd(encPwd);
			int result = mService.insertMember(m);
			System.out.println("����" + result);
			if (result > 0) {
				return "login";
			} else {
				return "home";
			}
			
			
		}
		@RequestMapping("pra.me")
		public String prao() {
			return"pra";
		}
		@RequestMapping("findId.me")
		public String findid() {
			return"findId";
		}
		
		@RequestMapping("adminPage.me")
		public String adminPage(Model model) {
			ArrayList<Member> today = mService.selectVisitToday();
			ArrayList<Map<String, Integer>> visitList = mService.selectVisitList();
			
			model.addAttribute("today", today);
			model.addAttribute("visitList", visitList);
			
			return "adminPage";
		}
		
		@RequestMapping("memberManagement.me")
		public String memberManagement(@RequestParam(value="page", required=false) Integer page, @RequestParam(value="category", required=false) Integer cate,
									   @RequestParam(value="search", required=false) String search, Model model){
			
			int category = 0;
			if(cate != null && cate > 0 && cate <= 2) {
				category = cate;
			}
			
			int currentPage = 1;
			if(page != null && page > 1) {
				currentPage = page;
			}
			
			ArrayList<Map<String, Integer>> eList = mService.enrollCount();
			
			HashMap<String, Object> map = new HashMap<>();
			map.put("category", category);
			map.put("search", search);
			
			int listCount = mService.memberListCount();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 30);
			
			ArrayList<Member> list = mService.selectMemberList(pi, map);
			
			model.addAttribute("eList", eList);
			model.addAttribute("list", list);
			model.addAttribute("category", category);
			
			return "memberManagement";
		}
		
		@RequestMapping("boardManagement.me")
		public String boardManagement() {
			return "boardManagement";
		}
		
		@RequestMapping("adManagement.me")
		public String adManagement() {
			return "adManagement";
		}
		
		@RequestMapping("waring.me")
		@ResponseBody
		public int waring(@RequestParam("id") String id) {
			int result = mService.waring(id);
			
			return result;
		}
		
		@RequestMapping("stop.me")
		@ResponseBody
		public int stop(@RequestParam("id") String id) {
			int result = mService.stop(id);
			
			return result;
		}
			
}
