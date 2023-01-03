package com.spring.muknolja.review.model.service;

import java.util.ArrayList;

import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.common.model.vo.Board;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.common.model.vo.Reply;

public interface ReviewService {

	int getselectBoard();

	ArrayList<Board> selectBoard(PageInfo pi);

	Board boardDetail(int boardId);

	ArrayList<AttachedFile> boardImg(int boardId);

	int CountReply(int boardId);

	ArrayList<Reply> selectReply(PageInfo pi, int boardId);

	ArrayList<Reply> selectRe(int refReplyId);

	int insertReply(Reply reply);

}
