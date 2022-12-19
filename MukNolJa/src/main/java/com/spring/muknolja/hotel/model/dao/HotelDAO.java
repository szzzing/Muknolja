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

	public int insertRoomAttm(SqlSessionTemplate sqlSession, ArrayList<AttachedFile> list) {
		return sqlSession.insert("hotelmapper.insertRoomAttm", list);
	}
	
	public int insertHotelAttm(SqlSessionTemplate sqlSession, ArrayList<AttachedFile> list) {
		return sqlSession.insert("hotelmapper.insertHotelAttm", list);
	}
	

	public Hotel selectHotel(SqlSessionTemplate sqlSession, int hotelId) {
		return sqlSession.selectOne("hotelmapper.selectHotel", hotelId);
	}

	public ArrayList<AttachedFile> selectHotelImg(SqlSessionTemplate sqlSession, int hotelId) {
		return (ArrayList)sqlSession.selectList("hotelmapper.selectHotelImg", hotelId);
	}

	public ArrayList<Room> selectAllRoom(SqlSessionTemplate sqlSession, int hotelId) {
		return (ArrayList)sqlSession.selectList("hotelmapper.selectAllRoom", hotelId);
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

	public int selectAvgRating(SqlSessionTemplate sqlSession, int hotelId) {
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

	public ArrayList<Hotel> selectHotelList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("hotelmapper.selectHotelList", null, rowBounds);
	}

	public ArrayList<AttachedFile> selectHotelImgList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage()-1)*pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("hotelmapper.selectHotelImgList", null, rowBounds);
	}

}
