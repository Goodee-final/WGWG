package com.min.edu.model.reservation;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.min.edu.vo.reservation.Reservation;
import com.min.edu.vo.reservation.Room;

@Service
public class ReservationServiceImpl implements IReservationService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private IReservationDao dao;
	
	@Override
	public List<Reservation> selectReservationByRoomno(int room_no) {
		logger.info("회의실 별 예약내역 조회 {}", room_no);
		return dao.selectReservationByRoomno(room_no);
	}

	@Override
	public List<Room> selectRoomAll() {
		logger.info("회의실 목록 조회");
		return dao.selectRoomAll();
	}

}
