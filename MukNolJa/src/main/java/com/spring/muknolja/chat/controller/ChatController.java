package com.spring.muknolja.chat.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.muknolja.chat.model.service.ChatService;
import com.spring.muknolja.chat.model.vo.ChatMessage;
import com.spring.muknolja.member.model.vo.Member;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ChatController {
	private final SimpMessagingTemplate template; //특정 Broker로 메세지를 전달
	
	@Autowired
	private ChatService cService;

    //Client가 SEND할 수 있는 경로
    //stompConfig에서 설정한 applicationDestinationPrefixes와 @MessageMapping 경로가 병합됨
    //"/pub/chat/enter"
    @MessageMapping(value = "/chat/enter")
    public void enter(ChatMessage message){
        message.setChatContent(message.getNickName() + "님이 채팅방에 참여하였습니다.");
        template.convertAndSend("/sub/chat/room/" + message.getRoomCode(), message);
    }

    @MessageMapping(value = "/chat/message")
    public void message(ChatMessage message){
    	ArrayList<String> iList = cService.selectChatUser(message.getRoomCode());
    	HashMap<String, Object> map = new HashMap<>();
    	map.put("message", message);
    	map.put("iList", iList);
    	
    	cService.insertMessage(map);
 
    	template.convertAndSend("/sub/chat/room/" + message.getRoomCode(), message);
    }
    
    @RequestMapping("availablilty.ch")
    @ResponseBody
    public int availablilty(@RequestParam("chatId") int chatId, @RequestParam("id") String id) {
    	HashMap<String, Object> map = new HashMap<>();
    	map.put("chatId", chatId);
    	map.put("id", id);

    	return cService.availablilty(map);
    }
}
