package co.four.study.bucket.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.bucket.service.BucketService;
import co.four.study.bucket.service.BucketVO;
import co.four.study.bucket.serviceImpl.BucketServiceImpl;

@WebServlet("/bucketinsert.do")
public class BucketInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BucketInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BucketService dao = new BucketServiceImpl();
		BucketVO vo = new BucketVO();
		int courseId = Integer.valueOf(request.getParameter("courseId"));
		String memberId = request.getParameter("memberId");
		
		vo.setCourseId(courseId); //0이 들어오면 안됨
		vo.setMemberId(memberId);
		int result = 0;
		BucketVO check = dao.bucketSelect(vo); //장바구니에 이미 담겨있는지 확인
		
		if(check != null) {
			//이미 담겨있으면 bucketlist.do로..
			System.out.println(courseId + "번강의는 이미 담겨있음");
			response.sendRedirect("bucketlist.do?memberId=" + memberId);
		} else if(check == null) {
			//장바구니에 없으면 추가
			System.out.println(courseId + "번강의를 장바구니에 추가함");
			result = dao.bucketInsert(vo);
		}
		
		if(result > 0) {
			//장바구니 페이지로 이동
			response.sendRedirect("bucketlist.do?memberId=" + memberId);
		} else {
			System.out.println("이미 담겨있는 강의 이거나, bucketinsert.do에서 오류 발생함.");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
