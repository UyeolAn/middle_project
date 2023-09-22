package co.four.study.member.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
  //비밀번호 재설정 페이지 이동
    public AjaxPasswordResetTarget() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		ObjectMapper objectMapper = new ObjectMapper();
		
		vo.setMemberId(request.getParameter("memberId"));
		vo.setMemberEmail(request.getParameter("memberEmail"));
		dao.memberSearchPass(vo);

		Map<String, String> result = new HashMap<>();

		result.put("memberId",vo.getMemberId());
		result.put("memberEmail",vo.getMemberEmail());
//		System.out.println(result);

		String json = objectMapper.writeValueAsString(result);
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().print(json);
//		System.out.println(json);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
