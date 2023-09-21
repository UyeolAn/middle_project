package co.four.study.member.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.four.study.member.service.MemberVO;
import co.four.study.memberCourse.service.MemberCourseService;
import co.four.study.memberCourse.service.MemberCourseVO;
import co.four.study.memberCourse.serviceImpl.MemberCourseServiceImpl;


@WebServlet("/ajaxmembercategorychart.do")
public class AjaxMemberCategoryChart extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AjaxMemberCategoryChart() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid");
		MemberCourseService mcdao = new MemberCourseServiceImpl();
		MemberVO memvo = new MemberVO();
		MemberCourseVO mcvo = new MemberCourseVO();
		
		//멤버아이디 넣은 멤버, 멤버강의 객체
		memvo.setMemberId(mid);
		mcvo.setMemberId(mid);
		
		
		//그 멤버가 듣는 강의 리스트 가져옴
		List<MemberCourseVO> mcvolist = mcdao.selectMemberCourseList(memvo);
		
		//회원이 듣는 강의수
		int countCourse = mcvolist.size();
		
		//카테고리 별로 수강률 넣을 해쉬맵
		Map<String, Double> catePercent = new HashMap<>();
		
		//회원이 수강하는 카테고리 종류 (중복없이 카테고리만 가져옴)
		List<String> disCategory = mcdao.distinctStudentCategory(mcvo);
		
		for(String c : disCategory) {
			mcvo.setCourseMainCategory(c);
			
			//카테고리별로 몇개인지
			int count = mcdao.countStudentCategory(mcvo);
			double per = Math.round(((double)count/countCourse)*100);
			catePercent.put(c, per);
			System.out.println(c+" : "+per);
			
		}
		
		ObjectMapper mapper = new ObjectMapper();
		String json = mapper.writeValueAsString(catePercent);
		response.getWriter().print(json);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
