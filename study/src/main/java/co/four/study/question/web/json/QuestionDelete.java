package co.four.study.question.web.json;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.question.service.QuestionService;
import co.four.study.question.service.QuestionVO;
import co.four.study.question.serviceImpl.QuestionServiceImpl;

@WebServlet("/questiondelete.do")
public class QuestionDelete extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public QuestionDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QuestionService dao = new QuestionServiceImpl();
		
		QuestionVO deleteVO = new QuestionVO();
		deleteVO.setQuestionId(Integer.parseInt(request.getParameter("questionId")));
		
		int numDel = dao.questionDelete(deleteVO);
		if (numDel != 0) {
			response.sendRedirect("communityqnapage.do");
		} else {
			System.out.println("삭제 실패!!");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
