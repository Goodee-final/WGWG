package com.min.edu.ctrl.reservation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.min.edu.model.reservation.IReservationService;
import com.min.edu.vo.reservation.Reservation;
import com.min.edu.vo.reservation.Room;

@Controller
public class ReservationController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	IReservationService rsvService;
	
//	@RequestMapping(value="/reservationist.do", method=RequestMethod.GET)
//	public String ReservationList() {
//		
//		return "/reservation/reservationlist";
//	}
	
	@RequestMapping(value="/reservation.do", method=RequestMethod.GET)
	public String Reservation(Model model) {
		List<Room> roomList = rsvService.selectRoomAll();
		model.addAttribute("roomList", roomList);
		return "/reservation/reservation";
	}
	
	@GetMapping(value = "/chkReservation.do")
	public String ReservationList(Model model, HttpServletRequest req, @RequestParam int room_no) {
		logger.info("room_no {}" , room_no);
		List<Reservation> rsvList = rsvService.selectReservationByRoomno(room_no);
		model.addAttribute("rsvList", rsvList);
		return "/../../ajax/rsvdate";
	}
}
