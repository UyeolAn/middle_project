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
}
