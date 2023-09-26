package co.four.study.memberCourse.service;

import lombok.Data;

@Data
public class MemberCourseSearchVO {
	
	// 검색 및 정렬 정보
	private String sortType;
	
	private String memberId;
	
	// 페이징 정보
	private int startRow;
	
	private int endRow;

}
