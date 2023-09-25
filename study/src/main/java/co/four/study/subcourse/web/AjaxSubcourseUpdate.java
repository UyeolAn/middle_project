package co.four.study.subcourse.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.four.study.subcourse.service.SubCourseService;
import co.four.study.subcourse.service.SubCourseVO;
import co.four.study.subcourse.serviceImpl.SubCourseServiceImpl;


@WebServlet("/ajaxsubcourseupdate.do")
public class AjaxSubcourseUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AjaxSubcourseUpdate() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		SubCourseVO vo = new SubCourseVO();
		SubCourseService dao = new SubCourseServiceImpl();
		
		vo.setSubcourseId(Integer.parseInt(request.getParameter("scId")));
		vo.setSubcourseName(request.getParameter("scName"));
		vo.setSubcourseLink(request.getParameter("scLink"));
		vo.setSubcourseTime(Integer.parseInt(request.getParameter("scTime"))*60);
		
		
		Map<String, Object> resultMap = new HashMap<>();
		
		if(dao.subcourseUpdate(vo) == 1) {
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
