package co.four.study.packageBucket.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.bucket.service.BucketService;
import co.four.study.bucket.service.BucketVO;
import co.four.study.bucket.serviceImpl.BucketServiceImpl;
import co.four.study.packageBucket.service.PackageBucketService;
import co.four.study.packageBucket.service.PackageBucketVO;
import co.four.study.packageBucket.serviceImpl.PackageBucketServiceImpl;
import co.four.study.packageCourse.service.PackageCourseService;
import co.four.study.packageCourse.service.PackageCourseVO;
import co.four.study.packageCourse.serviceImpl.PackageCourseServiceImpl;

@WebServlet("/packagebucketinsert.do")
public class PackageBucketInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PackageBucketInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PackageBucketService pbdao = new PackageBucketServiceImpl();
		PackageBucketVO pbvo = new PackageBucketVO();
		
		int packageId = Integer.valueOf(request.getParameter("packageId"));
		String memberId = request.getParameter("memberId");
		System.out.println(packageId + ", " + memberId);
		
		pbvo.setPackageId(packageId); //패키지아이디 셋
		pbvo.setMemberId(memberId); //멤버아이디 셋
		int result = 0;
			
		//1. 단과강의 장바구니에 있는 강의리스트 가져오기
		BucketVO bvo = new BucketVO();
		BucketService bdao = new BucketServiceImpl();
		bvo.setMemberId(memberId);
		List<BucketVO> courses = bdao.bucketSelectList(bvo);
		//2. 패키지에 포함된 강의 리스트 가져오기
		PackageCourseVO pcvo = new PackageCourseVO();
		PackageCourseService pcdao = new PackageCourseServiceImpl();
		pcvo.setPackageId(packageId);
		List<PackageCourseVO> pcourses = pcdao.packageCourseSelectList(pcvo);
		
		//3-1. 1번과 2번을 비교하면서 일치하는게 있으면 해당 단과과정 장바구니에서 삭제
		for(int b=0; b<courses.size(); b++) {
			for(int pb=0; pb<pcourses.size(); pb++) {
				if(courses.get(b).getCourseId() == pcourses.get(pb).getCourseId()) {
					bvo.setCourseId(courses.get(b).getCourseId());
					bdao.bucketDelete(bvo);
				}
			}
		}
		
		//4. 패키지 장바구니에 insert
		System.out.println(packageId + "번 패키지를 장바구니에 추가함");
		result = pbdao.pbucketInsert(pbvo);
		
		if(result > 0) {
			//장바구니 페이지로 이동
			response.sendRedirect("bucketlist.do?memberId=" + memberId);
		} else {
			System.out.println("이미 담겨있는 강의 이거나, packagebucketinsert.do에서 오류 발생함.");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
