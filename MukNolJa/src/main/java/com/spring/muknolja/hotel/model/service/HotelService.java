package com.spring.muknolja.hotel.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.common.model.vo.PageInfo;
import com.spring.muknolja.common.model.vo.Report;
import com.spring.muknolja.hotel.model.vo.Hotel;
import com.spring.muknolja.hotel.model.vo.LikeHotel;
import com.spring.muknolja.hotel.model.vo.Review;
import com.spring.muknolja.hotel.model.vo.Reservation;
import com.spring.muknolja.hotel.model.vo.Room;

public interface HotelService {

	int insertRoom(Room r);

	int insertRoomImg(ArrayList<AttachedFile> list);
	
	int insertHotelImg(ArrayList<AttachedFile> list);

	Hotel selectHotel(int hotelId);

	ArrayList<AttachedFile> selectHotelImg(int hotelId);

	ArrayList<Room> selectAllRoom(HashMap map);

	ArrayList<AttachedFile> selectRoomImg(int roomId);

	AttachedFile selectRoomThumbnail(int roomId);

	int insertHotel(Hotel h);
	
	Room selectRoom(int roomId);

	int getCurrentReservationId();

	int insertReservation(HashMap map);

	int isLikeHotel(LikeHotel l);

	int insertLikeHotel(LikeHotel l);

	int deleteLikeHotel(LikeHotel l);

	ArrayList<Reservation> writableReview(HashMap map);

	int insertReview(Review reply);

	ArrayList<Review> selectReviewList(HashMap map, PageInfo pi);

	ArrayList<AttachedFile> selectAllRoomThumbnail(int hotelId);

	int selectReviewCount(int hotelId);

	double selectAvgRating(int hotelId);

	Hotel selectHotelbyId(String id);

	int getSearchListCount(HashMap searchMap);
	
	int getSearchListCount();

	ArrayList<Hotel> searchHotelList(HashMap searchMap, PageInfo pi);

	int updateHotel(Hotel h);

	int updateHotelImg(HashMap map);

	int deleteFile(ArrayList<String> deleteImgList);

	int updateHotelThumbnail(int hotelId);

	int updateRoomImg(HashMap map);

	int updateRoomThumbnail(int roomId);

	int updateRoom(Room r);

	int deleteRoom(int roomId);

	int deleteRoomImg(int roomId);

	int insertReply(HashMap map);

	int getReservationListCount(HashMap map);

	ArrayList<Reservation> selectReservationList(HashMap map, PageInfo pi);

	int getReviewListCount(HashMap map);

	int deleteReservation(int reservationId);

	int getCurrReservationId();

	int insertReport(Report report);

	ArrayList<HashMap> selectReservationWeekStastics(int hotelId);

}
