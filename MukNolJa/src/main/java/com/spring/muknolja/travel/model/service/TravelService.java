package com.spring.muknolja.travel.model.service;

import java.util.ArrayList;

import com.spring.muknolja.common.model.vo.Reply;

public interface TravelService {

	int insertReply(Reply r);

	ArrayList<Reply> selectReply(int refBoardId);

	int deleteReply(int replyId);

	int countReply(int contentId);

}
