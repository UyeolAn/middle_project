package co.four.study.member.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.four.study.member.service.MemberService;
import co.four.study.member.service.MemberVO;
import co.four.study.member.serviceImpl.MemberServiceImpl;

/**
 * Servlet implementation class PasswordReset
 */
@WebServlet("/ajaxpasswordresettarget.do")
public class AjaxPasswordResetTarget extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 비밀번호 재설정 대상 탐색
	public AjaxPasswordResetTarget() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		HttpSession session = request.getSession();

		vo.setMemberId(request.getParameter("memberId"));
		vo.setMemberEmail(request.getParameter("memberEmail"));
		vo = dao.memberSearchPass(vo);

		System.out.println(vo);
		
		if (vo != null) {
			session.setAttribute("searchId", vo.getMemberId());
			session.setAttribute("searchEmail", vo.getMemberEmail());

			response.sendRedirect("passwordsearch.do");
		} else {
			System.out.println("err");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
