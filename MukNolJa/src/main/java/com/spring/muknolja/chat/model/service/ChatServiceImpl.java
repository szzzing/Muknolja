package com.spring.muknolja.chat.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.muknolja.chat.model.dao.ChatDAO;
import com.spring.muknolja.chat.model.vo.ChatMessage;
import com.spring.muknolja.chat.model.vo.ChatRoom;
import com.spring.muknolja.member.model.vo.Member;

@Service("cService")
public class ChatServiceImpl implements ChatService{
	
	@Autowired
	private ChatDAO cDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int createRoom(HashMap<String, Object> map) {
		return cDAO.createRoom(sqlSession, map);
	}

	@Override
	public ArrayList<ChatRoom> selectChatRoomList(String id) {
		return cDAO.selectChatRoomList(sqlSession, id);
	}

	@Override
	public ArrayList<ChatMessage> selectChatMessage(String roomCode) {
		return cDAO.selectChatMessage(sqlSession, roomCode);
	}

	@Override
	public void insertMessage(ChatMessage message) {
		cDAO.insertMessage(sqlSession, message);
	}

	@Override
	public Member selectUser(String nick) {
		return cDAO.selectUser(sqlSession, nick);
	}
}
