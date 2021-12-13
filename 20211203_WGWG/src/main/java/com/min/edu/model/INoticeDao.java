package com.min.edu.model;

import java.util.List;

import com.min.edu.vo.NoticeFileVO;
import com.min.edu.vo.PageVO;
import com.min.edu.vo.NoticeVO;

public interface INoticeDao {
	public List<NoticeVO> getAllList();

	public int insertBoard(NoticeVO vo);

	public int insertFile(NoticeFileVO vo);
	
	public NoticeVO getBoard(int notice_no);	

	public NoticeFileVO getFile(int notice_file_no);	
//	
	public int countNotice();
	
	public int countNoticechk(String notice_chk);
	
	public List<NoticeVO> selectNotice(PageVO vo);
	
	public int insertNotice(NoticeVO vo);
	
	public NoticeVO detailNotice(int notice_no);
	
	public List<NoticeVO> selectNotchk(PageVO vo);
	
	public int updateNotice(NoticeVO vo);
	
	public int deleteNotice(int notice_no);
	
	//페이징처리
	public List<NoticeVO> selectPaging(PageVO paging);
	public int selectTotalPaging();
}
