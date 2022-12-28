package com.spring.muknolja.member.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonIOException;
import com.spring.muknolja.common.model.vo.AD;
import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.common.model.vo.Board;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.common.model.vo.Pagination;
import com.spring.muknolja.common.model.vo.QA;
import com.spring.muknolja.hotel.model.vo.Hotel;
import com.spring.muknolja.hotel.model.vo.LikeHotel;
import com.spring.muknolja.hotel.model.vo.Reservation;
import com.spring.muknolja.hotel.model.vo.Reserve;
import com.spring.muknolja.member.model.service.MemberService;
import com.spring.muknolja.member.model.vo.Member;
import com.spring.muknolja.party.model.vo.Party;

@SessionAttributes("loginUser")
@Controller
public class MemberController {

	@Autowired
	private MemberService mService;
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@RequestMapping(value = "loginView.me")
	public String loginView(Model model) {
		 
		return "login";
	}
	@RequestMapping(value = "login.me", method = RequestMethod.POST)
	public String login(Member m, Model model, HttpSession session) {
		
		System.out.println(m);
		Member loginUser = mService.login(m);

		String encPwd = bcrypt.encode(m.getPwd());

		
		if(loginUser != null) {
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
				model.addAttribute("noLogin","no");
				return "login";
			}
		}else {
			model.addAttribute("noLogin","no");
			return "login";
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
		@RequestMapping("findId1.me")
		public String findid1() {
			return"findId1";
		}
		@RequestMapping("findId2.me")
		public String findid2(@RequestParam("email")String email,Model model) {
			String id = mService.selectEid(email);
			model.addAttribute("id",id);
			return"findId2";
		}
		@RequestMapping("myInfo1.me")
		public String myInfo1() {
			return "myInfo1";
		}
		@RequestMapping("change.me")
		public String change(@ModelAttribute Member m, Model model, @RequestParam("pwd") String pwd,@RequestParam("id") String idd) {
			m.setId(idd.trim());
			String id = m.getId();
			String password = mService.selectpwd(id);
			if (pwd.trim().equals("")) {
				
				m.setPwd(password);
			} else {
				m.setPwd(bcrypt.encode(pwd));
			}
			int result = mService.updateMember(m);

			if (result > 0) {
				Member loginUser = mService.login(m);
				model.addAttribute("loginUser", loginUser);
				return "redirect:myInfo.me";
			} else {
				return "home.do";
			}

		
			
		}
		@RequestMapping("adminPage.me")
		public String adminPage(Model model) {
			ArrayList<Member> today = mService.selectVisitToday();
			ArrayList<Map<String, Integer>> visitList = mService.selectVisitList();
			ArrayList<Map<String, Integer>> vsitAllList = mService.selectVisitAllList();
			
			model.addAttribute("today", today);
			model.addAttribute("visitList", visitList);
			model.addAttribute("vsitAllList", vsitAllList);
			
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
		public String boardManagement(@RequestParam(value="page", required=false) Integer page, @RequestParam(value="category", required=false) Integer cate,
									  @RequestParam(value="search", required=false) String search, Model model) {
			
			int category = 0;
			if(cate != null && cate > 0 && cate <= 2) {
				category = cate;
			}
			
			int currentPage = 1;
			if(page != null && page > 1) {
				currentPage = page;
			}
			
			HashMap<String, Object> map = new HashMap<>();
			map.put("category", category);
			map.put("search", search);
			
			int listCount = mService.boardListCount();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 30);
			
			ArrayList<Board> bList = mService.selectBoardList(map, pi);
			
			ArrayList<Map<String, Integer>> bCount = mService.bCount();
			
			model.addAttribute("bCount", bCount);
			model.addAttribute("bList", bList);
			model.addAttribute("category", category);
			
			return "boardManagement";
		}
		
		@RequestMapping("adManagement.me")
		public String adManagement(@RequestParam(value="category", required=false) Integer cate, Model model) {
			
			int category = 0;
			if(cate != null && cate > 0 && cate <= 3) {
				category = cate;
			}
			
			ArrayList<AD> aList = mService.selectADList(category);
			
			for(AD a : aList) {
				String boardType = a.getBoardType();
				
				if(boardType.equals("H")) {
					a.setBoardType("호텔");
				} else if(boardType.equals("R")) {
					a.setBoardType("후기");
				} else if(boardType.equals("P")) {
					a.setBoardType("동행");
				} else if(boardType.equals("T")) {
					a.setBoardType("여행");
				}
			}
			
			ArrayList<Map<String, Integer>> incomeCount = mService.incomeCount();
			
			model.addAttribute("aList", aList);
			model.addAttribute("incomeCount", incomeCount);
			model.addAttribute("category", category);
		
			return "adManagement";
		}
		
		@RequestMapping("waring.me")
		@ResponseBody
		public int waring(@RequestParam("id") String id) {
			int result = mService.waring(id);
			
			int waringCheck = mService.waringCheck(id);
			
			if(waringCheck >= 3) {
				stop(id);
			}
			return result;
		}
		
		@RequestMapping("stop.me")
		@ResponseBody
		public int stop(@RequestParam("id") String id) {
			int result = mService.stop(id);
			
			return result;
		}
		@RequestMapping("changePwd.me")
		public String changePwd(@RequestParam("id")String id,Model model) {
			model.addAttribute("id",id);
			return "changePwd";
		}
		
	
		@RequestMapping("changePassword.me")
		public String changePassword(@RequestParam("pwd")String pwd,@RequestParam("id")String id,Member m) {
			m.setId(id);
			m.setPwd(bcrypt.encode(pwd));
			int result = mService.changePassword(m);
			return "login";
		}
		@RequestMapping("enrollH.me")
		public String enrollH() {
			return "enrollH";
		}
		@RequestMapping("enrollH2.me")
		public String enrollH2(Member member, @RequestParam("file")ArrayList<MultipartFile> files, HttpServletRequest request, HttpSession session) {
			
			ArrayList<AttachedFile> list = new ArrayList();
			for(MultipartFile file : files) {
				String fileName = file.getOriginalFilename();
				if(!fileName.equals("")) {
					String fileType = fileName.substring(fileName.lastIndexOf(".")+1).toLowerCase();
					
					if(fileType.equals("png") || fileType.equals("jpg") || fileType.equals("gif") || fileType.equals("jpeg")) {
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
				int attmResult = 0;
			if(!list.isEmpty()) {
				 attmResult = mService.insertsAttm(list);
			}
			
			if(attmResult > 0) {
			return "login";
		}else {
			return "myInfo";
		}
			
		}
		@RequestMapping("myInfoA.me")
		public String myinfoA(HttpSession session,@RequestParam(value="page", required=false) Integer page,Model model) {
			int currentPage = 1;
			if(page!=null) {
				currentPage = page;
			}
			
			Member m = (Member)session.getAttribute("loginUser");
			String id = m.getId();
			int listCount = mService.getListCount(id);
			
			System.out.println(currentPage);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 2);
			model.addAttribute("pi",pi);
			return "myInfoA";		
		}
		
		@RequestMapping("myInfoB.me")
		public String myinfoB(HttpSession session,@RequestParam(value="page", required=false) Integer page,Model model) {
			int currentPage = 1;
			if(page!=null) {
				currentPage = page;
			}
			
			Member m = (Member)session.getAttribute("loginUser");
			String id = m.getId();
			int listCount = mService.getListCount(id);
			
			System.out.println(currentPage);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 2);
			model.addAttribute("pi",pi);
			return "myInfoB";		
		}
		
		@RequestMapping(value="myInfoAA.me", produces="application/json; charset=UTF-8")
		@ResponseBody
		public void myinfoAA(HttpSession session,@RequestParam(value="page", required=false) Integer page, HttpServletResponse response,Model model) {
			Member m = (Member)session.getAttribute("loginUser");
			String id = m.getId();
			int listCount = mService.getListCount2(id);
			int currentPage = 1;
			if(page!=null) {
				currentPage = page;
			}
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 2);
			ArrayList<Hotel> hotel= mService.selectHotel(id,pi);
			System.out.println(hotel);
			
			
			HashMap map = new HashMap();
			map.put("hotel", hotel);
			
			
			response.setContentType("application/json; charset=UTF-8");
			Gson gson = new Gson();
			GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy.MM.dd");
			gson = gb.create();
			
			try {
				gson.toJson(map, response.getWriter());
			} catch (JsonIOException | IOException e) {
				e.printStackTrace();
			}
		}
		@RequestMapping(value="myInfoBB.me", produces="application/json; charset=UTF-8")
		@ResponseBody
		public void myinfoBB(HttpSession session,@RequestParam(value="page", required=false) Integer page, HttpServletResponse response,Model model) {
			Member m = (Member)session.getAttribute("loginUser");
			String id = m.getId();
			int listCount = mService.getListCount(id);
			int currentPage = 1;
			if(page!=null) {
				currentPage = page;
			}
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 5);
			ArrayList<QA> qa= mService.selectQA(id,pi);
			
			
			
			HashMap map = new HashMap();
			map.put("qa", qa);
			
			
			response.setContentType("application/json; charset=UTF-8");
			Gson gson = new Gson();
			GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy.MM.dd");
			gson = gb.create();
			
			try {
				gson.toJson(map, response.getWriter());
			} catch (JsonIOException | IOException e) {
				e.printStackTrace();
			}
		}
		
		@RequestMapping("myInfoC.me")
		public String myinfoC(HttpSession session,@RequestParam(value="page", required=false) Integer page, HttpServletResponse response,Model model) {
			int currentPage = 1;
			if(page!=null) {
				currentPage = page;
			}
			
			Member m = (Member)session.getAttribute("loginUser");
			String id = m.getId();
			int listCount = mService.getListCount4(id);
			
			System.out.println(currentPage);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 2);
			model.addAttribute("pi",pi);
				
			return "myInfoC";		
		}
		@RequestMapping(value="myInfoCC.me", produces="application/json; charset=UTF-8")
		@ResponseBody
		public void myinfoCC(HttpSession session,@RequestParam(value="page", required=false) Integer page, HttpServletResponse response,Model model) {
			Member m = (Member)session.getAttribute("loginUser");
			String id = m.getId();
			System.out.println(page);
			int listCount = mService.getListCount4(id);
			int currentPage = 1;
			if(page!=null) {
				currentPage = page;
			}
			System.out.println(currentPage);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 2);
			
			
			ArrayList<Party> list = mService.selectParty(pi,id);
			
			HashMap map = new HashMap();
			map.put("list", list);
			
			
			response.setContentType("application/json; charset=UTF-8");
			Gson gson = new Gson();
			GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy.MM.dd");
			gson = gb.create();
			
			try {
				gson.toJson(map, response.getWriter());
			} catch (JsonIOException | IOException e) {
				e.printStackTrace();
			}
		}
		
		@RequestMapping(value="myInfoDD.me", produces="application/json; charset=UTF-8")
		@ResponseBody
		public void myinfoDD(HttpSession session,@RequestParam(value="page", required=false) Integer page, HttpServletResponse response,Model model) {
			Member m = (Member)session.getAttribute("loginUser");
			String id = m.getId();
			System.out.println(page);
			int listCount = mService.getListCount1(id);
			int currentPage = 1;
			if(page!=null) {
				currentPage = page;
			}
			System.out.println(currentPage);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 2);
			
			
			ArrayList<Reservation> list = mService.selectReserve(pi,id);
			
			HashMap map = new HashMap();
			map.put("list", list);
			map.put("pi", pi);
			
			response.setContentType("application/json; charset=UTF-8");
			Gson gson = new Gson();
			GsonBuilder gb = new GsonBuilder().setDateFormat("yyyy.MM.dd");
			gson = gb.create();
			
			try {
				gson.toJson(map, response.getWriter());
			} catch (JsonIOException | IOException e) {
				e.printStackTrace();
			}
		}
		
		@RequestMapping("myInfoD.me")
		public String myinfoD(HttpSession session,@RequestParam(value="page", required=false) Integer page,Model model) {
			int currentPage = 1;
			if(page!=null) {
				currentPage = page;
			}
			
			Member m = (Member)session.getAttribute("loginUser");
			String id = m.getId();
			int listCount = mService.getListCount1(id);
			
			System.out.println(currentPage);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 2);
			model.addAttribute("pi",pi);
			return "myInfoD";		
		}
		@RequestMapping("deleteDD.me")
		@ResponseBody
		public int deleteDD(@RequestParam("id")int id) {
			int result = mService.deleteDD(id);
			
			return result;
			
		}
		@RequestMapping("deleteBB.me")
		@ResponseBody
		public int deleteBB(@RequestParam("id")int id) {
			int result = mService.deleteBB(id);
			System.out.println("너는얻ㅣ"+id);
			return result;
			
		}
		@RequestMapping("deleteAA.me")
		@ResponseBody
		public int deleteAA(@RequestParam("hotelId")int hotelId, HttpSession session, LikeHotel list) {
			Member m = (Member)session.getAttribute("loginUser");
			String id = m.getId();
			
			list.setHotelId(hotelId);
			list.setId(id);
			System.out.println("리스트는"+list);
			int result = mService.deleteAA(list);
			System.out.println("너는얻ㅣ"+id);
			return result;
			
		}
}
