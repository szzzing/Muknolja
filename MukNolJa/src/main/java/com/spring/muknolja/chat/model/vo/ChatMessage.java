package com.spring.muknolja.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class ChatMessage {
	private int chatId;
	private String senderId;
	private String roomCode;
	private String chatContent;
	private String transferTime;
	private String nickName;
	
}
