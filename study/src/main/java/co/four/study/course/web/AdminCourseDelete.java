package co.four.study.course.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.four.study.common.ViewResolve;
import co.four.study.course.service.CourseService;
import co.four.study.course.service.CourseVO;
import co.four.study.course.serviceImpl.CourseServiceImpl;


@WebServlet("/admincoursedelete.do")
public class AdminCourseDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminCourseDelete() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		int cid = Integer.parseInt(request.getParameter("cid"));
		
		CourseVO vo = new CourseVO();
		CourseService dao = new CourseServiceImpl();
		
		vo.setCourseId(cid);
		int i = dao.courseDelete(vo);
		
		Map<String, Object> resultMap = new HashMap<>();
		
		
		String json = objectMapper.writeValueAsString(resultMap);
		response.setContentType("text/json; charset=UTF-8");
		response.getWriter().print(json);
		
		if(i != 0) {
			response.sendRedirect("admincourselist.do");
		}//위임, 리스트를 다시 보여주라는 것
//		}else {
//			request.setAttribute("message", "게시글 등록이 실패했습니다.");
//			ViewResolve.forward(request, response, page);}
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
