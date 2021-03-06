package org.yona.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.web.util.UriComponents;
import org.springframework.web.util.UriComponentsBuilder;

public class PageUtil {

	private int BDtotal; // 전체 게시물 개수
	private int Rpltotal; // 전체 댓글 개수
	private int startPage; // 페이지 시작 번호
	private int endPage; // 페이지 끝 번호
	private boolean prev; // 페이지 이전목록 이동
	private boolean next; // 페이지 다음목록 이동

	private int displayPageNum = 10; // 번호를 몇개씩 보여줄지 ex) 1,2,3,4,5,6,7,8,9,10

	private Criteria cri;

	public int getBDtotal() {
		return BDtotal;
	}

	public void setBDtotal(int bDtotal) {
		this.BDtotal = bDtotal;
		calcBDPage();
	}
	
	public int getRpltotal() {
		return BDtotal;
	}

	public void setRpltotal(int rpltotal) {
		this.Rpltotal = rpltotal;
		calcRplPage();
	}
	
	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}

	public int getDisplayPageNum() {
		return displayPageNum;
	}

	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	
	public Criteria getCri() {
		return cri;
	}

	public void setCri(Criteria cri) {
		this.cri = cri;
	}


	// 게시글 시작페이지,끝 페이지 구하기
	public void calcBDPage() {

		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);

		startPage = endPage - (displayPageNum - 1);

		int tempEndPage = (int) (Math.ceil(BDtotal / (double) cri.getPerPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}

		prev = startPage == 1 ? false : true;
		next = endPage * cri.getPerPageNum() >= BDtotal ? false : true;

	}
	
	// 댓글 시작페이지,끝 페이지 구하기
	public void calcRplPage() {

		endPage = (int) (Math.ceil(cri.getPage() / (double) displayPageNum) * displayPageNum);

		startPage = endPage - (displayPageNum - 1);

		int tempEndPage = (int) (Math.ceil(Rpltotal / (double) cri.getReplyPageNum()));
		if (endPage > tempEndPage) {
			endPage = tempEndPage;
		}

		prev = startPage == 1 ? false : true;
		next = endPage * cri.getReplyPageNum() >= Rpltotal ? false : true;

	}

	
	// 페이지 이동할때 필요한 정보를 가지고 가기 위한 쿼리
	public String makeQuery(int page) {

		UriComponents uriCompo = UriComponentsBuilder.newInstance()
								.queryParam("page", page)
								.queryParam("perPageNum", cri.getPerPageNum())
								.queryParam("searchType", ((SearchCriteria) cri).getSearchType())
								.queryParam("keyword", encoding(((SearchCriteria) cri).getKeyword()))
								.build();

		return uriCompo.toString();
	}

	
	// 검색할 때 현재페이지와 페이지당 보여질 게시물 숫자 정보를 가지고 검색하기 위한 쿼리
	public String makeSearch(int page) {

		UriComponents uricompo = UriComponentsBuilder.newInstance()
								.queryParam("page", page)
								.queryParam("perPageNum", cri.getPerPageNum())
								.build();

		return uricompo.toString();
	}

	
	// UTF8 버전으로 변환하는 쿼리
	public String encoding(String keyword) {

		if (keyword == null || keyword.trim().length() == 0) {
			return "";
		}

		try {
			return URLEncoder.encode(keyword, "UTF-8");
		} catch (UnsupportedEncodingException e) {
			System.out.println("encoding Error = " + e);
			return "";
		}
	}

	@Override
	public String toString() {
		return "PageUtil [BDtotal=" + BDtotal + ", Rpltotal="+ Rpltotal +", startPage=" + startPage + ", endPage=" + endPage + ", prev="
				+ prev + ", next=" + next + "," + displayPageNum + ", cri=" + cri + "]";
	}

}
