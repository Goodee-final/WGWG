package com.min.edu.model.reservation;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import com.min.edu.vo.reservation.Reservation;
import com.min.edu.vo.reservation.Room;

@Repository
public class ReservationDaoImpl implements IReservationDao{

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	private final String NS = "com.min.edu.model.reservation.ReservationDaoImpl.";
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Override
	public List<Reservation> selectReservationByRoomno(int room_no) {
		logger.info("회의실별 예약 조회");
		return sqlSession.selectList(NS+"selectReservationByRoomno", room_no);
	}

	@Override
	public List<Room> selectRoomAll() {
		return sqlSession.selectList(NS+"selectRoomAll");
	}

	
}
