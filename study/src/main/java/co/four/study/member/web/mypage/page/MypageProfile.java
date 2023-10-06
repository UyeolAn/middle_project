package co.four.study.member.web.mypage.page;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.four.study.board.service.BoardService;
import co.four.study.board.service.BoardVO;
import co.four.study.board.serviceImpl.BoardServiceImpl;
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
import co.four.study.question.service.QuestionService;
import co.four.study.question.serviceImpl.QuestionServiceImpl;
import co.four.study.reply.service.ReplyService;
import co.four.study.reply.serviceImpl.ReplyServiceImpl;
import co.four.study.review.service.ReviewService;
import co.four.study.review.serviceImpl.ReviewServiceImpl;

@WebServlet("/mypageprofile.do")
public class MypageProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 프로필 개요, 수강중인강좌, 커뮤니티글 표시(내용 편집x)
	public MypageProfile() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		MemberVO mvo = new MemberVO();
		MemberService mdao = new MemberServiceImpl();

		MemberCourseVO mcvo = new MemberCourseVO();
		MemberCourseService mcdao = new MemberCourseServiceImpl();

		CourseVO cvo = new CourseVO();
		CourseService cdao = new CourseServiceImpl();
		BoardVO bvo = new BoardVO();
		BoardService bdao = new BoardServiceImpl();
		QuestionService qdao = new QuestionServiceImpl();
		ReviewService rvdao = new ReviewServiceImpl();
		ReplyService rpdao = new ReplyServiceImpl();

		String checkAuthor = (String) session.getAttribute("loginAuthor");
		if (checkAuthor == "admin") {
			// 홈화면에서 마이페이지 접근시 관리자 마이페이지로 리디렉트
			response.sendRedirect("adminmypage.do");
		} else {

			mvo.setMemberId((String) session.getAttribute("loginId"));
			mvo = mdao.memberSelect(mvo);
						// System.out.println(mvo.getMemberId());
			// 게시물 수 카운트
			int cnt = 0;
			bvo.setMemberId(mvo.getMemberId());
			cnt = bdao.countBoardMember(bvo);

			// 댓글 수
			int rec = rpdao.countReply(mvo);
			int compcnt = 0;
			// 강의 목록 및 진도율
			List<MemberCourseVO> mcvolist = mcdao.selectMemberCourseListDetail(mvo);
			for (MemberCourseVO vo : mcvolist) {
				mcvo.setMemberId(mvo.getMemberId());
				mcvo.setCourseId(vo.getCourseId());
				mcvo = mcdao.countJindo(mcvo);
				vo.setCount(mcvo.getCount());
				vo.setTcnt(mcvo.getTcnt());

				

				// 진도율 체크
				double jindo = Math.round(((double) vo.getCount() / vo.getTcnt()) * 100);
				if (Double.isNaN(jindo)) {
					jindo = 0;
				}
				if (jindo >= 100) {
					jindo = 100;
					compcnt++;
				}
				vo.setJindo(jindo);
				cvo.setCourseId(vo.getCourseId());
				cvo = cdao.courseSelect(cvo);
				vo.setCourseName(cvo.getCourseName());
			}

			// 수강중인강의 개수
			int courseCount = 0;
			for (int i = 0; i < mcvolist.size(); i++) {
				courseCount++;
			}

//			System.out.println(mcvolist);
			request.setAttribute("menu", "mypage");
			// 프로필
			request.setAttribute("m", mvo);
			// 강의 정보
			request.setAttribute("memberCourseCount", courseCount);
			request.setAttribute("mclist", mcvolist);
			request.setAttribute("postCount", cnt);
			request.setAttribute("countrec", rec);
			request.setAttribute("compcnt", compcnt);
			String page = "mypage/mypageProfilePage";

			ViewResolve.foward(request, response, page);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
