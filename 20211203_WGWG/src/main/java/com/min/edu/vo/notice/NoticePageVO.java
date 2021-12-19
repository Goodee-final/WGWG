package com.min.edu.vo.notice;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class NoticePageVO {
Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private int pageCnt; 		// 출력한 페이지 번호 개수
	private int index;			// 출력할 페이지 번호
	private int pageStartNum;	// 출력할 페이지 시작 번호
	private int listCnt;		// 출력한 리스트 개수
	private int total;			// 리스트의 총 개수
	
	private String notice_chk;
	private String searchKeyword;
	{
		logger.info("============ PagingDto 초기화 블럭 실행 시간 {} ============", new Date());
		pageCnt = 5;
		index = 0;
		pageStartNum = 1;
		listCnt = 5;
	}

	public NoticePageVO() {
		
	}

	
	public NoticePageVO(String index, String pageStartNum, String listCnt,String notice_chk,String searchKeyword) {
		logger.info("============ PagingDto 생성자 호출 실행 시간 {} ============", new Date());
		// view에서 전달 받은 parameter는 "" or null 객체로 판단하면
		// index의 초기값 0일 수 있음 하지만 parameter로 객체로 받을 경우 0과 값이 없음을 구분하기 편해짐
		if(index != null) {
			this.index = Integer.parseInt(index);
		}
		if(pageStartNum != null) {
			this.pageStartNum = Integer.parseInt(pageStartNum);
		}
		if(listCnt != null) {
			this.listCnt = Integer.parseInt(listCnt);
		}
		if(notice_chk != null) {
			this.notice_chk =notice_chk;
		}
		if(searchKeyword  != null) {
			this.searchKeyword =searchKeyword;
		}
	}
	public int getStart() {
		logger.info("============ PagingDto getStart 호출 실행 시간 {} ============", new Date());
		return index*listCnt +1;
	}
	
	public int getLast() {
		logger.info("============ PagingDto getLast 호출 실행 시간 {} ============", new Date());
		return (index*listCnt)+listCnt;
	}
	
	public int getPageLastNum() {
		logger.info("============ PagingDto getPageLastNum 호출 실행 시간 {} ============", new Date());
		//전체개수 - 출력리스트 *(시작번호-1)
		//111 - 5*(1-1) = 111
		int remainListCnt = total - listCnt *(pageStartNum-1);
		// 111/5 = 22
		int remainPageCnt = remainListCnt/listCnt;
		// 111%5 != => 23
		if(remainPageCnt % listCnt != 0) {
			remainPageCnt++;
		}
		
		int pageLastNum = 0;
		if(remainListCnt <= listCnt) {
			pageLastNum = pageStartNum;
		}else if (remainPageCnt <= pageCnt) {
			pageLastNum = remainPageCnt + pageStartNum-1;
		}else {
			pageLastNum = pageCnt+pageStartNum-1;
		}
		return pageLastNum;
	}

	public Logger getLogger() {
		return logger;
	}

	public void setLogger(Logger logger) {
		this.logger = logger;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}

	public int getPageStartNum() {
		return pageStartNum;
	}

	public void setPageStartNum(int pageStartNum) {
		this.pageStartNum = pageStartNum;
	}

	public int getListCnt() {
		return listCnt;
	}

	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	
	public String getNotice_chk() {
		return notice_chk;
	}

	public void setNotice_chk(String notice_chk) {
		this.notice_chk = notice_chk;
	}

	public String getSearchKeyword() {
		return searchKeyword;
	}


	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}


	@Override
	public String toString() {
		return "NoticePageVO [logger=" + logger + ", pageCnt=" + pageCnt + ", index=" + index + ", pageStartNum="
				+ pageStartNum + ", listCnt=" + listCnt + ", total=" + total + ", notice_chk=" + notice_chk
				+ ", searchKeyword=" + searchKeyword + "]";
	}


	
	
}
