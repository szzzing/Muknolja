package com.spring.muknolja.review.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.common.model.vo.Board;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.common.model.vo.Reply;
import com.spring.muknolja.common.model.vo.Report;

public interface ReviewService {

	int getselectBoard(int sarea);

	ArrayList<Board> selectBoard(PageInfo pi, int Sarea);

	Board boardDetail(int boardId);

	ArrayList<AttachedFile> boardImg(int boardId);

	int CountReply(int boardId);

	ArrayList<Reply> selectReply(int boardId);

	ArrayList<Reply> selectRe(int refReplyId);

	int insertReply(Reply reply);

	int insertBoard(HashMap<String, Object> map);

	int insertReport(Report report);

	int insertReRe(Reply reply);

	ArrayList<Reply> selectReply(ArrayList<Reply> reply1);

	Reply selectReply1(Reply num);



	

	

}
