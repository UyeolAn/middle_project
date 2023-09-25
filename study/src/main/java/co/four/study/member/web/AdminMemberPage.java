package co.four.study.member.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.bucket.service.BucketService;
import co.four.study.bucket.serviceImpl.BucketServiceImpl;
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
import co.four.study.question.serviceImpl.QuestionServiceImpl;
import co.four.study.reply.service.ReplyService;
import co.four.study.reply.serviceImpl.ReplyServiceImpl;
import co.four.study.review.service.ReviewService;
import co.four.study.review.serviceImpl.ReviewServiceImpl;


@WebServlet("/adminmemberpage.do")
public class AdminMemberPage extends HttpServlet {
	//회원 상세정보 열어주는 서블릿
	private static final long serialVersionUID = 1L;
       

    public AdminMemberPage() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//회원 아이디 받아옴
		String mid = request.getParameter("mid");
		System.out.println(mid);
		MemberService dao = new MemberServiceImpl();
		MemberCourseVO mcvo = new MemberCourseVO();
		MemberCourseService mcdao = new MemberCourseServiceImpl();
		CourseService cdao = new CourseServiceImpl();
		CourseVO cvo = new CourseVO();
		ReviewService reviewdao = new ReviewServiceImpl();
		ReplyService replydao = new ReplyServiceImpl();
		QuestionService Qdao = new QuestionServiceImpl();
		BucketService bdao = new BucketServiceImpl();
		
		
		MemberVO memvo = new MemberVO();
		memvo.setMemberId(mid);
		
		mcvo.setMemberId(mid);
		
		List<MemberCourseVO> mcvolist = mcdao.selectMemberCourseList(memvo);
//		System.out.println(mcvolist);
		
		for(MemberCourseVO vo : mcvolist) {
//			System.out.println(vo);
			mcvo.setMemberId(mid);
			mcvo.setCourseId(vo.getCourseId());
//			System.out.println(mcvo);
			mcvo = mcdao.countJindo(mcvo);
			vo.setCount(mcvo.getCount());
			vo.setTcnt(mcvo.getTcnt());
			double jindo = Math.round(((double)vo.getCount()/vo.getTcnt()) * 100);
			if(Double.isNaN(jindo)) jindo = 0;
			if(jindo>100) jindo = 100;
			vo.setJindo(jindo);
			cvo.setCourseId(vo.getCourseId());
			cvo = cdao.courseSelect(cvo);
			vo.setCourseName(cvo.getCourseName());
		}
		
		List<String> category = mcdao.category(memvo);
		

		//회원이 수강하는 카테고리 종류
		List<String> disCategory = mcdao.distinctStudentCategory(mcvo);
		
//		//회원이 듣는 강의수
//		int countCourse = mcvolist.size();
//		
//		//카테고리 별로 수강률 넣음
//		Map<String, Double> catePercent = new HashMap<>();
//		
//		for(String c : disCategory) {
//			MemberCourseVO mcvo2 = new MemberCourseVO();
//			mcvo2.setMemberId(mid);
//			mcvo2.setCourseMainCategory(c);
//			
//			//카테고리별로 몇개인지
//			int count = mcdao.countStudentCategory(mcvo);
//			double per = Math.round(((double)count/countCourse)*100);
//			catePercent.put(c, per);
//			
//		}
		//회원정보 조회 함수
		memvo = dao.memberPage(mid);
	
		int price = mcdao.priceSum(memvo);
		int review = reviewdao.countReview(memvo);
		int reply = replydao.countReply(memvo);
		int q = Qdao.countQuestion(memvo);
		int bucket = bdao.countBucket(memvo);
		
		request.setAttribute("m", memvo);
		request.setAttribute("mclist", mcvolist);
		request.setAttribute("category", category);
		request.setAttribute("price", price);
		request.setAttribute("review", review);
		request.setAttribute("reply", reply);
		request.setAttribute("question", q);
		request.setAttribute("bucket", bucket);
//		request.setAttribute("per", catePercent);
		
		String page = "admin/member/memberPage";
		ViewResolve.foward(request, response, page);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
