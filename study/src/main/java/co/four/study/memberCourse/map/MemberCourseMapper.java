package co.four.study.memberCourse.map;

import java.util.List;

import co.four.study.course.service.CourseVO;
import co.four.study.member.service.MemberVO;
import co.four.study.memberCourse.service.MemberCourseVO;

public interface MemberCourseMapper {
	List<MemberCourseVO> selectMemberCourseList(MemberVO vo);
	MemberCourseVO selectMemberCourse(MemberCourseVO vo);
	int insertMemberCourse(MemberCourseVO vo);
	int deleteMemberCourse(MemberCourseVO vo);
	
	MemberCourseVO countJindo(MemberCourseVO vo);
	
	//회원이 수강하는 카테고리
	List<String> category(MemberVO vo);
	
	//회원이 수강하는 강의 가격 합
	int priceSum(MemberVO vo);
	
	//강의 별 회원수 조회
	int courseStudent(CourseVO vo);
	
	//회원 별 수강하는 카테고리 (중복X)
	List<String> distinctStudentCategory (MemberCourseVO vo);
	
	//회원/카테고리 별 갯수
	int countStudentCategory(MemberCourseVO vo);
	
	//현재 총 매출
	int totalPrice();
	
	//회원수강여부 체크
	int memberCourseStatus(MemberCourseVO vo);
}
