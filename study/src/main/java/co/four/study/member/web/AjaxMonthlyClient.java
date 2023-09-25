package co.four.study.member.web;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.four.study.member.service.MemberService;
import co.four.study.member.serviceImpl.MemberServiceImpl;


@WebServlet("/ajaxmonthlyclient.do")
public class AjaxMonthlyClient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AjaxMonthlyClient() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService mdao = new MemberServiceImpl();
		
		//월별 사용자 유입
		List<Map<String, Object>> monthlyClient = mdao.monthlyClient();
		
		System.out.println(monthlyClient);
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(monthlyClient);
		response.getWriter().print(json);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
