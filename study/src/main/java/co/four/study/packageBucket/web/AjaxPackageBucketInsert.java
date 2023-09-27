package co.four.study.packageBucket.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import co.four.study.bucket.service.BucketService;
import co.four.study.bucket.service.BucketVO;
import co.four.study.bucket.serviceImpl.BucketServiceImpl;
import co.four.study.packageBucket.service.PackageBucketService;
import co.four.study.packageBucket.service.PackageBucketVO;
import co.four.study.packageBucket.serviceImpl.PackageBucketServiceImpl;
import co.four.study.packageCourse.service.PackageCourseService;
import co.four.study.packageCourse.service.PackageCourseVO;
import co.four.study.packageCourse.serviceImpl.PackageCourseServiceImpl;

@WebServlet("/ajaxpackagebucketinsert.do")
public class AjaxPackageBucketInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxPackageBucketInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper objectMapper = new ObjectMapper().registerModule(new JavaTimeModule());
		PackageBucketService pbdao = new PackageBucketServiceImpl();
		PackageBucketVO pbvo = new PackageBucketVO();
		int packageId = Integer.valueOf(request.getParameter("packageId"));
		String memberId = request.getParameter("memberId");
		
		pbvo.setPackageId(packageId);
		pbvo.setMemberId(memberId);
		
		// 장바구니에 추가
		int result = 0;
		Map<String, String> message = new HashMap<String, String>();
		
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
			message.put("message", "success");
		} else {
			message.put("message", "fail");
		}
		
		String text = objectMapper.writeValueAsString(message); // list형태의 데이터 => json형태로
		
		response.setContentType("text/json; charset=UTF-8"); // 한글깨짐 방지
		response.getWriter().append(text); //ajax를 return
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
