package co.four.study.course.service;

import lombok.Data;

@Data
public class CourseVO {
	private int courseId;
	private String courseName;
	private String courseScript;
	private int coursePrice = -1;
	private String courseMainCategory;
	private String courseSubCategory;
	private String courseTeacher;
	private String courseGrade;
	private String courseImg;
	private int subCategoryCount; // 서브카테고리 수
	
	// 페이징 관련
	int start, end;
}
