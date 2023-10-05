package co.four.study.member.web.mypage.json;

import java.io.IOException;
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

@WebServlet("/membercancel.do")
public class MemberCancel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// 회원탈퇴
	public MemberCancel() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MemberVO vo = new MemberVO();
		MemberService dao = new MemberServiceImpl();
		HttpSession session = request.getSession();

		vo.setMemberId((String) session.getAttribute("loginId"));
		dao.memberDelete(vo);
		session.invalidate();
		response.sendRedirect("home.do");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
