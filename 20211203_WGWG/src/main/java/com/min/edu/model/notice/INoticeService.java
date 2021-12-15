package com.min.edu.model.notice;

import java.util.List;

import com.min.edu.vo.notice.NoticeFileVO;
import com.min.edu.vo.notice.NoticeVO;
import com.min.edu.vo.paging.PageVO;

public interface INoticeService {
	public List<NoticeVO> getAllList();

	public int insertBoardF(NoticeVO nvo,NoticeFileVO fvo);
	
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
	
	public int deleteNoticeFile(int notice_no);
	
	public int deleteNF(int notice_no);
	//페이징처리
	public List<NoticeVO> selectPaging(PageVO paging);
	public int selectTotalPaging();
}
