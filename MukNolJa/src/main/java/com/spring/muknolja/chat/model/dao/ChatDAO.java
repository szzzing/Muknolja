package com.spring.muknolja.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.muknolja.chat.model.vo.ChatMessage;
import com.spring.muknolja.chat.model.vo.ChatRoom;

@Repository("cDAO")
public class ChatDAO {

	public int createRoom(SqlSessionTemplate sqlSession, ChatRoom chatRoom) {
		return sqlSession.insert("chatmapper.createRoom", chatRoom);
	}

	public ArrayList<ChatRoom> selectChatRoomList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("chatmapper.selectChatRoomList");
	}

	public ArrayList<ChatMessage> selectChatMessage(SqlSessionTemplate sqlSession, String roomCode) {
		return (ArrayList)sqlSession.selectList("chatmapper.selectChatMessage", roomCode);
	}

}
