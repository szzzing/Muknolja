package com.spring.muknolja.hotel.model.service;

import java.util.ArrayList;

import com.spring.muknolja.common.model.vo.AttachedFile;
import com.spring.muknolja.hotel.model.vo.Hotel;
import com.spring.muknolja.hotel.model.vo.Room;

public interface HotelService {

	int insertRoom(Room r);

	int insertRoomAttm(ArrayList<AttachedFile> list);
	
	int insertHotelAttm(ArrayList<AttachedFile> list);

	Hotel selectHotel(int hotelId);

	AttachedFile selectHotelImg(int hotelId);

	ArrayList<Room> selectAllRoom(int hotelId);

	ArrayList<AttachedFile> selectRoomImg(int roomId);

	AttachedFile selectRoomThumbnail(int roomId);

	int insertHotel(Hotel h);
	
	Room selectRoom(int roomId);
}
