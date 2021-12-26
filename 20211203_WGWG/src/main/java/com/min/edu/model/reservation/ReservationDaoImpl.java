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

	@Override
	public boolean insertReservation(Reservation rsv) {
		int cnt = sqlSession.insert(NS+"insertReservation", rsv);
		return cnt>0?true:false;
	}

	@Override
	public List<Reservation> selectResListByEmpno(int emp_no) {
		return sqlSession.selectList(NS+"selectResListByEmpno", emp_no);
	}

	@Override
	public String selectRsvTime(int res_no) {
		return sqlSession.selectOne(NS+"selectRsvTime", res_no);
	}

	@Override
	public int deleteReservation(int res_no) {
		return sqlSession.delete(NS+"deleteReservation", res_no);
	}

	
}
