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
public class Reservation {
	private int reservationId;
	private String memberId;
	private int hotelId;
	private int roomId;
	private String hotelName;
	private String roomName;
	private Date checkinDate;
	private Date checkoutDate;
	private String reservationStatus;
	private String paymentMethod;
	private int paymentAmount;
	private Date paymentDate;
	private String reservationName;
	private String reservationPhone;
	private String checkinTime;
	private String checkoutTime;
	private String fileModifyName;
}
