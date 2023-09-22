package co.four.study.subcourse.service;

import lombok.Data;

@Data
public class SubCourseVO {
	private int subcourseId;
	private int courseId;
	private String subcourseName;
	private String subcourseLink;
	private int subcourseTime;
	
	// 서브강의 정렬번호
	int rwm;
}
