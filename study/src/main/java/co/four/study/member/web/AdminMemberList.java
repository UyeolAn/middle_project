package co.four.study.member.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.common.ViewResolve;
import co.four.study.member.service.MemberService;
import co.four.study.member.service.MemberVO;
import co.four.study.member.serviceImpl.MemberServiceImpl;


@WebServlet("/adminmemberlist.do")
public class AdminMemberList extends HttpServlet {
	//회원리스트 열어주는 서블릿
	private static final long serialVersionUID = 1L;
       

    public AdminMemberList() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService dao = new MemberServiceImpl();
//		List<MemberVO> members = dao.memberSelectList();
		List<MemberVO> members = dao.memberList();
		String page = "admin/member/list";
		
		request.setAttribute("members", members);
		
		ViewResolve.foward(request, response, page);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
