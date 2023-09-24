package co.four.study.question.web.json;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.common.ViewResolve;
import co.four.study.question.service.QuestionService;
import co.four.study.question.service.QuestionVO;
import co.four.study.question.serviceImpl.QuestionServiceImpl;

@WebServlet("/questionupdate.do")
public class QuestionUpdate extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public QuestionUpdate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QuestionService dao = new QuestionServiceImpl();
		
		int questionId = Integer.parseInt(request.getParameter("questionId"));
		
		QuestionVO updateVO = new QuestionVO();
		updateVO.setQuestionId(questionId);
		updateVO.setQuestionTitle(request.getParameter("questionTitle"));
		updateVO.setQuestionContent(request.getParameter("questionContent"));

		int numUpd = dao.questionUpdate(updateVO);
		if (numUpd != 0) {
			response.sendRedirect("communityqnadetailpage.do?questionId=" + questionId);
		} else {
			System.out.println("수정 실패!!");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
