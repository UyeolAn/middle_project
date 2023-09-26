package co.four.study.bucket.web;

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

import co.four.study.bucket.service.BucketService;
import co.four.study.bucket.service.BucketVO;
import co.four.study.bucket.serviceImpl.BucketServiceImpl;

@WebServlet("/ajaxbucketdelete.do")
public class AjaxBucketDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxBucketDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper objectMapper = new ObjectMapper().registerModule(new JavaTimeModule());
		BucketService dao = new BucketServiceImpl();
		BucketVO vo = new BucketVO();
		
		vo.setCourseId(Integer.valueOf(request.getParameter("courseId")));
		vo.setMemberId(request.getParameter("memberId"));
		
		int result = dao.bucketDelete(vo);
		List<Object> buckets = new ArrayList<Object>();
		Map<String, String> message = new HashMap<String, String>();
		
		if(result > 0) {
			message.put("message", "success");
			int sum = dao.sumCoursesPrice(vo);
			message.put("sum", String.valueOf(sum));
			buckets.add(message);
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
