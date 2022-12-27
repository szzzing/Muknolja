package com.spring.muknolja.hotel.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.common.model.vo.PageInfo;
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
	public int insertRoomImg(ArrayList<AttachedFile> list) {
		return hDAO.insertRoomImg(sqlSession, list);
	}
	
	@Override
	public int insertHotelImg(ArrayList<AttachedFile> list) {
		return hDAO.insertHotelImg(sqlSession, list);
	}
	
	@Override
	public Hotel selectHotel(int hotelId) {
		return hDAO.selectHotel(sqlSession, hotelId);
	}
	
	@Override
	public ArrayList<AttachedFile> selectHotelImg(int hotelId) {
		return hDAO.selectHotelImg(sqlSession, hotelId);
	}
	
	@Override
	public ArrayList<Room> selectAllRoom(HashMap map) {
		return hDAO.selectAllRoom(sqlSession, map);
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
	
	@Override
	public ArrayList<AttachedFile> selectAllRoomThumbnail(int hotelId) {
		return hDAO.selectAllRoomThumbnail(sqlSession, hotelId);
	}
	
	@Override
	public double selectAvgRating(int hotelId) {
		return hDAO.selectAvgRating(sqlSession, hotelId);
	}
	
	@Override
	public int selectReviewCount(int hotelId) {
		return hDAO.selectReviewCount(sqlSession, hotelId);
	}
	
	@Override
	public Hotel selectHotelbyId(String id) {
		return hDAO.selectHotelById(sqlSession, id);
	}
	
	@Override
	public int getListCount() {
		return hDAO.getListCount(sqlSession);
	}
	
	@Override
	public int getSearchListCount() {
		return hDAO.getSearchListCount(sqlSession);
	}
	
	@Override
	public ArrayList<Hotel> searchHotelList(HashMap searchMap, PageInfo pi) {
		return hDAO.searchHotelList(sqlSession, searchMap, pi);
	}
	
	@Override
	public int updateHotel(Hotel h) {
		return hDAO.updateHotel(sqlSession, h);
	}
	
	@Override
	public int updateHotelImg(HashMap map) {
		return hDAO.updateHotelImg(sqlSession, map);
	}
	
	@Override
	public int updateRoomImg(HashMap map) {
		return hDAO.updateRoomImg(sqlSession, map);
	}
	
	@Override
	public int deleteFile(ArrayList<String> deleteImgList) {
		return hDAO.deleteFile(sqlSession, deleteImgList);
	}
	
	@Override
	public int updateHotelThumbnail(int hotelId) {
		return hDAO.updateHotelThumbnail(sqlSession, hotelId);
	}
	
	@Override
	public int updateRoomThumbnail(int roomId) {
		return hDAO.updateRoomThumbnail(sqlSession, roomId);
	}
	
	@Override
	public int updateRoom(Room r) {
		return hDAO.updateRoom(sqlSession, r);
	}
	
	@Override
	public int deleteRoom(int roomId) {
		return hDAO.deleteRoom(sqlSession, roomId);
	}
	
	@Override
	public int deleteRoomImg(int roomId) {
		return hDAO.deleteRoomImg(sqlSession, roomId);
	}
}
