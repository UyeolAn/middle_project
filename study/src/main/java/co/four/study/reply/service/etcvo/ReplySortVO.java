package co.four.study.reply.service.etcvo;

import lombok.Data;

@Data
public class ReplySortVO {
	
	// 게시글
	private int boardId;
	
	// 검색 및 정렬 정보
	private String sortType;
	
	private String memberId;
	
	// 페이징 정보
	private int startRow;
	
	private int endRow;

}
