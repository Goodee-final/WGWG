package com.min.edu.model.reservation;

import java.util.List;

import com.min.edu.vo.reservation.Reservation;
import com.min.edu.vo.reservation.Room;

public interface IReservationService {

	public List<Reservation> selectReservationByRoomno(int room_no);
	public List<Room> selectRoomAll();
}
