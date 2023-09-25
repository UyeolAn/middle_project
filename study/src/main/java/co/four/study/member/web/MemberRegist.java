package co.four.study.member.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.common.Sha256;
import co.four.study.common.ViewResolve;
import co.four.study.member.service.MemberService;
import co.four.study.member.service.MemberVO;
import co.four.study.member.serviceImpl.MemberServiceImpl;

@WebServlet("/memberRegist.do")
public class MemberRegist extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberRegist() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//회원가입
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();

		vo.setMemberId(request.getParameter("memberId"));
		vo.setMemberPassword(Sha256.encrypt(request.getParameter("memberPassword")));
		vo.setMemberName(request.getParameter("memberName"));
		vo.setMemberTel(request.getParameter("memberTel"));
		vo.setMemberAddress(request.getParameter("address1") +" "+request.getParameter("address2") + 
				request.getParameter("address3"));
		vo.setMemberEmail(request.getParameter("memberEmail"));
//		System.out.println(vo);
		dao.memberInsert(vo);

		String page = "home/home.jsp";
		ViewResolve.foward(request, response, page);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
