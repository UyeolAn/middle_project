package co.four.study.member.web;

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
import co.four.study.member.service.MemberService;
import co.four.study.member.service.MemberVO;
import co.four.study.member.serviceImpl.MemberServiceImpl;
import co.four.study.memberCourse.service.MemberCourseService;
import co.four.study.memberCourse.service.MemberCourseVO;
import co.four.study.memberCourse.serviceImpl.MemberCourseServiceImpl;


@WebServlet("/adminmemberpage.do")
public class AdminMemberPage extends HttpServlet {
	//회원 상세정보 열어주는 서블릿
	private static final long serialVersionUID = 1L;
       

    public AdminMemberPage() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//회원 아이디 받아옴
		String mid = request.getParameter("mid");
		System.out.println(mid);
		MemberVO memvo = new MemberVO();
		MemberService dao = new MemberServiceImpl();
		MemberCourseVO mcvo = new MemberCourseVO();
		MemberCourseService mcdao = new MemberCourseServiceImpl();
		CourseService cdao = new CourseServiceImpl();
		CourseVO cvo = new CourseVO();
		memvo.setMemberId(mid);
		
		mcvo.setMemberId(mid);
		
		List<MemberCourseVO> mcvolist = mcdao.selectMemberCourseList(memvo);
		System.out.println(mcvolist);
//		mcvo = mcdao.selectMemberCourse(mcvo);
//		for(MemberCourseVO vo : mcvolist) {
//			//진도가져오ㅡㄴㄱ
//			//진도율곙산
//			System.out.println(vo);
//			mcvo.setCourseId(vo.getCourseId());
//			mcvo.setMemberId(vo.getMemberId());
//			mcvo = mcdao.countJindo(vo);
//			System.out.println(mcvo);
////			System.out.println(vo.getTcnt());
//			vo.setJindo(((double)vo.getCount()/vo.getTcnt()) * 100);
//			cvo.setCourseId(vo.getCourseId());
//			cvo = cdao.courseSelect(cvo);
//			String name = cvo.getCourseName();
//			vo.setCourseName(name);
//		}
		
		//회원정보 조회 함수
		memvo = dao.memberPage(mid);
		request.setAttribute("m", memvo);
		request.setAttribute("courses", mcvolist);
		
		String page = "admin/member/memberPage";
		ViewResolve.foward(request, response, page);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
