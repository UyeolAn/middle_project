package co.four.study.question.web.page;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.four.study.common.ViewResolve;
import co.four.study.course.service.CourseVO;
import co.four.study.memberCourse.service.MemberCourseQnaVO;
import co.four.study.memberCourse.service.MemberCourseService;
import co.four.study.memberCourse.serviceImpl.MemberCourseServiceImpl;

@WebServlet("/communityqnainsertpage.do")
public class CommunityQnaInsertPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CommunityQnaInsertPage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		String memberId = (String)session.getAttribute("loginId");
		
		MemberCourseService dao = new MemberCourseServiceImpl();
		List<MemberCourseQnaVO> courses = dao.selectMemberCourseWithName(memberId);
		
		String page = "community/communityQnaInsertPage";
		request.setAttribute("menu", "community");
		request.setAttribute("courses", courses);
		ViewResolve.foward(request, response, page);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
