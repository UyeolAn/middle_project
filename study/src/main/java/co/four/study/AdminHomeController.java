package co.four.study;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.common.ViewResolve;
import co.four.study.member.service.MemberService;
import co.four.study.member.service.MemberVO;
import co.four.study.member.serviceImpl.MemberServiceImpl;
import co.four.study.memberCourse.service.MemberCourseService;
import co.four.study.memberCourse.service.MemberCourseVO;
import co.four.study.memberCourse.serviceImpl.MemberCourseServiceImpl;
import co.four.study.question.service.QuestionService;
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
		
		int unanswerQ = qdao.unanswerQuestion();
		
		List<MemberVO> mlist = mdao.memberList();
		int memberCount = mlist.size();
		
		int totalP = mcdao.totalPrice();
		
		request.setAttribute("newQ", unanswerQ);
		request.setAttribute("members", memberCount);
		request.setAttribute("totalP", totalP);
		
		String page = "admin/home/home";
		ViewResolve.foward(request, response, page);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
