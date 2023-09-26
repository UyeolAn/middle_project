package co.four.study.packageBucket.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		//장바구니에 있는지 확인
		pbvo.setPackageId(packageId); //패키지아이디 셋
		pbvo.setMemberId(memberId); //멤버아이디 셋
		int result = 0;
		PackageBucketVO check = pbdao.pbucketSelect(pbvo); //장바구니에 이미 담겨 있는지 확인
		
		if(check != null) {
			//이미 담겨있으면 bucketlist.do로..
			System.out.println(packageId + "번 패키지는 이미 담겨있음");
			response.sendRedirect("bucketlist.do?memberId=" + memberId);
		} else if(check == null) {
			//장바구니에 없으면 추가
			System.out.println(packageId + "번 패키지를 장바구니에 추가함");
			result = pbdao.pbucketInsert(pbvo);
		}
		
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
