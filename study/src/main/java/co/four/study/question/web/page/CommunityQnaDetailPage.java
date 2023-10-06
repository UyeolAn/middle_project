package co.four.study.question.web.page;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.common.ViewResolve;
import co.four.study.course.service.CourseService;
import co.four.study.course.service.CourseVO;
import co.four.study.course.serviceImpl.CourseServiceImpl;
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
		QuestionService questionDao = new QuestionServiceImpl();
		CourseService courseDao = new CourseServiceImpl();
		
		int questionId = Integer.parseInt(request.getParameter("questionId"));
		
		QuestionVO questionDto = new QuestionVO();
		questionDto.setQuestionId(questionId);
		
		QuestionVO selectedVO = questionDao.questionSelect(questionDto);

		if (selectedVO != null) {
			CourseVO courseDto = new CourseVO();
			if (selectedVO.getCourseId() == null) {
				selectedVO.setCourseName("기타/홈페이지 질문");
			} else {
				courseDto.setCourseId(selectedVO.getCourseId());
				
				CourseVO cnameVO = courseDao.courseSelect(courseDto);
				selectedVO.setCourseName(cnameVO.getCourseName());
			}
			
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
