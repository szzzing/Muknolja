package com.spring.muknolja.chat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.muknolja.chat.model.dao.ChatDAO;
import com.spring.muknolja.chat.model.vo.ChatMessage;
import com.spring.muknolja.chat.model.vo.ChatRoom;

@Service("cService")
public class ChatServiceImpl implements ChatService{
	
	@Autowired
	private ChatDAO cDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int createRoom(ChatRoom chatRoom) {
		return cDAO.createRoom(sqlSession, chatRoom);
	}

	@Override
	public ArrayList<ChatRoom> selectChatRoomList() {
		return cDAO.selectChatRoomList(sqlSession);
	}

	@Override
	public ArrayList<ChatMessage> selectChatMessage(String roomCode) {
		return cDAO.selectChatMessage(sqlSession, roomCode);
	}

	@Override
	public void insertMessage(ChatMessage message) {
		cDAO.insertMessage(sqlSession, message);
	}
}
