package com.min.edu.cron;

public interface CronDao {

	public void drop_seq();
	
	public void create_seq();
	
	public void run_test();
	
}
