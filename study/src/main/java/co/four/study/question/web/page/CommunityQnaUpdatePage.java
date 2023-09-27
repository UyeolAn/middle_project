package co.four.study.question.web.page;

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

@WebServlet("/communityqnaupdatepage.do")
public class CommunityQnaUpdatePage extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public CommunityQnaUpdatePage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QuestionService dao = new QuestionServiceImpl();
		
		QuestionVO dto = new QuestionVO();
		dto.setQuestionId(Integer.parseInt(request.getParameter("questionId")));
		
		QuestionVO selectedVO = dao.questionSelect(dto);
		if (selectedVO != null) {
			String page = "community/communityQnaUpdatePage";
			request.setAttribute("menu", "community");
			request.setAttribute("cid", "question");
			request.setAttribute("question", selectedVO);
			ViewResolve.foward(request, response, page);
		} else {
			System.out.println("질문 불러오기에 실패하였습니다.");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
