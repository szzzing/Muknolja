package com.spring.muknolja.common.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Board {
	private int boardId;
	private String boardWriter;
	private String boardType;
	private String boardCourse;
	private String boardTitle;
	private String boardContent;
	private Date createDate;
	private Date modifyDate;
	private String boardArea;
	private String boardStatus;
}
