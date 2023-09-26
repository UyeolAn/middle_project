package co.four.study.answer.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.four.study.answer.service.AnswerService;
import co.four.study.answer.service.AnswerVO;
import co.four.study.answer.serviceImpl.AnswerServiceImpl;


@WebServlet("/ajaxanswerupdate.do")
public class AjaxAnswerUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AjaxAnswerUpdate() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		AnswerVO vo = new AnswerVO();
		AnswerService dao = new AnswerServiceImpl();
		
		vo.setAnswerId(Integer.parseInt(request.getParameter("aid")));
		vo.setAnswerContent(request.getParameter("content"));
		
		Map<String, Object> resultMap = new HashMap<>();
		
		if (dao.answerUpdate(vo) == 1) {
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
