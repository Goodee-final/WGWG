package com.min.edu.model.reservation;

import java.util.List;

import com.min.edu.vo.reservation.Reservation;
import com.min.edu.vo.reservation.Room;

public interface IReservationService {

	public List<Reservation> selectReservationByRoomno(int room_no);
	public List<Room> selectRoomAll();
	public boolean insertReservation(Reservation rsv);
	public List<Reservation> selectResListByEmpno(int emp_no);
	public String selectRsvTime(int res_no);
	public int deleteReservation(int res_no);
	public List<Reservation> selectRsvCnt();
	public int insertRoom(String room_nm);
	public int updateRoom(Room room);
}
