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

@WebServlet("/communityqnadetailpage.do")
public class CommunityQnaDetailPage extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public CommunityQnaDetailPage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QuestionService dao = new QuestionServiceImpl();
		
		int questionId = Integer.parseInt(request.getParameter("questionId"));
		
		QuestionVO dto = new QuestionVO();
		dto.setQuestionId(questionId);
		
		QuestionVO selectedVO = dao.questionSelect(dto);
		if (selectedVO != null) {
			request.setAttribute("menu", "community");
			request.setAttribute("cid", "question");
			request.setAttribute("question", selectedVO);
			
			String page = "community/communityQnaDetailPage";
			ViewResolve.foward(request, response, page);
		} else {
			System.out.println("게시글 불러오기에 실패하였습니다.");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
