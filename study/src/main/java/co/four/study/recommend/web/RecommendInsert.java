package co.four.study.recommend.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.four.study.recommend.service.RecommendService;
import co.four.study.recommend.service.RecommendVO;
import co.four.study.recommend.serviceImpl.RecommendServiceImpl;

@WebServlet("/recommendinsert.do")
public class RecommendInsert extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public RecommendInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RecommendService dao = new RecommendServiceImpl();
		
		RecommendVO insertVO = new RecommendVO();
		insertVO.setMemberId(request.getParameter("memberId"));
		insertVO.setBoardId(Integer.parseInt(request.getParameter("boardId")));
		insertVO.setRecommendValue(request.getParameter("recommendValue"));
		
		int numIns = dao.recommendInsert(insertVO);
		if (numIns != 0) {
			Map<String, String> messageMap = new HashMap<>();
			if (insertVO.getRecommendValue().equals("like")) {
				messageMap.put("message", "게시글에 좋아요를 눌렀습니다!!");
			} else {
				messageMap.put("message", "게시글에 싫어요를 눌렀습니다.");
			}
			
			ObjectMapper objectMapper = new ObjectMapper();
			String messageJson = objectMapper.writeValueAsString(messageMap);
			
			response.setContentType("text/json;charset=utf-8");
			response.getWriter().print(messageJson);
		} else {
			System.out.println("추천 추가 실패");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
