package com.min.edu.ctrl.reservation;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ReservationController {

	@RequestMapping(value="/reservationist.do", method=RequestMethod.GET)
	public String ReservationList() {
		
		return "/reservation/reservationlist";
	}
	
	@RequestMapping(value="/reservation.do", method=RequestMethod.GET)
	public String Reservation() {
		
		return "/reservation/reservation";
	}
}
