package co.four.study.course.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.four.study.bucket.service.BucketService;
import co.four.study.bucket.service.BucketVO;
import co.four.study.bucket.serviceImpl.BucketServiceImpl;
import co.four.study.common.ViewResolve;
import co.four.study.course.service.CourseService;
import co.four.study.course.service.CourseVO;
import co.four.study.course.serviceImpl.CourseServiceImpl;
import co.four.study.memberCourse.service.MemberCourseService;
import co.four.study.memberCourse.service.MemberCourseVO;
import co.four.study.memberCourse.serviceImpl.MemberCourseServiceImpl;
import co.four.study.review.service.ReviewService;
import co.four.study.review.service.ReviewVO;
import co.four.study.review.serviceImpl.ReviewServiceImpl;
import co.four.study.subcourse.service.SubCourseService;
import co.four.study.subcourse.service.SubCourseVO;
import co.four.study.subcourse.serviceImpl.SubCourseServiceImpl;

@WebServlet("/coursedetail.do")
public class CourseDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CourseDetail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		CourseService dao = new CourseServiceImpl();
		SubCourseService sdao = new SubCourseServiceImpl();
		ReviewService rdao = new ReviewServiceImpl();
		MemberCourseService mdao = new MemberCourseServiceImpl();
		BucketService bdao = new BucketServiceImpl();
		CourseVO vo = new CourseVO();
		MemberCourseVO mvo = new MemberCourseVO();
		int courseId = Integer.valueOf(request.getParameter("courseId")); //강의아이디
		
		// 로그인 정보 체크(해당강의 수강 여부를 체크하기 위함)
		String id = (String) session.getAttribute("loginId");
		if(id == null) {
			id = "id_null";
		}
		mvo.setMemberId(id);
		mvo.setCourseId(courseId);
		int result = mdao.memberCourseStatus(mvo); //현재 접속회원의 수강여부..
		if(result > 0) {
			// 수강중이면
			request.setAttribute("message", "possible");
		} if(result == 0) {
			// 수강중이 아니면
			request.setAttribute("message", "impossible");
			
			// 장바구니에 담긴 강좌인지 확인
			BucketVO bvo = new BucketVO();
			bvo.setCourseId(courseId);
			bvo.setMemberId(id);
			BucketVO check = bdao.bucketSelect(bvo);
			
			if(check != null) {
				//이미 담겨있으면
				request.setAttribute("bucket", "in");
			} else if(check == null) {
				//장바구니에 없으면
				request.setAttribute("bucket", "notIn");
			}
		}
		System.out.println("로그인한 id == " + id);
		
		// 강의 상세정보 조회
		vo.setCourseId(courseId);
		vo = dao.courseReviewSelect(vo); //리뷰포함한 강의 단건조회..
		request.setAttribute("course", vo);
		
		// 서브강의 리스트 조회
		List<SubCourseVO> subCourses = sdao.subcourseSortedList(vo);
		// 강의 시간 계산
		for(int i=0; i<subCourses.size(); i++) {
			subCourses.get(i).setSubcourseTime((subCourses.get(i).getSubcourseTime())/60);
		}
		request.setAttribute("subCourses", subCourses);
		
		// 강의별 리뷰 조회
		String rcount = rdao.courseReviewCount(vo);
		List<ReviewVO> reviews = rdao.courseReviewSortedList(vo);
		request.setAttribute("rcount", Integer.valueOf(rcount)); //리뷰개수..
		request.setAttribute("reviews", reviews); //리뷰조회
		
		// 강의 페이지 사이드 메뉴 만들기
		dao.makeSideMenu(request);
		// 페이지 포워딩
		String page = "course/courseDetail";
		request.setAttribute("menu", "course");
		request.setAttribute("detail", "detail"); //상세조회여부(헤더 메뉴경로에 사용)
		ViewResolve.foward(request, response, page);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
