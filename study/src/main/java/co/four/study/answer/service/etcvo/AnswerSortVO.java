package co.four.study.answer.service.etcvo;

import lombok.Data;

@Data
public class AnswerSortVO {
	
	// 질문
	private int questionId;
	
	// 검색 및 정렬 정보
	private String sortType;
	
	private String memberId;
	
	// 페이징 정보
	private int startRow;
	
	private int endRow;

}
