package co.four.study.member.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;

@WebServlet("/checkLoginStatus.do")
public class CheckLoginStatus extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public CheckLoginStatus() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 세션에서 로그인 정보를 확인
        HttpSession session = request.getSession();
        boolean isLoggedIn = (session.getAttribute("loginId") != null);
        boolean block =  (boolean)session.getAttribute("block");
        System.out.println(block);

        // JSON 응답 생성
        ObjectMapper objectMapper = new ObjectMapper();
        Map<String, Boolean> responseData = new HashMap<>();
        responseData.put("isLoggedIn", isLoggedIn);
        responseData.put("block", block);
        String json = objectMapper.writeValueAsString(responseData);


        // JSON 응답
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(json);

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
