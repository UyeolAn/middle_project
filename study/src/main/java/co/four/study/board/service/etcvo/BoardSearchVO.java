package co.four.study.board.service.etcvo;

import lombok.Data;

@Data
public class BoardSearchVO {
	
	// 검색 및 정렬 정보
	private String searchType;
	
	private String searchContent;
	
	private String sortType;
	
	private String memberId;
	
	// 페이징 정보
	private int startRow;
	
	private int endRow;
	
}
