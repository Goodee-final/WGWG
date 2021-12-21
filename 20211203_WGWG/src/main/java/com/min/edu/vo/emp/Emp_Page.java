package com.min.edu.vo.emp;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Emp_Page {

Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private int pageCnt; //출력할 페이지 번호 갯수
	private int index; //출력할 페이지 번호
	private int pageStartNum; //출력할 페이지 시작 번호
	private int listCnt; //출력할 리스트 갯수(1페이지에 몇개씩 보일지)
	private int total; //리스트의 총 갯수(총 갯수를 리스트 갯수로 나눠야 페이지 수가 나온다)

	private String searchBy;
	private String searchWord;
	
	{
		logger.info("================== PagingDto 초기화 블럭 실행 시간 {} ==================",new Date());
		pageCnt = 5;
		index = 0;
		pageStartNum = 1;
		listCnt = 5;
		searchBy= "0";
		searchWord = "";
		
	}
	
	
	
	public Emp_Page() {
	}


	public Emp_Page(String index, String pageStartNum, String listCnt, String searchBy, String searchWord) {
		logger.info("================== PagingDto 생성자 호출 시간 ================== {}",new Date());
		
		if(index != null) {
			this.index = Integer.parseInt(index);
		}
		if(pageStartNum != null) {
			this.pageStartNum = Integer.parseInt(pageStartNum);
		}
		if(listCnt != null) {
			this.listCnt = Integer.parseInt(listCnt);
		}
		if(searchBy != null) {
			this.searchBy = searchBy;
		}
		if(searchWord != null) {
			this.searchWord = searchWord;
		}
		
	}
	

	public Emp_Page(int pageCnt, int index, int pageStartNum, int listCnt, int total, String searchBy,
			String searchWord) {
		super();
		this.pageCnt = pageCnt;
		this.index = index;
		this.pageStartNum = pageStartNum;
		this.listCnt = listCnt;
		this.total = total;
		this.searchBy = searchBy;
		this.searchWord = searchWord;
	}


	public int getStart() {
		logger.info("================== PagingDto getStart 호출 시간 ================== {}",new Date());
		return index*listCnt+1;
	}
	
	public int getLast() {
		logger.info("================== PagingDto getLast 호출 시간 ================== {}",new Date());
		return (index*listCnt)+listCnt;
	}
	
	public int getPageLastNum() {
		logger.info("================== PagingDto getPageLastNum 호출 실행 시간  ================== {}",new Date());
		
		//전체갯수-출력리스트*(시작번호-1)
		//128-5*(1-1) = 128
		int remainListCnt = total - listCnt*(pageStartNum-1); 
		
		//128/5 = 25...3
		int remainPageCnt = remainListCnt/listCnt;
		if(remainListCnt % listCnt != 0) {
			remainPageCnt++;
		}
		
		int pageLastNum = 0;
		
		if(remainListCnt < listCnt) {
			pageLastNum = pageStartNum;
		}else if(remainPageCnt <= pageCnt) {
			pageLastNum = remainPageCnt+pageStartNum-1;
		}else {
			pageLastNum = pageCnt+pageStartNum-1;
		}
		return pageLastNum;
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
	
	public String getSearchBy() {
		return searchBy;
	}

	public void setSearchBy(String searchBy) {
		this.searchBy = searchBy;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	@Override
	public String toString() {
		return "PagingDto [pageCnt=" + pageCnt + ", index=" + index + ", pageStartNum=" + pageStartNum + ", listCnt="
				+ listCnt + ", total=" + total + "]";
	}
}
