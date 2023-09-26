package co.four.study.bucket.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.bucket.service.BucketService;
import co.four.study.bucket.service.BucketVO;
import co.four.study.bucket.serviceImpl.BucketServiceImpl;
import co.four.study.common.ViewResolve;
import co.four.study.course.service.CourseVO;
import co.four.study.member.service.MemberService;
import co.four.study.member.service.MemberVO;
import co.four.study.member.serviceImpl.MemberServiceImpl;

@WebServlet("/bucketlist.do")
public class BucketList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BucketList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BucketService dao = new BucketServiceImpl();
		MemberService mdao = new MemberServiceImpl();
		BucketVO vo = new BucketVO();
		MemberVO mvo = new MemberVO();
		String memberId = request.getParameter("memberId");
		
		vo.setMemberId(memberId);
		mvo.setMemberId(memberId);
		
		//해당멤버의 장바구니에 있는 강의정보 담기
		List<CourseVO> list = dao.memberBucketList(vo);
		request.setAttribute("courses", list);
		if(list.size() == 0) {
			request.setAttribute("message", "empty");
		}
		
		//장바구니 강의금액 합
		try {
			int sum = dao.sumCoursesPrice(vo);
			request.setAttribute("sum", sum);
		} catch (NullPointerException e) {
			request.setAttribute("sum", 0);
		}
		
		//회원정보 가져오기
		mvo = mdao.memberSelect(mvo);
		request.setAttribute("member", mvo);
		System.out.println(mvo);
		
		//장바구니 페이지 포워딩
		String page = "bucket/bucketList";
		request.setAttribute("menu", "mypage");
		ViewResolve.foward(request, response, page);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
