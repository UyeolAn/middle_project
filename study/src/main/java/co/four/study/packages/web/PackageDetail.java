package co.four.study.packages.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.four.study.common.ViewResolve;
import co.four.study.course.service.CourseService;
import co.four.study.course.service.CourseVO;
import co.four.study.course.serviceImpl.CourseServiceImpl;
import co.four.study.member.service.MemberVO;
import co.four.study.memberCourse.service.MemberCourseService;
import co.four.study.memberCourse.service.MemberCourseVO;
import co.four.study.memberCourse.serviceImpl.MemberCourseServiceImpl;
import co.four.study.packageBucket.service.PackageBucketService;
import co.four.study.packageBucket.service.PackageBucketVO;
import co.four.study.packageBucket.serviceImpl.PackageBucketServiceImpl;
import co.four.study.packageCourse.service.PackageCourseService;
import co.four.study.packageCourse.service.PackageCourseVO;
import co.four.study.packageCourse.serviceImpl.PackageCourseServiceImpl;
import co.four.study.packages.service.PackageService;
import co.four.study.packages.service.PackageVO;
import co.four.study.packages.serviceImpl.PackageServiceImpl;

@WebServlet("/packagedetail.do")
public class PackageDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PackageDetail() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(); //로그인한 회원 아이디 가져오기 위함
		
		PackageVO pvo = new PackageVO();
		MemberVO mvo = new MemberVO();
		PackageCourseVO pcvo = new PackageCourseVO();
		CourseVO cvo = new CourseVO();
		PackageService pdao = new PackageServiceImpl();
		MemberCourseService mcdao = new MemberCourseServiceImpl();
		PackageCourseService pcdao = new PackageCourseServiceImpl();
		CourseService cdao = new CourseServiceImpl();
		PackageBucketService pbdao = new PackageBucketServiceImpl();
		
		int packageId = Integer.valueOf(request.getParameter("packageId"));
		String memberId = (String) session.getAttribute("loginId");
		
		// 회원 수강여부 확인
		mvo.setMemberId(memberId);
		pcvo.setPackageId(packageId);
		List<MemberCourseVO> memberCourses = mcdao.selectMemberCourseList(mvo);
		List<PackageCourseVO> packageCourses = pcdao.packageCourseSelectList(pcvo);
		
		int result = 0;
		for(int i=0; i<memberCourses.size(); i++) { //5개 (1,2,3,4,5)
			for(int j=0; j<packageCourses.size(); j++) { //2개 (5,6)
				if(memberCourses.get(i).getCourseId() == packageCourses.get(j).getCourseId()) {
					result++; //수강중이면 result++
				}
			}
		}
		
		if(result == 0) { //수강중이 아니면
			request.setAttribute("message", "possible");
			
			//장바구니에 담긴 패키지 인지 확인
			PackageBucketVO pbvo = new PackageBucketVO();
			pbvo.setPackageId(packageId);
			pbvo.setMemberId(memberId);
			PackageBucketVO check = pbdao.pbucketSelect(pbvo);
			
			if(check != null) {
				//이미 담겨있으면
				request.setAttribute("pbucket", "in");
			} else if(check == null) {
				request.setAttribute("pbucket", "notIn");
			}
			
		} else { //수강중이면
			request.setAttribute("message", "impossible");
		}
		
		// 패키지 정보 가져오기
		pvo.setPackageId(packageId);
		pvo = pdao.packageSelect(pvo);
		// 할인금액 정보 가져오기
		int salePrice = pdao.salePrice(pvo);
		pvo.setSalePrice(salePrice);
		// 강의정가 정보 가져오기
		int coursesPrice = pdao.coursesPrice(pvo);
		pvo.setCoursesPrice(coursesPrice);
		request.setAttribute("data", pvo);
		System.out.println(pvo);
		
		// 패키지에 포함된 강의 정보 넘기기
		List<CourseVO> courseList = new ArrayList<CourseVO>();
		for(int i=0; i<packageCourses.size(); i++) {
			cvo.setCourseId(packageCourses.get(i).getCourseId()); //courseId 셋..
			courseList.add(cdao.courseSelect(cvo)); //강의정보 담기..
		}
		request.setAttribute("packageCourses", packageCourses);
		request.setAttribute("courses", courseList);
		
		// 회원아이디 넘겨주기
		request.setAttribute("loginId", memberId);
		
		// 페이지 포워딩
		String page = "package/packageDetail";
		request.setAttribute("menu", "package");
		request.setAttribute("detail", "detail");
		ViewResolve.foward(request, response, page);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
