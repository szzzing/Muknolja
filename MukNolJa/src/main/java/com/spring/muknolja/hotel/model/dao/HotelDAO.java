package com.spring.muknolja.hotel.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.hotel.model.vo.Hotel;
import com.spring.muknolja.hotel.model.vo.LikeHotel;
import com.spring.muknolja.hotel.model.vo.Reservation;
import com.spring.muknolja.hotel.model.vo.Review;
import com.spring.muknolja.hotel.model.vo.Room;

@Repository("hDAO")
public class HotelDAO {

	public int insertRoom(SqlSessionTemplate sqlSession, Room r) {
		return sqlSession.insert("hotelmapper.insertRoom", r);
	}

	public int insertRoomImg(SqlSessionTemplate sqlSession, ArrayList<AttachedFile> list) {
		return sqlSession.insert("hotelmapper.insertRoomImg", list);
	}
	
	public int insertHotelImg(SqlSessionTemplate sqlSession, ArrayList<AttachedFile> list) {
		return sqlSession.insert("hotelmapper.insertHotelImg", list);
	}
	

	public Hotel selectHotel(SqlSessionTemplate sqlSession, int hotelId) {
		return sqlSession.selectOne("hotelmapper.selectHotel", hotelId);
	}

	public ArrayList<AttachedFile> selectHotelImg(SqlSessionTemplate sqlSession, int hotelId) {
		return (ArrayList)sqlSession.selectList("hotelmapper.selectHotelImg", hotelId);
	}

	public ArrayList<Room> selectAllRoom(SqlSessionTemplate sqlSession, HashMap map) {
		return (ArrayList)sqlSession.selectList("hotelmapper.selectAllRoom", map);
	}

	public ArrayList<AttachedFile> selectRoomImg(SqlSessionTemplate sqlSession, int roomId) {
		return (ArrayList)sqlSession.selectList("hotelmapper.selectRoomImg", roomId);
	}

	public AttachedFile selectRoomThumbnail(SqlSessionTemplate sqlSession, int roomId) {
		return sqlSession.selectOne("hotelmapper.selectRoomThumbnail", roomId);
	}

	public int insertHotel(SqlSessionTemplate sqlSession, Hotel h) {
		return sqlSession.insert("hotelmapper.insertHotel", h);
	}

	public Room selectRoom(SqlSessionTemplate sqlSession, int roomId) {
		return sqlSession.selectOne("hotelmapper.selectRoom", roomId);
	}

	public int getCurrentReservationId(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("hotelmapper.getCurrentReservationId");
	}

	public int insertReservation(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.insert("hotelmapper.insertReservation", map);
	}

	public int isLikeHotel(SqlSessionTemplate sqlSession, LikeHotel l) {
		return sqlSession.selectOne("hotelmapper.isLikeHotel", l);
	}

	public int insertLikeHotel(SqlSessionTemplate sqlSession, LikeHotel l) {
		return sqlSession.insert("hotelmapper.insertLikeHotel", l);
	}

	public int deleteLikeHotel(SqlSessionTemplate sqlSession, LikeHotel l) {
		return sqlSession.delete("hotelmapper.deleteLikeHotel", l);
	}

	public ArrayList<Reservation> writableReview(SqlSessionTemplate sqlSession, HashMap map) {
		return (ArrayList)sqlSession.selectList("hotelmapper.writableReview", map);
	}

	public int insertReview(SqlSessionTemplate sqlSession, Review review) {
		return sqlSession.insert("hotelmapper.insertReview", review);
	}

	public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession, int hotelId) {
		return (ArrayList)sqlSession.selectList("hotelmapper.selectReviewList", hotelId);
	}

	public ArrayList<AttachedFile> selectAllRoomThumbnail(SqlSessionTemplate sqlSession, int hotelId) {
		return (ArrayList)sqlSession.selectList("hotelmapper.selectAllRoomThumbnail", hotelId);
	}

	public double selectAvgRating(SqlSessionTemplate sqlSession, int hotelId) {
		return sqlSession.selectOne("hotelmapper.selectAvgRating", hotelId);
	}

	public int selectReviewCount(SqlSessionTemplate sqlSession, int hotelId) {
		return sqlSession.selectOne("hotelmapper.selectReviewCount", hotelId);
	}

	public Hotel selectHotelById(SqlSessionTemplate sqlSession, String id) {
		return sqlSession.selectOne("hotelmapper.selectHotelById", id);
	}

	public int getListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("hotelmapper.getListCount");
	}
	
	public int getSearchListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("hotelmapper.getSearchListCount");
	}

	public ArrayList<Hotel> searchHotelList(SqlSessionTemplate sqlSession, HashMap searchMap, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("hotelmapper.searchHotelList", searchMap, rowBounds);
	}

	public int updateHotel(SqlSessionTemplate sqlSession, Hotel h) {
		return sqlSession.update("hotelmapper.updateHotel", h);
	}

	public int updateHotelImg(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.insert("hotelmapper.updateHotelImg", map);
	}
	
	public int deleteFile(SqlSessionTemplate sqlSession, ArrayList<String> list) {
		return sqlSession.delete("hotelmapper.deleteFile", list);
	}

	public int updateHotelThumbnail(SqlSessionTemplate sqlSession, int hotelId) {
		return sqlSession.update("hotelmapper.updateHotelThumbnail", hotelId);
	}

	public int updateRoomImg(SqlSessionTemplate sqlSession, HashMap map) {
		return sqlSession.insert("hotelmapper.updateRoomImg", map);
	}

	public int updateRoomThumbnail(SqlSessionTemplate sqlSession, int roomId) {
		return sqlSession.update("hotelmapper.updateRoomThumbnail", roomId);
	}

	public int updateRoom(SqlSessionTemplate sqlSession, Room r) {
		return sqlSession.update("hotelmapper.updateRoom", r);
	}

	public int deleteRoom(SqlSessionTemplate sqlSession, int roomId) {
		return sqlSession.update("hotelmapper.deleteRoom", roomId);
	}

	public int deleteRoomImg(SqlSessionTemplate sqlSession, int roomId) {
		return sqlSession.update("hotelmapper.deleteRoomImg", roomId);
	}

}
