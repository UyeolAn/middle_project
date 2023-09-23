package co.four.study.question.service.etcvo;

import lombok.Data;

@Data
public class QuestionSearchVO {

	// 검색 및 정렬 정보
	private String searchType;
	
	private String searchContent;
	
	private String searchCourse;
	
	private String sortType;
	
	// 페이징 정보
	private int startRow;
	
	private int endRow;
	
}
