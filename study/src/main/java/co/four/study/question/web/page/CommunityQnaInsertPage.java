package co.four.study.question.web.page;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.common.ViewResolve;
import co.four.study.course.service.CourseService;
import co.four.study.course.service.CourseVO;
import co.four.study.course.serviceImpl.CourseServiceImpl;

@WebServlet("/communityqnainsertpage.do")
public class CommunityQnaInsertPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CommunityQnaInsertPage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CourseService dao = new CourseServiceImpl();
		List<CourseVO> courses = dao.courseSelectList(null);
		
		String page = "community/communityQnaInsertPage";
		request.setAttribute("menu", "community");
		request.setAttribute("courses", courses);
		ViewResolve.foward(request, response, page);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
