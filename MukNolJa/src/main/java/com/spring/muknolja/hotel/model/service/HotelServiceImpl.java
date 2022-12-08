package com.spring.muknolja.hotel.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.hotel.model.dao.HotelDAO;
import com.spring.muknolja.hotel.model.vo.Hotel;
import com.spring.muknolja.hotel.model.vo.Room;

@Service("hService")
public class HotelServiceImpl implements HotelService{
	
	@Autowired
	private HotelDAO hDAO;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int insertRoom(Room r) {
		return hDAO.insertRoom(sqlSession, r);
	}

	@Override
	public int insertAttm(ArrayList<AttachedFile> list) {
		return hDAO.insertAttm(sqlSession, list);
	}
	
	@Override
	public Hotel selectHotel(int hotelId) {
		return hDAO.selectHotel(sqlSession, hotelId);
	}
}
