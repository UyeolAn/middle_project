package co.four.study.review.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

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

@WebServlet("/ajaxreviewlist.do")
public class AjaxReviewList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxReviewList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper objectMapper = new ObjectMapper().registerModule(new JavaTimeModule());
		ReviewService dao = new ReviewServiceImpl();
		CourseVO vo = new CourseVO();
		List<ReviewVO> reviews = new ArrayList<ReviewVO>();
		
		vo.setCourseId(Integer.valueOf(request.getParameter("courseId")));
		reviews = dao.courseReviewSortedList(vo);
		
		String list = objectMapper.writeValueAsString(reviews); // list형태의 데이터 => json형태로
		
		response.setContentType("text/json; charset=UTF-8"); // 한글깨짐 방지
		response.getWriter().append(list); //ajax를 return
		return;
		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
