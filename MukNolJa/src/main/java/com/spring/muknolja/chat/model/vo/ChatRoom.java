package com.spring.muknolja.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class ChatRoom {
	private String roomCode;
	private int BoardId;
	private String roomName;
	private String hostId;
}
