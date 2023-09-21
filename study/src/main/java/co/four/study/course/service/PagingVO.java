package co.four.study.course.service;

import lombok.Data;

@Data
public class PagingVO {
	// 현재페이지, 시작페이지, 끝페이지, 게시글 총 갯수, 페이지당 글 객수, 마지막페이지
	private int nowPage, startPage, endPage, total, cntPerPage, lastPage;
	// SQL쿼리에 쓸 start, end
	private int start, end;
	private int cntPage = 5;
	
	public PagingVO() {}
	
	public PagingVO(int total, int nowPage, int cntPerPage) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage()); // 제일 마지막 페이지
		calcStartEndPage(getNowPage(), cntPage); // 시작, 끝 페이지 계산
		calcStartEnd(getNowPage(), getCntPerPage()); // DB에서 사용할 start, end 계산
		
	}

	// DB에서 사용할 start, end 계산
	private void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}

	// 시작, 끝 페이지 계산
	private void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
		if(getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if(getStartPage() < 1) {
			setStartPage(1);
		}
	}

	// 제일 마지막 페이지 계산
	private void calcLastPage(int total, int cntPerPage) {
		setLastPage((int)Math.ceil((double)total / (double)cntPerPage));
	}
	
	
}
