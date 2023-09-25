package co.four.study.reply.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.four.study.member.service.MemberVO;
import co.four.study.reply.service.ReplyService;
import co.four.study.reply.serviceImpl.ReplyServiceImpl;

@WebServlet("/memberreplycount.do")
public class MemberReplyCount extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public MemberReplyCount() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReplyService dao = new ReplyServiceImpl();
		
		String memberId = request.getParameter("memberId");
		
		MemberVO mvo = new MemberVO();
		mvo.setMemberId(memberId);
		int cnt = dao.countReply(mvo);
		
		Map<String, Integer> cntMap = new HashMap<>();
		cntMap.put("totalCount", cnt);
		
		ObjectMapper objectMapper = new ObjectMapper();
		String countJson = objectMapper.writeValueAsString(cntMap);
		
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().print(countJson);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
