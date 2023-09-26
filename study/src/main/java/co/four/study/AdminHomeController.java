package co.four.study;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.common.ViewResolve;
import co.four.study.course.service.CourseService;
import co.four.study.course.service.CourseVO;
import co.four.study.course.serviceImpl.CourseServiceImpl;
import co.four.study.member.service.MemberService;
import co.four.study.member.service.MemberVO;
import co.four.study.member.serviceImpl.MemberServiceImpl;
import co.four.study.memberCourse.service.MemberCourseService;
import co.four.study.memberCourse.service.MemberCourseVO;
import co.four.study.memberCourse.serviceImpl.MemberCourseServiceImpl;
import co.four.study.question.service.QuestionService;
import co.four.study.question.service.QuestionVO;
import co.four.study.question.serviceImpl.QuestionServiceImpl;


@WebServlet("/adminhome.do")
public class AdminHomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminHomeController() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QuestionService qdao = new QuestionServiceImpl();
		MemberService mdao = new MemberServiceImpl();
		MemberCourseService mcdao = new MemberCourseServiceImpl();
		CourseService cdao = new CourseServiceImpl();
		
		
		//현재 회원수
		List<MemberVO> mlist = mdao.memberList();
		int memberCount = mlist.size();
		
		//현재 매출액
		int totalP = mcdao.totalPrice();
		
		//현재 강의수
		List<CourseVO> clist = cdao.courseSelectList(null);
		int courseCount = clist.size();
		
		
		//it강의수
		List<CourseVO> itlist = cdao.itcourselist();
		int it = itlist.size();
		//차트 임시
		Map<String, Double> submap = new HashMap<>();
		String arr[] = new String[] {"java","python","c++","c","c#"};
//		for(int i = 0; i < arr.length; i++) {
//			CourseVO vo = new CourseVO();
//			vo.setCourseSubCategory(arr[i]);
//			List<CourseVO> sublist = cdao.itcourseSub(vo);
//			//int sub = sublist.size();
//			double per = (it/sub)*100;
//			System.out.println(arr[i]+": "+sub+" / "+it+" / "+per);
//			submap.put(arr[i], per);
//		}
		
		//답변안한 질문 리스트
		List<QuestionVO> qlist = qdao.unanswerQuestionList();
//		System.out.println(qlist);
		
		//답변안한 질문 갯수
		int unanswerQ = qlist.size();
		
		System.out.println(submap);
		
		request.setAttribute("newQ", unanswerQ);
		request.setAttribute("members", memberCount);
		request.setAttribute("totalP", totalP);
		request.setAttribute("courses", courseCount);
//		request.setAttribute("sub", submap);
		request.setAttribute("qlist", qlist);
		
		String page = "admin/home/home";
		ViewResolve.foward(request, response, page);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
