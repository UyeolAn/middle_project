package co.four.study.member.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.common.ViewResolve;
import co.four.study.member.service.MemberService;
import co.four.study.member.service.MemberVO;
import co.four.study.member.serviceImpl.MemberServiceImpl;


@WebServlet("/adminmemberpage.do")
public class AdminMemberPage extends HttpServlet {
	//회원 상세정보 열어주는 서블릿
	private static final long serialVersionUID = 1L;
       

    public AdminMemberPage() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//회원 아이디 받아옴
		String mid = request.getParameter("mid");
		MemberVO vo = new MemberVO();
		MemberService dao = new MemberServiceImpl();
		
		vo.setMemberId(mid);
		
		//회원정보 조회 함수
		vo = dao.memberPage(mid);
		request.setAttribute("m", vo);
		
		String page = "admin/member/memberPage";
		ViewResolve.foward(request, response, page);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
