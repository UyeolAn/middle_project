package co.four.study.course.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.four.study.common.ViewResolve;
import co.four.study.course.service.CourseService;
import co.four.study.course.service.CourseVO;
import co.four.study.course.serviceImpl.CourseServiceImpl;


@WebServlet("/admincourseupdate.do")
public class AdminCourseUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminCourseUpdate() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CourseVO vo = new CourseVO(); 
		String saveDir = getServletContext().getRealPath("client/img/product");//servletContext: prjdb, realPath: webapp/attech/notice 실제경로, 파일이 바로바로 보임 현업에서는 안씀
		int maxSize = 1024*1024*100;
		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, "utf-8", new DefaultFileRenamePolicy());//파일명이 동일할때 자동으로 1,2,3..
		
		int id = Integer.parseInt(multi.getParameter("courseId"));
		vo.setCourseId(id);
		CourseService dao = new CourseServiceImpl();
//		
//		System.out.println(request.getParameter("courseName"));
//		System.out.println(request.getParameter("courseScript"));
//		System.out.println(request.getParameter("coursePrice"));
//		System.out.println(request.getParameter("courseTeacher"));
//		System.out.println(request.getParameter("courseMainCategory"));
//		System.out.println(request.getParameter("courseSubCategory"));
//		System.out.println(request.getParameter("courseGrade"));
//		System.out.println(request.getParameter("ckRealDel"));
		
		System.out.println(multi.getParameter("courseImg"));
		String img = multi.getFilesystemName("courseImg");
		if(multi.getParameter("ckRealDel").equals("true")) {
			img = "delete";
			vo.setCourseImg(img);
		}
		else if( img == null || img.isBlank() ) {
			vo.setCourseImg(img);
		}
		else {
			img = multi.getParameter("courseImg");
			String realImg = multi.getFilesystemName("courseImg"); //저장되는 파일명
			vo.setCourseImg(realImg); //이미지 파일 명을 저장한다.
		}
		
		if(img == null || img.length() == 0) {
			System.out.println("널값 셋팅");
		}
//		System.out.println(request.getParameter("courseImg"));
		vo.setCourseName(multi.getParameter("courseName"));
		vo.setCourseScript(multi.getParameter("courseScript"));
		vo.setCoursePrice(Integer.parseInt(multi.getParameter("coursePrice")));
		vo.setCourseTeacher(multi.getParameter("courseTeacher"));
		vo.setCourseMainCategory(multi.getParameter("courseMainCategory"));
		vo.setCourseSubCategory(multi.getParameter("courseSubCategory"));
		vo.setCourseGrade(multi.getParameter("courseGrade"));
//		vo.setCourseImg(img);

		
		int i = dao.courseUpdate(vo);
//		System.out.println("수정한 강의 정보 : "+vo);
		if(i == 1) {
//			request.setAttribute("message", "강의가 등록되었습니다.");
			response.sendRedirect("admincoursepage.do?cid="+id);
		}
		else {
			request.setAttribute("retCode", "Fail");
		}
		
//		
//		String page = "admin/course/coursePage";
//		
//		
//		request.setAttribute("c", vo);
//		ViewResolve.foward(request, response, page);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
