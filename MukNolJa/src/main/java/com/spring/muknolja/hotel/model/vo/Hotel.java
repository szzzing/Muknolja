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
	private String entId;
	private String hotelName;
	private String hotelPhone;
	private String hotelAddress;
	private String wifi;
	private String breakfast;
	private String amenity;
	private String park;
	private String fitness;
	private String swim;
	private int star;
	private String entApproval;
	private Date modifyDate;
	private String hotelInfo;
	private String hotelIntro;
	private String hotelStatus;
	private int minPrice;
	private double avgRating;
	private double hotelGeoX;
	private double hotelGeoY;
	private int emptyHotel;
	private int maxDistance;
	private String thumbnail;
	private String fileModifyName;
}