package com.spring.muknolja.chat.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.spring.muknolja.chat.model.vo.ChatInvite;
import com.spring.muknolja.chat.model.vo.ChatMessage;
import com.spring.muknolja.chat.model.vo.ChatRoom;
import com.spring.muknolja.member.model.vo.Member;

public interface ChatService {

	int createRoom(HashMap<String, Object> map);

	ArrayList<ChatRoom> selectChatRoomList(String id);

	ArrayList<ChatMessage> selectChatMessage(String roomCode);

	void insertMessage(HashMap<String, Object> map);

	ArrayList<Member> selectUser(String nick);

	ChatRoom selectChatRoom(String roomCode);

	int inviteChat(ChatInvite i);

	ArrayList<ChatInvite> selectInvite(String id);

	int participate(HashMap<String, String> map);

	void consentInvite(HashMap<String, String> map);

	int refusalInvite(HashMap<String, String> map);

	int chatRoomOut(HashMap<String, String> map);

	ArrayList<String> selectChatUser(String roomCode);

	ArrayList<String> selectChatList(String roomCode);

	void updateAvailability(HashMap<String, Object> aMap);

	int availablilty(HashMap<String, Object> map);

	ArrayList<ChatRoom> selectCount(String id);

	int selectChatId();

}
