package com.spring.muknolja.hotel.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.hotel.model.dao.HotelDAO;
import com.spring.muknolja.hotel.model.vo.Hotel;
import com.spring.muknolja.hotel.model.vo.LikeHotel;
import com.spring.muknolja.hotel.model.vo.Review;
import com.spring.muknolja.hotel.model.vo.Reservation;
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
	public int insertRoomAttm(ArrayList<AttachedFile> list) {
		return hDAO.insertRoomAttm(sqlSession, list);
	}
	
	@Override
	public int insertHotelAttm(ArrayList<AttachedFile> list) {
		return hDAO.insertHotelAttm(sqlSession, list);
	}
	
	@Override
	public Hotel selectHotel(int hotelId) {
		return hDAO.selectHotel(sqlSession, hotelId);
	}
	
	@Override
	public AttachedFile selectHotelImg(int hotelId) {
		return hDAO.selectHotelImg(sqlSession, hotelId);
	}
	
	@Override
	public ArrayList<Room> selectAllRoom(int hotelId) {
		return hDAO.selectAllRoom(sqlSession, hotelId);
	}
	
	@Override
	public ArrayList<AttachedFile> selectRoomImg(int roomId) {
		return hDAO.selectRoomImg(sqlSession, roomId);
	}
	
	@Override
	public AttachedFile selectRoomThumbnail(int roomId) {
		return hDAO.selectRoomThumbnail(sqlSession, roomId);
	}
	
	@Override
	public int insertHotel(Hotel h) {
		return hDAO.insertHotel(sqlSession, h);
	}
	
	@Override
	public Room selectRoom(int roomId) {
		return hDAO.selectRoom(sqlSession, roomId);
	}
	
	@Override
	public int getCurrentReservationId() {
		return hDAO.getCurrentReservationId(sqlSession);
	}
	
	@Override
	public int insertReservation(HashMap map) {
		return hDAO.insertReservation(sqlSession, map);
	}
	
	@Override
	public int isLikeHotel(LikeHotel l) {
		return hDAO.isLikeHotel(sqlSession, l);
	}
	
	@Override
	public int insertLikeHotel(LikeHotel l) {
		return hDAO.insertLikeHotel(sqlSession, l);
	}
	
	@Override
	public int deleteLikeHotel(LikeHotel l) {
		return hDAO.deleteLikeHotel(sqlSession, l);
	}
	
	@Override
	public ArrayList<Reservation> writableReview(HashMap map) {
		return hDAO.writableReview(sqlSession, map);
	}
	
	@Override
	public int insertReview(Review review) {
		return hDAO.insertReview(sqlSession, review);
	}
	
	@Override
	public ArrayList<Review> selectReviewList(int hotelId) {
		return hDAO.selectReviewList(sqlSession, hotelId);
	}
}
