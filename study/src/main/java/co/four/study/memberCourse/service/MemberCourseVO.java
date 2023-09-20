package co.four.study.memberCourse.service;

import lombok.Data;

@Data
public class MemberCourseVO {
	private String memberId;
	private int courseId;
	//회원이 들은 강의별 강의 갯수
	private int count;
	//회원이 들어야하는 강의별 강의 갯수
	private int tcnt;
	private double jindo;  //과정별 진도율
	private String courseName;
	
	//강의 카테고리
	private String courseMainCategory;
	
	//카테고리별 수강률
	private double category;
	
	
}
