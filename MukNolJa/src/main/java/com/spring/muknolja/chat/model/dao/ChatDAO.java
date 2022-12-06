package com.spring.muknolja.chat.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.muknolja.chat.vo.ChatRoom;

@Repository("cDAO")
public class ChatDAO {

	public int createRoom(SqlSessionTemplate sqlSession, ChatRoom chatRoom) {
		return sqlSession.insert("chatmapper.createRoom", chatRoom);
	}

	public ArrayList<ChatRoom> selectChatRoomList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("chatmapper.selectChatRoomList");
	}

}
