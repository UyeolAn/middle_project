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

@WebServlet("/bucketlist.do")
public class BucketList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BucketList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BucketService dao = new BucketServiceImpl();
		BucketVO vo = new BucketVO();
		String memberId = request.getParameter("memberId");
		
		vo.setMemberId(memberId);
		
		//해당멤버의 장바구니에 있는 강의정보 담기
		List<CourseVO> list = dao.memberBucketList(vo);
		request.setAttribute("courses", list);
		
		//장바구니 강의금액 합
		int sum = dao.sumCoursesPrice(vo);
		request.setAttribute("sum", sum);
		
		//장바구니 페이지 포워딩
		String page = "bucket/bucketList";
		request.setAttribute("menu", "mypage");
		ViewResolve.foward(request, response, page);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
