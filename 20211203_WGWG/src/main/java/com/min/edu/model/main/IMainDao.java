package com.min.edu.model.main;

import java.util.List;

import com.min.edu.vo.notice.NoticeVO;

public interface IMainDao {

	public List<NoticeVO> selectmainnotice();
}
