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

@WebServlet("/recommenddelete.do")
public class RecommendDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RecommendDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RecommendService dao = new RecommendServiceImpl();
		
		RecommendVO deleteVO = new RecommendVO();
		deleteVO.setMemberId(request.getParameter("memberId"));
		deleteVO.setBoardId(Integer.parseInt(request.getParameter("boardId")));
		deleteVO.setRecommendValue(request.getParameter("recommendValue"));
		
		int numDel = dao.recommendDelete(deleteVO);
		if (numDel != 0) {
			Map<String, String> messageMap = new HashMap<>();
			if (deleteVO.getRecommendValue().equals("like")) {
				messageMap.put("message", "게시글에 좋아요를 취소하였습니다.");
			} else {
				messageMap.put("message", "게시글에 싫어요를 취소하였습니다.");
			}
			
			ObjectMapper objectMapper = new ObjectMapper();
			String messageJson = objectMapper.writeValueAsString(messageMap);
			
			response.setContentType("text/json;charset=utf-8");
			response.getWriter().print(messageJson);
		} else {
			System.out.println("추천 삭제 실패");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
