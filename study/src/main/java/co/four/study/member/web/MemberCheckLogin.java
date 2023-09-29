package co.four.study.member.web;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.four.study.common.Sha256;
import co.four.study.common.ViewResolve;
import co.four.study.member.service.MemberService;
import co.four.study.member.service.MemberVO;
import co.four.study.member.serviceImpl.MemberServiceImpl;

@WebServlet("/memberchecklogin.do")
public class MemberCheckLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberCheckLogin() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//로그인 실행
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		HttpSession session = request.getSession();

		vo.setMemberId(request.getParameter("memberId"));
		vo.setMemberPassword(Sha256.encrypt(request.getParameter("memberPassword")));
		// vo.setMemberPassword(request.getParameter("memberPassword"));
		System.out.println(vo);
		vo = dao.memberSelect(vo);
		String msg = "";
		
		if (vo != null) {
			session.setAttribute("loginId", vo.getMemberId());
			session.setAttribute("loginName", vo.getMemberName());
			session.setAttribute("loginAuthor", vo.getMemberAuthor());	
			//카카오로그인 회원이 아니란걸 세션에 저장
			session.setAttribute("isKakaoUser", false);
			
			if (session.getAttribute("loginAuthor").equals("admin")) {
				response.sendRedirect("adminhome.do");// 관리자 페이지 링크
			} else {
				msg = vo.getMemberName() + "님 어서오세요";
				request.setAttribute("msg", msg);
//				String page = "home/home.jsp";
//				ViewResolve.foward(request, response, page);
				response.sendRedirect("home.do");
			}
			
			
		} else {
			 msg = "아이디 또는 비밀번호가 틀렸습니다.";
			request.setAttribute("loginmsg", msg);
			String page = "common/login.jsp";
			ViewResolve.foward(request, response, page);
		}

		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
