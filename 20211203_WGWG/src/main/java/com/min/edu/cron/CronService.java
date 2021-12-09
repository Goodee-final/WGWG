package com.min.edu.cron;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CronService{

	@Autowired
	private CronDao dao;
	
	@Transactional(value = "false")
	public void reset_seq() {
		dao.drop_seq();
		dao.create_seq();
		System.out.println("시퀀스 초기화 완료");
	}

	public void run_test() {
		dao.run_test();
	}

}
