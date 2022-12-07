package com.spring.muknolja.hotel.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.hotel.model.vo.Room;

@Repository("hDAO")
public class HotelDAO {

	public int insertRoom(SqlSessionTemplate sqlSession, Room r) {
		return sqlSession.insert("hotelmapper.insertRoom", r);
	}

	public int insertAttm(SqlSessionTemplate sqlSession, ArrayList<AttachedFile> list) {
		return sqlSession.insert("hotelmapper.insertAttm", list);
	}

}
