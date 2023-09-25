package co.four.study.member.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.four.study.common.Sha256;
import co.four.study.member.service.MemberService;
import co.four.study.member.service.MemberVO;
import co.four.study.member.serviceImpl.MemberServiceImpl;

@WebServlet("/ajaxpasswordreset.do")
public class AjaxPasswordReset extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 패스워드 변경하고 세션 초기화
	public AjaxPasswordReset() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		HttpSession session = request.getSession();

		// 비밀번호 변경
		vo.setMemberId(request.getParameter("memberId"));
		vo.setMemberPassword(Sha256.encrypt(request.getParameter("memberPassword")));
		vo.setMemberEmail(request.getParameter("memberEmail"));

		dao.memberPassReset(vo);

		

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
