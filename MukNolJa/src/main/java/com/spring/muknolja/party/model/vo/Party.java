package com.spring.muknolja.party.model.vo;

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
public class Party {
	private int partyId;
	private String partyWriter;
	private String nickName;
	private String boardType;
	private String partyCourse;
	private String partyTitle;
	private String partyContent;
	private Date createDate;
	private Date modifyDate;
	private String partyArea;
	private String partyStatus;
	private String maxParticipate;
	private Date partyStartDate;
	private Date partyEndDate;
	private String gender;
	private String thumbnail;
	private int fileId;
	private String contentCourse;
	private String nowParticipate;
	private int replyCount;
}
