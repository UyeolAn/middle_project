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

@WebServlet("/ajaxmembercheck.do")
public class AjaxMemberCheck extends HttpServlet {
	// 회원가입 중복체크
	private static final long serialVersionUID = 1L;

	public AjaxMemberCheck() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		ObjectMapper objectMapper = new ObjectMapper();
		
		vo.setMemberId(request.getParameter("memberId"));
		vo = dao.memberSelect(vo);
		System.out.println(vo);

		String str = "YES"; // 사용 가능한 아이디
		if (vo != null) {
			str = "NO"; // 이미 존재하는 아이디 입니다.
		}
		
		Map<String, String> result = new HashMap<>();
		
		result.put("str", str);
		String json = objectMapper.writeValueAsString(result);
		response.setContentType("text/html; charset=UTF-8");
		response.getWriter().append(json);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
