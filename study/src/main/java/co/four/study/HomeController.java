package co.four.study;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.board.service.BoardService;
import co.four.study.board.service.BoardVO;
import co.four.study.board.serviceImpl.BoardServiceImpl;
import co.four.study.common.ViewResolve;
import co.four.study.course.service.CourseService;
import co.four.study.course.service.CourseVO;
import co.four.study.course.serviceImpl.CourseServiceImpl;
import co.four.study.question.service.QuestionService;
import co.four.study.question.service.QuestionVO;
import co.four.study.question.serviceImpl.QuestionServiceImpl;

@WebServlet("/home.do")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public HomeController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CourseService dao = new CourseServiceImpl();
		BoardService bdao = new BoardServiceImpl();
		QuestionService qdao = new QuestionServiceImpl();
		
		//인기많은 강의
		List<CourseVO> hotList = dao.hotCourseList();
		for(CourseVO vo : hotList) {
			vo = dao.courseReviewSelect(vo);
			System.out.println(vo.getCourseStars());
		}
		//리뷰많은 강의
		List<CourseVO> reviewList = dao.reviewCourseList();
		for(CourseVO vo : reviewList) {
			vo = dao.courseReviewSelect(vo);
			System.out.println(vo.getCourseStars());
		}
		//랜덤 it강의
		List<CourseVO> itList = dao.itRandomCourseList();
		for(CourseVO vo : itList) {
			vo = dao.courseReviewSelect(vo);
			System.out.println(vo.getCourseStars());
		}
		
		//최신 자유게시판 게시글
		List<BoardVO> bList = bdao.homeRecentBoard();
		
		//최신 질문게시판 게시글
		List<QuestionVO> qList = qdao.homeRecentQuestion();
		
		request.setAttribute("hotList", hotList);
		request.setAttribute("reviewList", reviewList);
		request.setAttribute("itList", itList);
		request.setAttribute("blist", bList);
		request.setAttribute("qlist", qList);
		String page = "home/home.jsp";
		ViewResolve.foward(request, response, page);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
