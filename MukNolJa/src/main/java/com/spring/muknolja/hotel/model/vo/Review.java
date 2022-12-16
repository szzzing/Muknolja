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
public class Review {
	private int reviewId;
	private String memberId;
	private String nickName;
	private int ReservationId;
	private String hotelName;
	private String roomName;
	private Date checkinDate;
	private Date checkoutDate;
	private int rating;
	private String reviewContent;
	private Date createDate;
	private String businessReply;
}
