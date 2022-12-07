package com.spring.muknolja.chat.vo;

import java.sql.Date;

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
	private Date transferTime;
	
}
