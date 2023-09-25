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
		MemberCourseVO mvo = new MemberCourseVO();
		BucketVO bvo = new BucketVO();
		
		//장바구니에 있는 정보를 members_courses에 insert
		bvo.setMemberId(request.getParameter("memberId"));
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
		
		//장바구니에 있는 데이터 삭제
		int delete = bdao.bucketDeleteAll(bvo);
		
		Map<String, String> messageMap = new HashMap<String, String>();
		if(delete == result) {
			messageMap.put("message", "success");
		} else {
			messageMap.put("message", "fail");
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
