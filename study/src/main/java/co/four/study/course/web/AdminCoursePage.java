package co.four.study.course.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.common.ViewResolve;
import co.four.study.course.service.CourseService;
import co.four.study.course.service.CourseVO;
import co.four.study.course.serviceImpl.CourseServiceImpl;
import co.four.study.memberCourse.service.MemberCourseService;
import co.four.study.memberCourse.serviceImpl.MemberCourseServiceImpl;
import co.four.study.question.service.QuestionService;
import co.four.study.question.service.QuestionVO;
import co.four.study.question.serviceImpl.QuestionServiceImpl;
import co.four.study.review.service.ReviewService;
import co.four.study.review.service.ReviewVO;
import co.four.study.review.serviceImpl.ReviewServiceImpl;
import co.four.study.subcourse.service.SubCourseService;
import co.four.study.subcourse.service.SubCourseVO;
import co.four.study.subcourse.serviceImpl.SubCourseServiceImpl;


@WebServlet("/admincoursepage.do")
public class AdminCoursePage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminCoursePage() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CourseVO vo = new CourseVO();
		ReviewVO rvo = new ReviewVO();
		QuestionVO qvo = new QuestionVO();
		CourseService dao = new CourseServiceImpl();	
		SubCourseService sdao = new SubCourseServiceImpl();
		MemberCourseService mcdao = new MemberCourseServiceImpl();
		ReviewService rdao = new ReviewServiceImpl();
		QuestionService qdao = new QuestionServiceImpl();

		
		//조회할 강의 아이디 받아옴
		int cid = Integer.parseInt(request.getParameter("cid"));
		vo.setCourseId(cid);

		//아이디를 이용하여 강의 정보 불러옴
		vo = dao.courseSelect(vo);

		//카테고리와 서브카테고리를 대문자로 바꾸어줌
		vo.setCourseMainCategory(vo.getCourseMainCategory().toUpperCase());
		vo.setCourseSubCategory(vo.getCourseSubCategory().toUpperCase());
		
		//메인강의의 하위강의 리스트 불러옴
		List<SubCourseVO> slist = sdao.subcourseByCourse(vo);
		
		//수강하는 학생수 불러옴
		int students = mcdao.courseStudent(vo);

		//서브강의들 강의 시간 넣어줌
		for(int i=0; i<slist.size(); i++) {
			slist.get(i).setSubcourseTime((slist.get(i).getSubcourseTime())/60);
		}

		//강의 후기
		rvo.setCourseId(cid);
		List<ReviewVO> rlist = rdao.reviewSelectList(rvo);
		int reviews = rlist.size();
		
		//강의 질문
		qvo.setCourseId(cid);
		List<QuestionVO> qlist = qdao.questionSelectList(qvo);
		int questions = qlist.size();
		
		
		String page = "admin/course/coursePage";
		
		System.out.println(cid);
		
		request.setAttribute("c", vo);
		request.setAttribute("subcourse", slist);
		request.setAttribute("students", students);
		request.setAttribute("reviews", reviews);
		request.setAttribute("questions", questions);
		ViewResolve.foward(request, response, page);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
