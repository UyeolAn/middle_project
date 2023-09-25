package co.four.study.member.web.mypage.page;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.four.study.board.service.BoardVO;
import co.four.study.common.ViewResolve;
import co.four.study.course.service.CourseVO;
import co.four.study.member.service.MemberService;
import co.four.study.member.service.MemberVO;
import co.four.study.member.serviceImpl.MemberServiceImpl;
import co.four.study.memberCourse.service.MemberCourseService;
import co.four.study.memberCourse.service.MemberCourseVO;
import co.four.study.memberCourse.serviceImpl.MemberCourseServiceImpl;

@WebServlet("/mypagemain.do")
public class MypageMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// 프로필 개요, 수강중인강좌, 커뮤니티글 표시(내용 편집x)
	public MypageMain() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberVO mvo = new MemberVO();
		MemberCourseService memberCourseDao = new MemberCourseServiceImpl();
		HttpSession session = request.getSession();
		
		mvo.setMemberId((String) session.getAttribute("loginId"));
		
		System.out.println(mvo.getMemberId());
		//수강중인 강의 개수 상위 3개
		List<MemberCourseVO> mclist = memberCourseDao.selectMemberCourseListDetail(mvo);
		int courseCount = 0;
		for (int i = 0; i<3; i++) {
			courseCount++;
		}
		//수강중 강의 목록
		
		System.out.println(courseCount);
					
		System.out.println(mclist);
		
		
		
		
		request.setAttribute("memberCourseCount", courseCount);
		request.setAttribute("mycourse", mclist);
		request.setAttribute("menu", "mypage");
		
		

		String page = "mypage/mypageMain";
	

		ViewResolve.foward(request, response, page);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
