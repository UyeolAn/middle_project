package co.four.study.reply.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.four.study.common.ViewResolve;
import co.four.study.reply.service.ReplyService;
import co.four.study.reply.service.ReplyVO;
import co.four.study.reply.serviceImpl.ReplyServiceImpl;

@WebServlet("/replyinsert.do")
public class ReplyInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ReplyInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		ReplyService dao = new ReplyServiceImpl();
		
		ReplyVO insertVO = new ReplyVO();
		insertVO.setMemberId((String)session.getAttribute("loginId"));
		insertVO.setBoardId(Integer.parseInt(request.getParameter("boardId")));
		insertVO.setReplyContent(request.getParameter("replyContent"));
		
		int numIns = dao.replyInsert(insertVO);
		if (numIns != 0) {
			request.setAttribute("menu", "community");
			String page = "community/communityFreePage";
			ViewResolve.foward(request, response, page);
		} else {
			System.out.println("추가 실패!!");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
