package co.four.study.review.web;

import java.io.IOException;
import java.util.ArrayList;
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

import co.four.study.course.service.CourseVO;
import co.four.study.review.service.ReviewService;
import co.four.study.review.service.ReviewVO;
import co.four.study.review.serviceImpl.ReviewServiceImpl;

@WebServlet("/ajaxreviewupdate.do")
public class AjaxReviewUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxReviewUpdate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper objectMapper = new ObjectMapper().registerModule(new JavaTimeModule());
		ReviewService dao = new ReviewServiceImpl();
		ReviewVO vo = new ReviewVO();
		CourseVO cvo = new CourseVO();
		List<Object> reviews = new ArrayList<Object>();
		Map<String, String> messageMap = new HashMap<>();
		
		vo.setReviewId(Integer.valueOf(request.getParameter("reviewId")));
		vo.setReviewStars(Integer.valueOf(request.getParameter("reviewStars")));
		vo.setReviewContent(request.getParameter("reviwContent"));
		
		int result = dao.reviewUpdate(vo);
		
		if(result > 0) {
			messageMap.put("message", "success"); // 성공여부
			cvo.setCourseId(Integer.valueOf(request.getParameter("courseId")));
			messageMap.put("count", dao.courseReviewCount(cvo)); // 리뷰개수
			reviews.add(messageMap); 
			reviews.add(dao.reviewSelect(vo)); // 방금 수정된 리뷰 가져오기
		} else {
			messageMap.put("message", "fail");
			reviews.add(messageMap); // 성공여부
		}
		
		String list = objectMapper.writeValueAsString(reviews); // list형태의 데이터 => json형태로
		
		response.setContentType("text/json; charset=UTF-8"); // 한글깨짐 방지
		response.getWriter().append(list); //ajax를 return
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
