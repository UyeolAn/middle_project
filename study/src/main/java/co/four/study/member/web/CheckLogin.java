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
import co.four.study.member.serviceImpl.MemberServiceImpl;

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
		// vo.setMemberPassword(request.getParameter("memberPassword"));

		vo = dao.memberSelect(vo);
		;
		
		if (vo != null) {
			session.setAttribute("memberId", vo.getMemberId());
			session.setAttribute("memberName", vo.getMemberName());
			session.setAttribute("memberAuthor", vo.getMemberAuthor());
			session.setAttribute("memberPassword", vo.getMemberPassword());
			
			
			if (session.getAttribute("memberAuthor").equals("admin")) {
				String page = "admin/member/memberPage";// 관리자 페이지 링크
				ViewResolve.foward(request, response, page);
			} else {
				String page = "home/home.jsp";
				ViewResolve.foward(request, response, page);
			}
			
			
		} else {
			String page = "common/login.jsp";
			ViewResolve.foward(request, response, page);
		}

		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
