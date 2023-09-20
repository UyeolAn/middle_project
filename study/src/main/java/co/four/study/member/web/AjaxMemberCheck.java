package co.four.study.member.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.member.service.MemberService;
import co.four.study.member.service.MemberVO;
import co.four.study.member.serviceImpl.MemberServiceImpl;

@WebServlet("/AjaxMemberCheck")
public class AjaxMemberCheck extends HttpServlet {
	//회원가입 중복체크
	private static final long serialVersionUID = 1L;
       
  
    public AjaxMemberCheck() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		vo.setMemberId(request.getParameter("memberId"));
		vo = dao.memberSelect(vo);
		
		String str = "사용가능"; //사용 가능한 아이디
		if(vo != null) {
			str = "중복된 ID입니다.";  //이미 존재하는 아이디 입니다.
		}
		
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append(str);
		return;
	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
