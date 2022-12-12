package com.spring.muknolja.chat.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.spring.muknolja.chat.model.service.ChatService;
import com.spring.muknolja.chat.model.vo.ChatMessage;
import com.spring.muknolja.chat.model.vo.ChatRoom;
import com.spring.muknolja.member.model.vo.Member;

@Controller
public class ChatroomController {
	
	@Autowired
	private ChatService cService;
	
	//채팅방 개설
	@RequestMapping("createRoom.ch")
    public String createRoom(@ModelAttribute ChatRoom chatRoom, RedirectAttributes rttr){
    	
    	chatRoom.setRoomCode(UUID.randomUUID().toString());

    	
    	System.out.println("# Create Chat Room , name: " + chatRoom.getRoomName());
    	int result = cService.createRoom(chatRoom);
        return "redirect:home.do";
    }
    
    // 채팅방 목록
    @RequestMapping("chatRoomList.ch")
    public void chatRoomList(HttpServletResponse response) {
    	ArrayList<ChatRoom> list = cService.selectChatRoomList();
    	
    	Gson gson = new Gson();
    	
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
    public void chatRoom(@RequestParam("roomCode") String roomCode, HttpServletResponse response) {
    	ArrayList<ChatMessage> list = cService.selectChatMessage(roomCode);
    	
    	HashMap<String, Object> map = new HashMap<String, Object>();
    	
    	map.put("list", list);
    	map.put("roomCode", roomCode);
    	
    	Gson gson = new Gson();
    	
    	response.setContentType("application/json; charset=UTF-8");
    	
    	try {
			gson.toJson(map, response.getWriter());
		} catch (JsonIOException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    // 닉네임 검색
    @RequestMapping("searchNick.ch")
    @ResponseBody
    public Member searchNick(@RequestParam("nick") String nick) {
    	Member m = cService.selectUser(nick);
    	
    	return m;
    }

}
