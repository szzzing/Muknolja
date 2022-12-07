package com.spring.muknolja.chat.model.service;

import java.util.ArrayList;

import com.spring.muknolja.chat.model.vo.ChatMessage;
import com.spring.muknolja.chat.model.vo.ChatRoom;

public interface ChatService {

	int createRoom(ChatRoom chatRoom);

	ArrayList<ChatRoom> selectChatRoomList();

	ArrayList<ChatMessage> selectChatMessage(String roomCode);

}
