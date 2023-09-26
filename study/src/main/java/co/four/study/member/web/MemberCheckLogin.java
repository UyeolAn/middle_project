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
		
		
		if (vo != null) {
			session.setAttribute("loginId", vo.getMemberId());
			session.setAttribute("loginName", vo.getMemberName());
			session.setAttribute("loginAuthor", vo.getMemberAuthor());
			session.setAttribute("loginPassword", vo.getMemberPassword());
			
			
			if (session.getAttribute("loginAuthor").equals("admin")) {
				
				response.sendRedirect("adminhome.do");// 관리자 페이지 링크
			
			} else {
				response.sendRedirect("home.do");// 관리자 페이지 링크
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
