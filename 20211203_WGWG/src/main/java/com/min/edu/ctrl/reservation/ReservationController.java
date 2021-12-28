package com.min.edu.ctrl.reservation;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@PostMapping(value ="/insertReservation.do")
	public String insertReservation(HttpSession session, @RequestParam int room_no, @RequestParam String res_dt, @RequestParam String res_et, @RequestParam String res_title) {
		int emp_no = (Integer)session.getAttribute("loginEmp");
		Reservation rsv = new Reservation(res_title, res_dt, res_et, room_no, emp_no);
		rsvService.insertReservation(rsv);
		return "redirect:/reservation.do";
	}
	
	@GetMapping(value ="/empReservationList.do")
	public String selectResListByEmpno(HttpSession session, Model model) {
		int emp_no = (Integer)session.getAttribute("loginEmp");
		List<Reservation> rsvList = rsvService.selectResListByEmpno(emp_no);
		model.addAttribute("rsvList", rsvList);
		return "/reservation/reservationlist";
	}
	
	@GetMapping(value="/timeChk.do")
	@ResponseBody
	public String selectTime(@RequestParam int res_no) {
		String st = rsvService.selectRsvTime(res_no);
		return st;
	}
	
	@RequestMapping(value="/delReservation.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String deleteReservation(@RequestParam int res_no) {
		int cnt = rsvService.deleteReservation(res_no);
		return "redirect:/empReservationList.do";
//		return "/reservation/reservationlist";
	}
	
	@GetMapping(value="/adminRsvlist.do")
	public String adminRsvList(Model model) {
		List<Reservation> rsvList = rsvService.selectRsvCnt();
		model.addAttribute("rsvList",rsvList);
		return "/reservation/adminRsvlist";
	}
	
	@GetMapping(value="/insertRoom.do")
	public String insertRoom(@RequestParam String room_nm) {
		int cnt = rsvService.insertRoom(room_nm);
		return "redirect:/adminRsvlist.do";
	}
}
