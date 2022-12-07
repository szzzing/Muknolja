package com.spring.muknolja.common.model.vo;

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
public class AttachedFile {
	private int fileId;
	private String fileType;
	private Date fileCreateDate;
	private String fileName;
	private String fileModifyName;
	private String fileLink;
	private String fileStatus;
}
