package co.four.study.member.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.common.ViewResolve;
import co.four.study.member.service.MemberService;
import co.four.study.member.service.MemberVO;
import co.four.study.member.serviceImpl.MemberServiceImpl;
import co.four.study.memberCourse.service.MemberCourseService;
import co.four.study.memberCourse.service.MemberCourseVO;
import co.four.study.memberCourse.serviceImpl.MemberCourseServiceImpl;

@WebServlet("/mypagemain.do")
public class MypageMain extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MypageMain() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberVO mvo = new MemberVO();
		MemberCourseVO mcvo = new MemberCourseVO();
		MemberService msv = new MemberServiceImpl();
		MemberCourseService mcsv = new MemberCourseServiceImpl();
		
		//프로필 개요, 수강중인강좌, 커뮤니티글 표시(내용 편집x)
		
		String page = "mypage/mypageMain";

		ViewResolve.foward(request, response, page);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
