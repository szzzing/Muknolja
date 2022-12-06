package com.spring.muknolja.chat.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.muknolja.chat.model.dao.ChatDAO;
import com.spring.muknolja.chat.vo.ChatRoom;

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
}
