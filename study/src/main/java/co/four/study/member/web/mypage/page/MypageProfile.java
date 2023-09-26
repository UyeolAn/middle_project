package co.four.study.member.web.mypage.page;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.four.study.common.ViewResolve;
import co.four.study.member.service.MemberService;
import co.four.study.member.service.MemberVO;
import co.four.study.member.serviceImpl.MemberServiceImpl;
import co.four.study.memberCourse.service.MemberCourseService;
import co.four.study.memberCourse.service.MemberCourseVO;
import co.four.study.memberCourse.serviceImpl.MemberCourseServiceImpl;

@WebServlet("/mypageprofile.do")
public class MypageProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 프로필 개요, 수강중인강좌, 커뮤니티글 표시(내용 편집x)
	public MypageProfile() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MemberVO mvo = new MemberVO();
		MemberService memberDao = new MemberServiceImpl();
		MemberCourseService memberCourseDao = new MemberCourseServiceImpl();
		HttpSession session = request.getSession();
		String checkAuthor = (String) session.getAttribute("loginAuthor");

		if (checkAuthor == "admin") {
			// 홈화면에서 마이페이지 접근시 관리자 마이페이지로 리디렉트
			response.sendRedirect("adminmypage.do");
		} else {

			mvo.setMemberId((String) session.getAttribute("loginId"));
			mvo = memberDao.memberSelect(mvo);

			System.out.println(mvo.getMemberId());
			// 수강중인 강의 상위3개 미리보기
			List<MemberCourseVO> mclist = memberCourseDao.selectMemberCourseListDetail(mvo);
			int courseCount = 0;

			// 수강중 강의 목록
			for (int i = 0; i < mclist.size(); i++) {
				// 수강중인강의 개수
				courseCount++;
			}

			System.out.println(mclist);
			request.setAttribute("menu", "mypage");
			// 프로필
			request.setAttribute("m", mvo);
		
			// 강의 정보
			request.setAttribute("memberCourseCount", courseCount);
			request.setAttribute("mycourse", mclist);
			String page = "mypage/mypageProfilePage";

			ViewResolve.foward(request, response, page);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
