package com.spring.muknolja.chat.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class ChatRoom {
	private String roomCode;
	private int BoardId;
	private String roomName;
	private String hostId;
	private String maxTransferTime;
	private int receiveCount;
}
