package com.spring.muknolja.chat.model.service;

import java.util.ArrayList;

import com.spring.muknolja.chat.model.vo.ChatMessage;
import com.spring.muknolja.chat.model.vo.ChatRoom;
import com.spring.muknolja.member.model.vo.Member;

public interface ChatService {

	int createRoom(ChatRoom chatRoom);

	ArrayList<ChatRoom> selectChatRoomList();

	ArrayList<ChatMessage> selectChatMessage(String roomCode);

	void insertMessage(ChatMessage message);

	Member selectUser(String nick);

}
