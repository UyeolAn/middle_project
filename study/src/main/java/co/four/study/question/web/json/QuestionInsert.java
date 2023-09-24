package co.four.study.question.web.json;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.four.study.common.ViewResolve;
import co.four.study.question.service.QuestionService;
import co.four.study.question.service.QuestionVO;
import co.four.study.question.serviceImpl.QuestionServiceImpl;

@WebServlet("/questioninsert.do")
public class QuestionInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public QuestionInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		QuestionService dao = new QuestionServiceImpl();
		
		String courseId = request.getParameter("selectCourse");
		
		QuestionVO insertVO = new QuestionVO();
		insertVO.setMemberId((String)session.getAttribute("loginId"));
		insertVO.setQuestionTitle(request.getParameter("questionTitle"));
		if (!courseId.equals("etc")) {
			insertVO.setCourseId(Integer.parseInt(courseId));
		}
		insertVO.setQuestionContent(request.getParameter("questionContent"));
//		insertVO.setBoardImg(null); // 나중에 이미지 추가 기능도 넣어줘야함
		
		int numIns = dao.questionInsert(insertVO);
		if (numIns != 0) {
			response.sendRedirect("communityqnapage.do");
		} else {
			System.out.println("추가 실패!!");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
