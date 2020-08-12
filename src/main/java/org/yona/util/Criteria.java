package org.yona.util;

public class Criteria {
	
	private int page; // 현재 페이지
	private int perPageNum; // 한 페이지당 보여질 게시물 숫자
	private int replyPageNum; // 한 페이지당 보여질 댓글 숫자
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
		this.replyPageNum = 7;
	}
	
	public void setPage(int page) {
		if(page <= 0) {
			page = 1;
		}
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <= 0 || perPageNum > 100) {
			perPageNum = 10;
		}
		this.perPageNum = perPageNum;
	}

	public void setReplyPageNum(int replyPageNum) {
		if(replyPageNum <= 0 || replyPageNum > 20) {
			replyPageNum = 7;
		}
		this.replyPageNum = replyPageNum;
	}
	
	public int getPage() {
		return page;
	}

	//method for Mybatis SQL
	public int getPerPageNum() {
		return perPageNum;
	}
	
	//method for Mybatis SQL
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
	//method for Mybatis SQL
	public int getReplyPageNum() {
		return replyPageNum;
	}
	
	//method for Mybatis SQL
	public int getRplStart() {
		return (this.page - 1) * replyPageNum;
	}
	
	
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", replyPageNum=" + replyPageNum +"]";
	}

}
