package co.four.study.question.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.answer.service.AnswerService;
import co.four.study.answer.service.AnswerVO;
import co.four.study.answer.serviceImpl.AnswerServiceImpl;
import co.four.study.common.ViewResolve;
import co.four.study.question.service.QuestionService;
import co.four.study.question.service.QuestionVO;
import co.four.study.question.serviceImpl.QuestionServiceImpl;


@WebServlet("/adminquestionpage.do")
public class AdminQuestionPage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminQuestionPage() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QuestionVO vo = new QuestionVO();
		QuestionService dao = new QuestionServiceImpl();
		AnswerVO avo = new AnswerVO();
		AnswerService adao = new AnswerServiceImpl();
		
		//질문정보 불러옴
		vo.setQuestionId(Integer.parseInt(request.getParameter("qid")));
		vo = dao.questionSelect(vo);

		//답변리스트 불러옴
		avo.setQuestionId(Integer.parseInt(request.getParameter("qid")));
		List<AnswerVO> alist = adao.answerSelectListbyQ(avo);

		
		request.setAttribute("q", vo);
		request.setAttribute("alist", alist);
		String page = "admin/question/questionPage";
		ViewResolve.foward(request, response, page);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
