package co.four.study.subcourse.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.subcourse.service.SubCourseService;
import co.four.study.subcourse.service.SubCourseVO;
import co.four.study.subcourse.serviceImpl.SubCourseServiceImpl;


@WebServlet("/ajaxsubcoursedel.do")
public class AjaxSubcourseDel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AjaxSubcourseDel() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SubCourseVO vo = new SubCourseVO();
		SubCourseService dao = new SubCourseServiceImpl();
		
		
		vo.setSubcourseId(Integer.parseInt(request.getParameter("sid")));
		
		if (dao.subcourseDelete(vo) == 1) {
			response.getWriter().print("{\"retCode\": \"Success\"}");
		}
		else {
			response.getWriter().print("{\"retCode\" : \"Fail\"}");
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
