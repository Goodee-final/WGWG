package com.min.edu.model;

import java.util.List;

import com.min.edu.vo.NoticeFileVO;
import com.min.edu.vo.NoticePageVO;
import com.min.edu.vo.NoticeVO;

public interface INoticeDao {
	public List<NoticeVO> getAllList();

	public int insertBoard(NoticeVO vo);

	public int insertFile(NoticeFileVO vo);
	
	public NoticeVO getBoard(int notice_no);	

	public NoticeFileVO getFile(int notice_file_no);	
	
	public int countNotice();
	
	public List<NoticeVO> selectNotice(NoticePageVO vo);
}
