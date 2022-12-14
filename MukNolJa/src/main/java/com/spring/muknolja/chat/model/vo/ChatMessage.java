package com.spring.muknolja.chat.model.vo;

import java.security.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class ChatMessage {
	private int chatId;
	private String senderId;
	private String roomCode;
	private String chatContent;
	private String transferTime;
	private String nickName;
	
}
