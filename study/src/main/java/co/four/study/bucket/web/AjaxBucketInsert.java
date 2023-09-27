package co.four.study.bucket.web;

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

@WebServlet("/ajaxbucketinsert.do")
public class AjaxBucketInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxBucketInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper objectMapper = new ObjectMapper().registerModule(new JavaTimeModule());
		BucketService dao = new BucketServiceImpl();
		BucketVO vo = new BucketVO();
		int courseId = Integer.valueOf(request.getParameter("courseId"));
		String memberId = request.getParameter("memberId");
		
		vo.setCourseId(courseId); //0이 들어오면 안됨
		vo.setMemberId(memberId);
		System.out.println("ajaxbucketinsert.do 들어옴");
		System.out.println(vo);
		
		// 장바구니에 추가
		int result = 0;
		Map<String, String> message = new HashMap<String, String>();
		
		//패키지 장바구니에 있는강의 인지 확인
		PackageBucketService pbdao = new PackageBucketServiceImpl();
		PackageBucketVO pbvo = new PackageBucketVO();
		pbvo.setMemberId(memberId);
		List<PackageBucketVO> pblist = pbdao.pbucketSelectList(pbvo); //회원의 패키지 장바구니 조회
		System.out.println("회원의 패키지 장바구니 조회:: " + pblist);
		
		if(pblist.size() != 0) {
			//패키지아이디로 packages_courses 돌면서 포함된 강의에 있는지 확인
			PackageCourseVO pcvo = new PackageCourseVO();
			PackageCourseService pcdao = new PackageCourseServiceImpl();
			
			for(int i=0; i<pblist.size(); i++) {
				pcvo.setPackageId(pblist.get(i).getPackageId()); //패키지 아이디 셋
				List<PackageCourseVO> pcourses = pcdao.packageCourseSelectList(pcvo); //패키지에 포함된 강의 가져오기
				
				for(int pc=0; pc<pcourses.size(); pc++) {
					if(pcourses.get(pc).getCourseId() == courseId) {
						//요청온 강의 아이디랑 패키지에 담긴 강의 아이디가 일치하면 해당 패키지 삭제
						pbvo.setPackageId(pblist.get(i).getPackageId());
						pbdao.pbucketDelete(pbvo);
					}
				}
			}
			result = dao.bucketInsert(vo); //장바구니에 insert
			
		} else if(pblist.size() == 0){ 
			//회원의 패키지 장바구니 비어있으면 바로 추가
			result = dao.bucketInsert(vo);
		}
		
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
