package com.spring.muknolja.review.model.service;

import java.util.ArrayList;

import com.spring.muknolja.common.model.vo.Board;
import com.spring.muknolja.common.model.vo.PageInfo;

public interface ReviewService {

	int getselectBoard();

	ArrayList<Board> selectBoard(PageInfo pi);

}
