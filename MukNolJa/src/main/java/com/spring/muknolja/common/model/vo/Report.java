package com.spring.muknolja.common.model.vo;

import java.sql.Date;

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
public class Report {
	private int reportId;
	private String memberId;
	private int targetId;
	private String reportClassification;
	private String reportContent;
	private Date createDate;
	private String processing;
	private String reportTitle;
}
