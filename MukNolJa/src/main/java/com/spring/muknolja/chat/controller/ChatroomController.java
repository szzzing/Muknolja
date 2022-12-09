package com.spring.muknolja.chat.controller;

import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.spring.muknolja.chat.model.service.ChatService;
import com.spring.muknolja.chat.model.vo.ChatMessage;
import com.spring.muknolja.chat.model.vo.ChatRoom;
import com.spring.muknolja.member.model.vo.Member;

@Controller
public class ChatroomController {
	
	@Autowired
	private ChatService cService;
	
	//채팅방 개설
    @GetMapping("createRoom.ch")
    public String createRoom(@ModelAttribute ChatRoom chatRoom, RedirectAttributes rttr){
    	
    	chatRoom.setRoomCode(UUID.randomUUID().toString());

    	
    	System.out.println("# Create Chat Room , name: " + chatRoom.getRoomName());
    	int result = cService.createRoom(chatRoom);
        return "redirect:home.do";
    }
    
    // 채팅방 목록
    @GetMapping("chatRoomList.ch")
    public String chatRoomList(Model model) {
    	ArrayList<ChatRoom> list = cService.selectChatRoomList();
    	
    	model.addAttribute("list", list);
    	return "chatRooms";
    }
    
    // 채팅방 이동
    @RequestMapping("chatRoom.ch")
    public String chatRoom(@RequestParam("roomCode") String roomCode, Model model, HttpSession session) {
    	ArrayList<ChatMessage> list = cService.selectChatMessage(roomCode);
    	Member loginUser = (Member)session.getAttribute("loginUser");
    	
    	model.addAttribute("loginUser", loginUser);
    	model.addAttribute("list", list);
    	model.addAttribute("roomCode", roomCode);
    	return "chatRoom";
    }

}
