package co.four.study.course.service;

import lombok.Data;

@Data
public class CourseSearchVO {

	// 검색 및 정렬 정보	
	private String memberId;
	
	// 페이징 정보
	private int startRow;
	
	private int endRow;
	
}
