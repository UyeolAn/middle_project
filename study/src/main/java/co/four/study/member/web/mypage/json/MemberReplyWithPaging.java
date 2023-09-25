package co.four.study.member.web.mypage.json;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import co.four.study.member.service.MemberVO;
import co.four.study.reply.service.ReplyService;
import co.four.study.reply.service.ReplyVO;
import co.four.study.reply.service.etcvo.ReplySortVO;
import co.four.study.reply.serviceImpl.ReplyServiceImpl;

@WebServlet("/memberreplywithpaging.do")
public class MemberReplyWithPaging extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public MemberReplyWithPaging() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ReplyService dao = new ReplyServiceImpl();
		
		String memberId = request.getParameter("memberId");
		
		ReplySortVO searchVO = new ReplySortVO();
		searchVO.setMemberId(memberId);
		
		MemberVO mvo = new MemberVO();
		mvo.setMemberId(memberId);

		int totalCount = dao.countReply(mvo);
		int page = Integer.parseInt(request.getParameter("page"));
		int start = (page - 1) * 10 + 1;
		int end = (page * 10) < totalCount ? (page * 10) : totalCount;
		
		searchVO.setStartRow(start);
		searchVO.setEndRow(end);
		
		List<ReplyVO> answers = dao.sortRepliesWithPaging(searchVO);
		
		ObjectMapper objectMapper = new ObjectMapper();
		String questionsJson = objectMapper.registerModule(new JavaTimeModule()).writeValueAsString(answers);
		
		response.setContentType("text/json;charset=utf-8");
		response.getWriter().print(questionsJson);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
