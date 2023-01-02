package com.spring.muknolja.chat.controller;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.spring.muknolja.chat.model.service.ChatService;
import com.spring.muknolja.chat.model.vo.ChatInvite;
import com.spring.muknolja.chat.model.vo.ChatMessage;
import com.spring.muknolja.chat.model.vo.ChatRoom;
import com.spring.muknolja.member.model.vo.Member;

@Controller
public class ChatroomController {
	
	@Autowired
	private ChatService cService;
	
	//채팅방 개설
	@RequestMapping("createRoom.ch")
	@ResponseBody
    public String createRoom(@ModelAttribute ChatRoom chatRoom, HttpSession session){
    	String id = ((Member)session.getAttribute("loginUser")).getId();
    	chatRoom.setRoomCode(UUID.randomUUID().toString());
    	
    	HashMap<String, Object> map = new HashMap<>();
    	
    	map.put("id", id);
    	map.put("chatRoom", chatRoom);
    	
    	int result = cService.createRoom(map);
    	
    	String roomCode = chatRoom.getRoomCode();
    	
        return roomCode;
    }
    
    // 채팅방 목록
    @RequestMapping("chatRoomList.ch")
    public void chatRoomList(HttpServletResponse response, HttpSession session) {
    	String id = ((Member)session.getAttribute("loginUser")).getId();
    	ArrayList<ChatRoom> list = cService.selectChatRoomList(id);
    	
    	ArrayList<ChatRoom> countList = cService.selectCount(id);
    	
    	for(ChatRoom r : list) {
    		r.setReceiveCount(0);
    		for(ChatRoom c : countList) {
    			if(r.getRoomCode().equals(c.getRoomCode())) {
    				r.setReceiveCount(c.getReceiveCount());
    			}
    		}
    	}
    	
    	Gson gson = new Gson();
    	
    	String now = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS"));
    	int nYear = Integer.parseInt(now.substring(0, 4));
    	int nMonth = Integer.parseInt(now.substring(5, 7));
    	int nDay = Integer.parseInt(now.substring(8, 10));
    	int nH = Integer.parseInt(now.substring(11, 13)); 
    	int nM = Integer.parseInt(now.substring(14, 16));
    	
    	for(ChatRoom c : list) {
    		String time = c.getMaxTransferTime();
    		
    		if(time != null) {
    		
	    		int cYear = Integer.parseInt(time.substring(0, 4));
	        	int cMonth = Integer.parseInt(time.substring(5, 7));
	        	int cDay = Integer.parseInt(time.substring(8, 10));
	        	int cH = Integer.parseInt(time.substring(11, 13)); 
	        	int cM = Integer.parseInt(time.substring(14, 16));
	    		
	    		if(nYear == cYear) {
	    			if(nMonth == cMonth) {
	    				if(nDay == cDay) {
	    					if(nH == cH) {
	    						if(nM == cM) {
	    							c.setMaxTransferTime("방금");
	            				} else {
	            					int m = nM - cM;
	            					c.setMaxTransferTime(m + "분 전");
	            				}
	        				} else {
	        					int h = nH - cH;
	        					c.setMaxTransferTime(h + "시간 전");
	        				}
	    				} else {
	    					int d = nDay - cDay;
	    					c.setMaxTransferTime(d + "일 전");
	    				}
	    			} else {
	    				int m = nMonth - cMonth;
	    				c.setMaxTransferTime(m + "달 전");
	    			}
	    		} else {
	    			int y = nYear - cYear;
	    			c.setMaxTransferTime(y + "년 전");
	    		}
    		
    		} else {
    			c.setMaxTransferTime("메세지가 없습니다");
    		}
    		
    	}
    	
    	response.setContentType("application/json; charset=UTF-8");
    	
    	try {
			gson.toJson(list, response.getWriter());
		} catch (JsonIOException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    // 채팅방 이동
    @RequestMapping("chatRoom.ch")
    public void chatRoom(@RequestParam("roomCode") String roomCode, HttpServletResponse response, HttpSession session) {
    	ChatRoom room = cService.selectChatRoom(roomCode);
    	ArrayList<ChatMessage> list = cService.selectChatMessage(roomCode);
    	
    	String id = ((Member)session.getAttribute("loginUser")).getId();
    	
    	ArrayList<String> cList = cService.selectChatList(roomCode);
    	
    	if(!cList.isEmpty()) {
	    	HashMap<String, Object> aMap = new HashMap<>();
	    	aMap.put("cList", cList);
	    	aMap.put("id", id);
	    	cService.updateAvailability(aMap);
    	}
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("list", list);
    	map.put("room", room);
    	
    	Gson gson = new Gson();
    	
    	response.setContentType("application/json; charset=UTF-8");
    	
    	try {
			gson.toJson(map, response.getWriter());
		} catch (JsonIOException | IOException e) {
			e.printStackTrace();
		}
    }
    
    // 닉네임 검색
    @RequestMapping("searchNick.ch")
    public void searchNick(@RequestParam("nick") String nick, HttpServletResponse response) {
    	ArrayList<Member> mList = cService.selectUser(nick);
    	
    	Gson gson = new Gson();
    	
    	response.setContentType("application/json; charset=UTF-8");
    	
    	try {
			gson.toJson(mList, response.getWriter());
		} catch (JsonIOException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    // 채팅방 초대
    @RequestMapping("inviteChat.ch")
    @ResponseBody
    public int inviteChat(@ModelAttribute ChatInvite i) {
    	int result = cService.inviteChat(i);
    	
    	return result;
    }
    
    // 채팅방 초대 목록
    @RequestMapping("selectInvite.ch")
    public void selectInvite(HttpSession session, HttpServletResponse response) {
    	String id = ((Member)session.getAttribute("loginUser")).getId();
    	
    	ArrayList<ChatInvite> list = cService.selectInvite(id);
    	
    	Gson gson = new Gson();
    	
    	response.setContentType("application/json; charset=UTF-8");
    	
    	try {
			gson.toJson(list, response.getWriter());
		} catch (JsonIOException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    // 초대 수락
    @RequestMapping("participate.ch")
    @ResponseBody
    public int participate(@RequestParam("roomCode") String roomCode, HttpSession session) {
    	String id = ((Member)session.getAttribute("loginUser")).getId();
    	
    	HashMap<String, String> map = new HashMap<>();
    	
    	map.put("id", id);
    	map.put("roomCode", roomCode);
    	
    	cService.consentInvite(map);
    	int result = cService.participate(map);
    	
    	return result;
    }
    
    // 초대 거절
    @RequestMapping("refusalInvite.ch")
    @ResponseBody
    public int refusalInvite(@RequestParam("roomCode") String roomCode, HttpSession session) {
    	String id = ((Member)session.getAttribute("loginUser")).getId();
    	
    	HashMap<String, String> map = new HashMap<>();
    	
    	map.put("id", id);
    	map.put("roomCode", roomCode);
    	
    	int result = cService.refusalInvite(map);
    	
    	return result;
    }
    
    // 채팅방 나가기
    @RequestMapping("chatRoomOut.ch")
    @ResponseBody
    public int chatRoomOut(@RequestParam("roomCode") String roomCode, HttpSession session) {
    	String id = ((Member)session.getAttribute("loginUser")).getId();
    	
    	HashMap<String, String> map = new HashMap<>();
    	
    	map.put("id", id);
    	map.put("roomCode", roomCode);
    	
    	int result = cService.chatRoomOut(map);
    	
    	return result;
    }

}
