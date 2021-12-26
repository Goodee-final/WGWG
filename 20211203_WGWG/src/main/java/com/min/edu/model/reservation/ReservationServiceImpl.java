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

	@Override
	public boolean insertReservation(Reservation rsv) {
		logger.info("예약 등록하기", rsv);
		return dao.insertReservation(rsv);
	}

	@Override
	public List<Reservation> selectResListByEmpno(int emp_no) {
		logger.info("사원 예약내역 조회 조회할 사원 번호{}", emp_no);
		return dao.selectResListByEmpno(emp_no);
	}

	@Override
	public String selectRsvTime(int res_no) {
		logger.info("예약 시간 조회 {}", res_no);
		return dao.selectRsvTime(res_no);
	}

	@Override
	public int deleteReservation(int res_no) {
		logger.info("예약 삭제{}", res_no);
		return dao.deleteReservation(res_no);
	}

}
