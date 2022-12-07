package com.spring.muknolja.hotel.model.vo;

import java.sql.Date;

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
	private String hotelName;
	private int maxAccept;
	private int roomPrice;
	private Date checkinTime;
	private Date checkoutTime;
	private int totalNumber;
	private String roomInfo;
}
