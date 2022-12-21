package com.spring.muknolja.member.model.vo;

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
public class Member {
		private String id;
		private String pwd;
		private String name;
		private String nickName;
		private String phone;
		private String email;
		private String address;
		private String gender;	
		private Date enrollDate;
	    private String memberType;
	    private String status;
	    private int report;
	    private String lastVisit;


}
