package com.min.edu.vo;

public class NoticePageVO {
	private int pageSize;
	private int firstPageNo;
	private int prevPageNo;
	private int startPageNo;
	private int pageNo;
	private int endPageNo;
	private int nextPageNo;
	private int finalPageNo;
	private int totalCount;
	private int startList;
	private int endList;
	
	public NoticePageVO() {
	}

	public NoticePageVO(int pageSize, int pageNo, int totalCount) {
		super();
		this.pageSize = pageSize;
		this.pageNo = pageNo;
		this.totalCount = totalCount;
	}

	@Override
	public String toString() {
		return "NoticePageVO [pageSize=" + pageSize + ", firstPageNo=" + firstPageNo + ", prevPageNo=" + prevPageNo
				+ ", startPageNo=" + startPageNo + ", pageNo=" + pageNo + ", endPageNo=" + endPageNo + ", nextPageNo="
				+ nextPageNo + ", finalPageNo=" + finalPageNo + ", totalCount=" + totalCount + ", startList="
				+ startList + ", endList=" + endList + "]";
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getFirstPageNo() {
		return firstPageNo;
	}

	public void setFirstPageNo(int firstPageNo) {
		this.firstPageNo = firstPageNo;
	}

	public int getPrevPageNo() {
		return prevPageNo;
	}

	public void setPrevPageNo(int prevPageNo) {
		this.prevPageNo = prevPageNo;
	}

	public int getStartPageNo() {
		return startPageNo;
	}

	public void setStartPageNo(int startPageNo) {
		this.startPageNo = startPageNo;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getEndPageNo() {
		return endPageNo;
	}

	public void setEndPageNo(int endPageNo) {
		this.endPageNo = endPageNo;
	}

	public int getNextPageNo() {
		return nextPageNo;
	}

	public void setNextPageNo(int nextPageNo) {
		this.nextPageNo = nextPageNo;
	}

	public int getFinalPageNo() {
		return finalPageNo;
	}

	public void setFinalPageNo(int finalPageNo) {
		this.finalPageNo = finalPageNo;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		this.makgePage();
	}
	private void makgePage() {		
		if(this.totalCount == 0) { return; }
		if(this.pageNo==0) {this.setPageNo(1);}
		if(this.pageSize==0) {this.setPageSize(10);}
		
		int finalPage = (totalCount+(pageSize-1))/pageSize; // 110+10 / 10   11페이지
		if(this.pageNo > finalPage) {this.setPageNo(finalPage);}
		if(this.endPageNo<0 || this.pageNo>finalPage) {this.setPageNo(1);}
		
		boolean isNowFirst = pageNo == 1?true:false;
		boolean isNowFinal = pageNo == finalPage?true:false;
		
		int startPage = ((pageNo-1)/10)*10+1;
		int endPage = startPage+9;
		
		int startListNo = pageNo*10-9; // 1
		int endListNo = pageNo+10; //10
		
		if(endPage > finalPage) {
			endPage = finalPage;
		}
		
		this.setFinalPageNo(1);
		if(isNowFirst) {
			this.setPrevPageNo(1);
		}else {
			this.setPrevPageNo((pageNo-1)<1?1:(pageNo-1));
		}
		
		this.setStartList(startListNo);
		this.setEndList(endListNo);
		this.setStartPageNo(startPage);
		this.setEndPageNo(endPage);
		
		if(isNowFinal) {
			this.setNextPageNo(finalPage);
		}else {
			this.setNextPageNo((pageNo+1)>finalPage?finalPage:(pageNo+1));
		}
		this.setFinalPageNo(finalPage);
	}

	public int getStartList() {
		return startList;
	}

	public void setStartList(int startList) {
		this.startList = startList;
	}

	public int getEndList() {
		return endList;
	}

	public void setEndList(int endList) {
		this.endList = endList;
	}
	
	
	
}
