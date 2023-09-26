package co.four.study.answer.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.four.study.answer.service.AnswerService;
import co.four.study.answer.service.AnswerVO;
import co.four.study.answer.serviceImpl.AnswerServiceImpl;
import co.four.study.question.service.QuestionService;
import co.four.study.question.service.QuestionVO;
import co.four.study.question.service.etcvo.QuestionSolveVO;
import co.four.study.question.serviceImpl.QuestionServiceImpl;


@WebServlet("/ajaxansweradd.do")
public class AjaxAnswerAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AjaxAnswerAdd() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ObjectMapper objectMapper = new ObjectMapper();
		AnswerVO vo = new AnswerVO();
		AnswerService dao = new AnswerServiceImpl();
		QuestionService qdao = new QuestionServiceImpl();
		
		vo.setQuestionId(Integer.parseInt(request.getParameter("qid")));
		vo.setAnswerContent(request.getParameter("content"));
	
		vo.setMemberId((String)session.getAttribute("loginId"));
		Map<String, Object> resultMap = new HashMap<>();
		
		if (dao.answerInsert(vo) == 1) {
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


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
