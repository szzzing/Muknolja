package com.spring.muknolja.party.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.common.model.vo.Reply;
import com.spring.muknolja.common.model.vo.Report;
import com.spring.muknolja.party.model.vo.Party;

public interface PartyService {

	int insertBoard(HashMap<String, Object> map);

	int getListCount();

	ArrayList<Party> selectPartyList(PageInfo pi);

	Party selectParty(int pId);

	int updateParty(HashMap<String, Object> map);

	int deleteParty(HashMap<String, Integer> map);

	int insertReply(Reply r);

	ArrayList<Reply> selectReply(int refBoardId);

	ArrayList<Reply> selectReReply(int refReplyId);

	int insertReReply(Reply r);

	int countReply(int pId);

	int deleteReply(int replyId);

	int participate(HashMap<String, Object> map);

	int countParty(int pId);

	int checkParty(HashMap<String, Object> map);

	void deleteParticipate(HashMap<String, Object> map);

	int checkReport(HashMap<String, Object> map);

	int insertReport(Report rp);

	ArrayList<Party> searchParty(HashMap<String, Object> map, PageInfo pi);

	int getSearchListCount(HashMap<String, Object> map);

	int checkLike(HashMap<String, Object> map);

	int insertLike(HashMap<String, Object> map);

	int deleteLike(HashMap<String, Object> map);

}
