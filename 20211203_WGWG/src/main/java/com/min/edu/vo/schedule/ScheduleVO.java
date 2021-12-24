package com.min.edu.vo.schedule;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Data
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ScheduleVO {
	private int schedule_no;
	private String schedule_title;
	private String schedule_content;
	private String schedule_startday;
	private String schedule_endday;
	private String allday;
	private String schedule_tx_color;
	private String schedule_bg_color;
	private String schedule_chk;
	private int emp_no;
	private List<SharedScheduleVO> sharedschedule;
}
