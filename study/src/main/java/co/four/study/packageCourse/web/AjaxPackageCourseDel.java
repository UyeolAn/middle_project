package co.four.study.packageCourse.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.four.study.packageCourse.service.PackageCourseService;
import co.four.study.packageCourse.service.PackageCourseVO;
import co.four.study.packageCourse.serviceImpl.PackageCourseServiceImpl;


@WebServlet("/ajaxpackagecoursedel.do")
public class AjaxPackageCourseDel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AjaxPackageCourseDel() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		PackageCourseService dao = new PackageCourseServiceImpl();
		
		PackageCourseVO vo = new PackageCourseVO();
		vo.setCourseId(Integer.parseInt(request.getParameter("cid")));
		vo.setPackageId(Integer.parseInt(request.getParameter("pid")));
		
		Map<String, Object> resultMap = new HashMap<>();
		
		if (dao.packageCourseDelete(vo) == 1) {
			resultMap.put("retCode", "Success");
		}
		else {
			resultMap.put("retCode", "Fail");
			
		}
		
		
		String json = objectMapper.writeValueAsString(resultMap);
		response.setContentType("text/json; charset=UTF-8");
		response.getWriter().print(json);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
