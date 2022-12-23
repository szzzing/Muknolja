package com.spring.muknolja.hotel.model.vo;

import java.sql.Time;

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
public class Room {
	private int roomId;
	private int hotelId;
	private int maxAccept;
	private String roomName;
	private int roomPrice;
	private String checkinTime;
	private String checkoutTime;
	private int totalNumber;
	private String roomInfo;
	private String roomIntro;
	private String roomStatus;
	private String thumbnail;
	private int emptyRoom;
}
