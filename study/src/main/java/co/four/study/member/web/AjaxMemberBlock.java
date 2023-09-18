package co.four.study.member.web;

import java.io.IOException;
import java.time.LocalDate;
import java.util.Date;
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


@WebServlet("/ajaxmemberblock.do")
public class AjaxMemberBlock extends HttpServlet {
	//회원 차단 및 해제해주는 서블릿
	//member 수정
	private static final long serialVersionUID = 1L;
       

    public AjaxMemberBlock() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		String mid = request.getParameter("mid");
		String block = request.getParameter("block");
		
		MemberVO vo = new MemberVO();
		MemberService dao = new MemberServiceImpl();
		int i;
		vo.setMemberId(mid);
		
		//block파라미터가 true이면 정지날짜 지정
		//그 외엔 정지날짜를 null로 지정하고 차단해제
		if(block.equals("true")) {
			vo.setMemberStopDate(new Date());
			i = dao.memberUpdate(vo);
		}
		else {
			vo.setMemberStopDate(null);
			i = dao.memberBlock(vo);
		}
		
		Map<String, Object> resultMap = new HashMap<>();
		
		if(i==1) {
			resultMap.put("retCode", "Success");
			resultMap.put("data", vo);
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
