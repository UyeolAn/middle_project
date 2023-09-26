package co.four.study.memberCourse.service;

import java.util.List;

import co.four.study.course.service.CourseSearchVO;
import co.four.study.course.service.CourseVO;
import co.four.study.member.service.MemberVO;

public interface MemberCourseService {
	List<MemberCourseVO> selectMemberCourseList(MemberVO vo);

	MemberCourseVO selectMemberCourse(MemberCourseVO vo);

	int insertMemberCourse(MemberCourseVO vo);

	int deleteMemberCourse(MemberCourseVO vo);

	// 진도율
	MemberCourseVO countJindo(MemberCourseVO vo);

	// 회원이 수강하는 카테고리
	List<String> category(MemberVO vo);

	// 회원이 수강하는 강의 가격 합
	int priceSum(MemberVO vo);

	// 강의 별 회원수 조회
	int courseStudent(CourseVO vo);

	// 회원 별 수강하는 카테고리 (중복X)
	List<String> distinctStudentCategory(MemberCourseVO vo);

	// 회원/카테고리 별 갯수
	int countStudentCategory(MemberCourseVO vo);

	// 현재 총 매출
	int totalPrice();

	// 회원수강여부 체크
	int memberCourseStatus(MemberCourseVO vo);

	//회원이 수강하는 강의 목록
	List<MemberCourseVO> selectMemberCourseListDetail(MemberVO vo);

	//회원이 수강신청한 강의 ID/이름 가져오기
	List<MemberCourseQnaVO> selectMemberCourseWithName(String id);

	//현재 수강하는 과목들 서브카테고리별 분포
	int distributionSubcategory(CourseVO vo);

	//진도율 올리기
	int memberCourseCount(MemberCourseVO vo);

	//회원이 수강신청한 강의 카운트
	int countMemberCourses(CourseSearchVO vo);
	
	//회원 구매내역 카운트
	int countPayments(MemberCourseSearchVO vo);
	
	//회원이 수강신청한 강의 페이징해서 가져오기
	List<CourseVO> selectCourseWithPaging(CourseSearchVO vo);
	
	//회원이 구매내역 페이징해서 가져오기
	List<PaymentVO> selectPaymentWithPaging(MemberCourseSearchVO vo);

}
