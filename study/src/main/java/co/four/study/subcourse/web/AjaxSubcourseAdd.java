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


@WebServlet("/ajaxsubcourseadd.do")
public class AjaxSubcourseAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AjaxSubcourseAdd() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		SubCourseVO vo = new SubCourseVO();
		SubCourseService dao = new SubCourseServiceImpl();

		vo.setCourseId(Integer.parseInt(request.getParameter("cid")));
		vo.setSubcourseName(request.getParameter("name"));
		vo.setSubcourseLink(request.getParameter("link"));
		vo.setSubcourseTime(Integer.parseInt(request.getParameter("time"))*60);
		
		
		Map<String, Object> resultMap = new HashMap<>();
		
		if (dao.subcourseInsert(vo) == 1) {
			resultMap.put("retCode", "Success");
			resultMap.put("data", vo);
		}
		else {
			resultMap.put("retCode", "Fail");
			
		}
		
		String json = objectMapper.writeValueAsString(resultMap);
		response.setContentType("text/json; charset=UTF-8");
		response.getWriter().print(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
