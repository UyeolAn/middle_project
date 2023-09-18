package co.four.study.member.web;

import java.io.IOException;

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
import co.four.study.member.service.impl.MemberServiceImpl;

@WebServlet("/checkLogin.do")
public class CheckLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CheckLogin() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		HttpSession session = request.getSession();

		vo.setMemberId(request.getParameter("memberId"));
		vo.setMemberPassword(Sha256.encrypt(request.getParameter("memberPassword")));
		//vo.setMemberName(request.getParameter("memberPassword"));
		vo = dao.memberSearch(vo);

		if (vo != null) {
			session.setAttribute("id", vo.getMemberId());
			session.setAttribute("name", vo.getMemberName());
			request.setAttribute("message", vo.getMemberName() + "님 환영합니다");
		} else {
			request.setAttribute("message", "비밀번호가 일치하지 않습니다.");
		}
		if (session.getAttribute("author") == "admin") {
			String page = "home/home";// 관리자 페이지 링크
			ViewResolve.foward(request, response, page);
		} else {
			String page = "home/home";
			ViewResolve.foward(request, response, page);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
