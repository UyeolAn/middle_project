package co.four.study.memberCourse.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.memberCourse.service.MemberCourseService;
import co.four.study.memberCourse.service.MemberCourseVO;
import co.four.study.memberCourse.serviceImpl.MemberCourseServiceImpl;

@WebServlet("/ajaxAddmembercourse.do")
public class AjaxAddMemberCourse extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxAddMemberCourse() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberCourseService dao = new MemberCourseServiceImpl();
		MemberCourseVO vo = new MemberCourseVO();
		int courseId = Integer.valueOf(request.getParameter("courseId"));
		String memberId = request.getParameter("memberId");
		System.out.println(memberId + "님이 " + courseId + "번 강의를 수강신청함.");
		
		vo.setCourseId(courseId);
		vo.setMemberId(memberId);
		
		int result = dao.insertMemberCourse(vo);
		
		if(result > 0) {
			System.out.println("정상적으로 신청되었음.");
		} else { 
			System.out.println("수강신청 중 오류 발생함.");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
