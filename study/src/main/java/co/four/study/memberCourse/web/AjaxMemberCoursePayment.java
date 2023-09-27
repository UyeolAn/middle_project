package co.four.study.memberCourse.web;

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
import co.four.study.memberCourse.service.MemberCourseService;
import co.four.study.memberCourse.service.MemberCourseVO;
import co.four.study.memberCourse.serviceImpl.MemberCourseServiceImpl;
import co.four.study.packageBucket.service.PackageBucketService;
import co.four.study.packageBucket.service.PackageBucketVO;
import co.four.study.packageBucket.serviceImpl.PackageBucketServiceImpl;
import co.four.study.packageCourse.service.PackageCourseService;
import co.four.study.packageCourse.service.PackageCourseVO;
import co.four.study.packageCourse.serviceImpl.PackageCourseServiceImpl;

@WebServlet("/ajaxmembercourseinsert.do")
public class AjaxMemberCoursePayment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxMemberCoursePayment() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper objectMapper = new ObjectMapper().registerModule(new JavaTimeModule());
		MemberCourseService mdao = new MemberCourseServiceImpl();
		BucketService bdao = new BucketServiceImpl();
		PackageBucketService pbdao = new PackageBucketServiceImpl();
		PackageCourseService pcdao = new PackageCourseServiceImpl();
		MemberCourseVO mvo = new MemberCourseVO();
		BucketVO bvo = new BucketVO();
		PackageBucketVO pbvo = new PackageBucketVO();
		PackageCourseVO pcvo = new PackageCourseVO();
		String memberId = request.getParameter("memberId");
		
		//단과과정 장바구니에 있는 정보를 members_courses에 insert
		bvo.setMemberId(memberId);
		List<BucketVO> buckets = bdao.bucketSelectList(bvo);
		
		int result = 0;
		for(int i=0; i<buckets.size(); i++) {
			mvo.setCourseId(buckets.get(i).getCourseId());
			mvo.setMemberId(buckets.get(i).getMemberId());
			int n = mdao.insertMemberCourse(mvo);
			if(n>0) {
				result++;
				System.out.println("수강테이블에 insert 성공");
			} else {
				System.out.println("수강테이블에 insert하던 중 오류 발생 확인바람..");
			}
		}
		
		//단과과정 장바구니에 있는 데이터 삭제
		int delete = bdao.bucketDeleteAll(bvo);
		
		Map<String, String> messageMap = new HashMap<String, String>();
		if(delete == result) {
			messageMap.put("message", "success");
		} else {
			messageMap.put("message", "fail");
		}
		
		//패키지과정 장바구니에 있는 정보를 members_courses에 insert
		//1. 장바구니에 있는 패키지 번호가져온다
		pbvo.setMemberId(memberId);
		List<PackageBucketVO> pbuckets = pbdao.pbucketSelectList(pbvo);
		//2. 패키지 번호에 포함된 강의를 조회해서 members_courses에 insert
		for(int i=0; i<pbuckets.size(); i++) {
			int n = 0;
			//2-1. 패키지에 포함된 강의 정보 조회
			pcvo.setPackageId(pbuckets.get(i).getPackageId()); //패키지번호 셋
			List<PackageCourseVO> pcourses = pcdao.packageCourseSelectList(pcvo);
			System.out.println(pbuckets.get(i).getPackageId() + "번 패키지에 포함된 강의수 :: " + pcourses.size());
			//2-2. members_courses에 insert
			for(int pc=0; pc<pcourses.size(); pc++) {
				mvo.setMemberId(memberId);
				mvo.setCourseId(pcourses.get(pc).getCourseId());
				n += mdao.insertMemberCourse(mvo);
			}
			System.out.println(pbuckets.get(i).getPackageId() + "번 패키지, 수강중인 강의 테이블에 들어간 수 :: " + n);
			
			//2-3. insert한 패키지 정보 장바구니에서 삭제
			if(pcourses.size() == n) { //패키지에 포함된 강의수랑 수강테이블에 들어간 건수가 같으면 삭제처리
				pbvo.setMemberId(memberId);
				pbvo.setPackageId(pbuckets.get(i).getPackageId());
				int deletepb = pbdao.pbucketDelete(pbvo);
				
				if(deletepb != 0) {
					messageMap.put("pbmessage", "success");
				} else {
					messageMap.put("pbmessage", "fail");
				}
				
			} else {
				System.out.println("패키지 강의 결체하던 중 오류남.");
			}
		}
		
		
		String text = objectMapper.writeValueAsString(messageMap); // list형태의 데이터 => json형태로
		
		response.setContentType("text/json; charset=UTF-8"); // 한글깨짐 방지
		response.getWriter().append(text); //ajax를 return
		return;
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
