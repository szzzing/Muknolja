package com.spring.muknolja.member.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
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
import com.spring.muknolja.common.exception.CommonException;
import com.spring.muknolja.common.model.vo.AD;
import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.common.model.vo.Board;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.common.model.vo.Pagination;
import com.spring.muknolja.common.model.vo.QA;
import com.spring.muknolja.common.model.vo.Report;
import com.spring.muknolja.hotel.model.vo.Hotel;
import com.spring.muknolja.hotel.model.vo.LikeHotel;
import com.spring.muknolja.hotel.model.vo.Reservation;
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
					
				} else if(loginUser.getMemberType().equals("H")) {
					return "redirect:admin.ho";
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
		public String myinfo(HttpSession session,@RequestParam(value="page", required=false) Integer page,Model model) {
			int currentPage = 1;
			if(page!=null) {
				currentPage = page;
			}
			
			Member m = (Member)session.getAttribute("loginUser");
			String id = m.getId();
			int listCount = mService.getListCount5(id);
			
			System.out.println(currentPage);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 6);
			model.addAttribute("pi",pi);
			return "myInfo";		
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
			if(cate != null && cate > 0 && cate <= 3) {
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
			
			ArrayList<Object> bList = null;
			
			if(category != 2) {
			HashMap<String, Object> map = new HashMap<>();
			map.put("category", category);
			map.put("search", search);
			
			int listCount = mService.boardListCount();
			
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 30);
			
			bList = mService.selectBoardList(map, pi);
			
			} else {
				int listCount = mService.reportListCount();
				
				PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 30);
				
				bList = mService.selectReportList(search, pi);
				
				for(Object r : bList) {
					Report report = (Report)r;
					String type = report.getReportClassification();
					
					if(type.equals("B")) {
						report.setReportClassification("게시글");
					} else {
						report.setReportClassification("댓글");
					}
				}
			}
			
			ArrayList<Map<String, Integer>> bCount = mService.bCount();
			
			model.addAttribute("bCount", bCount);
			model.addAttribute("bList", bList);
			model.addAttribute("category", category);
			
			return "boardManagement";
		}
		
		@RequestMapping("adManagement.me")
		public String adManagement(@RequestParam(value="category", required=false) Integer cate, Model model) {
			
			int category = 0;
			if(cate != null && cate > 0 && cate <= 6) {
				category = cate;
			}
			
			ArrayList<AD> aList = mService.selectADList(category);
			 
			for(AD a : aList) {
				String boardType = a.getBoardType();
				
				if(boardType.equals("M")) {
					a.setBoardType("메인");
				} else if(boardType.equals("T")) {
					a.setBoardType("광광지");
				} else if(boardType.equals("F")) {
					a.setBoardType("맛집");
				} else if(boardType.equals("V")) {
					a.setBoardType("축제");
				} else if(boardType.equals("P")) {
					a.setBoardType("동행");
				} else if(boardType.equals("R")) {
					a.setBoardType("후기");
				} else if(boardType.equals("H")) {
					a.setBoardType("호텔");
				}
			}
			
			String type = null;
			if(category == 0) {
				type = "메인";
			} else if(category == 1) {
				type = "관광지";
			} else if(category == 2) {
				type = "맛집";
			} else if(category == 3) {
				type = "축제";
			} else if(category == 4) {
				type = "동행";
			} else if(category == 5) {
				type = "후기";
			} else if(category == 6) {
				type = "호텔";
			}
			
			ArrayList<Map<String, Integer>> incomeCount = mService.incomeCount();
			
			model.addAttribute("aList", aList);
			model.addAttribute("incomeCount", incomeCount);
			model.addAttribute("category", category);
			model.addAttribute("type", type);
		
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
			System.out.println("나는"+files);
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
		
		@RequestMapping(value="myInfo11.me", produces="application/json; charset=UTF-8")
		@ResponseBody
		public void myinfo11(HttpSession session,@RequestParam(value="page", required=false) Integer page, HttpServletResponse response,Model model) {
			Member m = (Member)session.getAttribute("loginUser");
			String id = m.getId();
			System.out.println(page);
			int listCount = mService.getListCount5(id);
			int currentPage = 1;
			if(page!=null) {
				currentPage = page;
			}
			System.out.println(currentPage);
			PageInfo pi = Pagination.getPageInfo(currentPage, listCount, 6);
			
			
			ArrayList<Board> list = mService.selectB(pi,id);
			
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
		
		@RequestMapping("addAd.me")
		public String addAd(@ModelAttribute AD a, @RequestParam("adImg") MultipartFile file, HttpServletRequest request) {
			
			String boardType = a.getBoardType();
			
			if(boardType.equals("메인")) {
				a.setBoardType("M");
			} else if(boardType.equals("관광지")) {
				a.setBoardType("T");
			} else if(boardType.equals("맛집")) {
				a.setBoardType("F");
			} else if(boardType.equals("축제")) {
				a.setBoardType("V");
			} else if(boardType.equals("동행")) {
				a.setBoardType("P");
			} else if(boardType.equals("후기")) {
				a.setBoardType("R");
			} else if(boardType.equals("호텔")) {
				a.setBoardType("H");
			}
			
			String fileName = file.getOriginalFilename();
			
			AttachedFile attm = new AttachedFile();
			
			String[] returnArr = AttachedFile.saveFile(file, request);
			
			attm.setFileName(fileName);
			attm.setFileType("A");
			attm.setFileLink(returnArr[0]);
			attm.setFileModifyName(returnArr[1]);
			attm.setFileThumbnail("Y");
			
			HashMap<String, Object> map = new HashMap<>();
			
			map.put("a", a);
			map.put("attm", attm);
			
			int result = mService.insertAd(map);
			
			
			return "redirect:adManagement.me";
		}
		
		@RequestMapping("selectAttm.me")
		public void selectAttm(@RequestParam("id") int id, HttpServletResponse response) {
			AttachedFile attm = mService.selectAttm(id);
			Gson gson = new Gson();
	    	
	    	response.setContentType("application/json; charset=UTF-8");
	    	
	    	try {
				gson.toJson(attm, response.getWriter());
			} catch (JsonIOException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		@RequestMapping("modifyAd.me")
		public String ModifyAd(@ModelAttribute AD a, @RequestParam("adImg") MultipartFile file, @RequestParam("beforeFileId") int beforeFileId, @RequestParam("beforeFileName") String beforeFileName,HttpServletRequest request) {
			
			String boardType = a.getBoardType();
			
			if(boardType.equals("메인")) {
				a.setBoardType("M");
			} else if(boardType.equals("관광지")) {
				a.setBoardType("T");
			} else if(boardType.equals("맛집")) {
				a.setBoardType("F");
			} else if(boardType.equals("축제")) {
				a.setBoardType("V");
			} else if(boardType.equals("동행")) {
				a.setBoardType("P");
			} else if(boardType.equals("후기")) {
				a.setBoardType("R");
			} else if(boardType.equals("호텔")) {
				a.setBoardType("H");
			}
			
			int result = 0;
			String fileName = file.getOriginalFilename();
			
			if(!fileName.equals("")) {
			AttachedFile attm = new AttachedFile();
			
			String[] returnArr = AttachedFile.saveFile(file, request);
			
			attm.setFileName(fileName);
			attm.setFileLink(returnArr[0]);
			attm.setFileModifyName(returnArr[1]);
			
			HashMap<String, Object> map = new HashMap<>();
			map.put("attm", attm);
			map.put("beforeFileId", beforeFileId);
			
			result += mService.updateAttm(map);
			}
			
			HashMap<String, Object> aMap = new HashMap<>();
			aMap.put("beforeFileId", beforeFileId);
			aMap.put("a", a);
			
			result += mService.updateAd(aMap);
			
			if(result > 0) {
				AttachedFile.deleteFile(beforeFileName, request);
				return "redirect:adManagement.me";
			} else {
				throw new CommonException("광고 수정 실패.");
			}
		}
		
		@RequestMapping("reportDetail.me")
		public String reportDetail(@RequestParam("id") String id, @RequestParam("type") String reportType, Model model) {
			if(reportType.equals("댓글")) {
				id = mService.selectBoardId(id);
			}
			
			String type = mService.selectBoardType(id);
			
			if(type.equals("P")) {
				model.addAttribute("pId", id);
				return "redirect:selectParty.pa";
			} else {
				model.addAttribute("id", id);
				return "redirect:reviewDetail.re";
			}
		}
		
		@RequestMapping("processing.me")
		public String processing(@RequestParam("id") String id) {
			int result = mService.updateProcessing(id);
			
			if(result > 0) {
				return "redirect:boardManagement.me";
			} else {
				throw new CommonException("신고 확인 실패.");
			}
		}
		
		@RequestMapping("QA.me")
		public String QA(Model model) {
			
			ArrayList<Map<String, Integer>> qCountList = mService.QACount();
			ArrayList<QA> qList = mService.selectQAList();
			
			model.addAttribute("qList", qList);
			model.addAttribute("qCountList", qCountList);
			
			return "QA";
		}
		
		@RequestMapping("insertQA.me")
		@ResponseBody
		public int insertQA(@ModelAttribute QA q, HttpSession session) {
			q.setQaWriter(((Member)session.getAttribute("loginUser")).getId());
			int result = mService.insertQA(q);
			
			return result;
		}
		
		@RequestMapping("selectQA.me")
		public void selectQA(@RequestParam("id") String id, HttpServletResponse response) {
			QA q = mService.selectQAOne(id);
			
			response.setContentType("application/json; charset=UTF-8");
			Gson gson = new Gson();
			
			try {
				gson.toJson(q, response.getWriter());
			} catch (JsonIOException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		@RequestMapping("qaReply.me")
		@ResponseBody
		public int qaReply(@ModelAttribute QA q) {
			
			int result = mService.updateQAReply(q);
			
			return result;
		}
		
		@RequestMapping("selectAd.me")
		public void selectAd(@RequestParam("type") String type, HttpServletResponse response) {
			ArrayList<String> iList = mService.selectAd(type);
			
			response.setContentType("application/json; charset=UTF-8");
			Gson gson = new Gson();
			
			try {
				gson.toJson(iList, response.getWriter());
			} catch (JsonIOException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		@RequestMapping("pBoardDelete.me")
		public String pBoardDelete(@RequestParam("id") int id, Model model) {
			int fileId = mService.selectPBoardFileId(id);
			
			model.addAttribute("partyId", id);
			model.addAttribute("fileId", fileId);
			model.addAttribute("managerCheck", 0);
			
			return "redirect:deleteParty.pa";
		}
		
		@RequestMapping("reportReply.me")
		public String reportReply(@RequestParam("id") int id, @RequestParam("content") String content) {
			HashMap<String, Object> map = new HashMap<>();
			map.put("content", content);
			map.put("id", id);
			
			System.out.println(map);
			
			int result = mService.reportReply(map);
			
			return "redirect:boardManagement.me";
		}
}
