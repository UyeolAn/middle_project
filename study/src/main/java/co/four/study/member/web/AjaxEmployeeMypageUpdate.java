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

import co.four.study.common.Sha256;
import co.four.study.member.service.MemberService;
import co.four.study.member.service.MemberVO;
import co.four.study.member.serviceImpl.MemberServiceImpl;


@WebServlet("/ajaxemployeemypageupdate.do")
public class AjaxEmployeeMypageUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AjaxEmployeeMypageUpdate() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		MemberVO vo = new MemberVO();
		MemberService dao = new MemberServiceImpl();
		
		vo.setMemberId(request.getParameter("id"));
		vo.setMemberPassword(Sha256.encrypt(request.getParameter("pw")));
		vo.setMemberName(request.getParameter("name"));
		vo.setMemberTel(request.getParameter("tel"));
		vo.setMemberAddress(request.getParameter("addr"));
		vo.setMemberEmail(request.getParameter("email"));
		
		
		Map<String, Object> resultMap = new HashMap<>();
		
		if(dao.memberUpdate(vo) == 1) {
			resultMap.put("retCode", "Success");
		}
		else {
			resultMap.put("retCode", "Fail");
		}
		
		String json = objectMapper.writeValueAsString(resultMap);
		response.setContentType("text/json; charset=UTF-8");
		response.getWriter().print(json);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
