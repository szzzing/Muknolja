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
public class Hotel {
	private int hotelId;
	private int entId;
	private String hotelName;
	private String hotelPhone;
	private String hotelAddress;
	private String wifi;
	private String breakfast;
	private String amenity;
	private String park;
	private String entApproval;
	private Date modifyDate;
}