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


@WebServlet("/adminmypage.do")
public class AdminMyPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminMyPage() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		MemberVO vo = new MemberVO();
		MemberService dao = new MemberServiceImpl();
		
		vo.setMemberId((String) session.getAttribute("loginId"));
		vo = dao.memberSelect(vo);

		request.setAttribute("m", vo);
		
		String page = "admin/mypage/mypage";
		ViewResolve.foward(request, response, page);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
