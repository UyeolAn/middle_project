package co.four.study.reply.service.etcvo;

import lombok.Data;

@Data
public class ReplySortVO {
	
	// 게시글
	private int boardId;
	
	// 정렬 정보
	private String sortType;
	
	// 페이징 정보
	private int startRow;
	
	private int endRow;

}
