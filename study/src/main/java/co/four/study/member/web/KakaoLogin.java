package co.four.study.member.web;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.four.study.common.ViewResolve;
import co.four.study.member.service.MemberService;
import co.four.study.member.service.MemberVO;
import co.four.study.member.serviceImpl.MemberServiceImpl;


@WebServlet("/KakaoLogin.do")
public class KakaoLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public KakaoLogin() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService dao = new MemberServiceImpl();
		MemberVO vo = new MemberVO();
		HttpSession session = request.getSession();
		vo.setMemberId(request.getParameter("id"));
		String msg;
		
		vo = dao.memberSelect(vo);
		System.out.println(vo);
		System.out.println(request.getParameter("id"));
		if (vo != null) {
			if(vo.getMemberStopDate()!= null) {
		        msg = "차단당한 회원입니다.";
		        System.out.println(msg);
//		        response.sendRedirect("home.do");
//		        RequestDispatcher rd = request.getRequestDispatcher("/home.do");
//		        
//		        rd.forward(request, response);
		        session.setAttribute("block", true);
			}
			else {			
				System.out.println("차단아님");
				session.setAttribute("loginId", vo.getMemberId());
				session.setAttribute("loginName", vo.getMemberName());
				session.setAttribute("loginAuthor", "client");
				session.setAttribute("isKakaoUser", true);
				session.setAttribute("block", false);
				
				if (session.getAttribute("loginAuthor").equals("admin")) {
					//response.sendRedirect("adminhome.do");// 관리자 페이지 링크
//			        RequestDispatcher rd = request.getRequestDispatcher("/adminhome.do");
//			        
//			        rd.forward(request, response);
				} 
				else {
					//msg = vo.getMemberName() + "님 어서오세요";
					//request.setAttribute("msg", msg);
//				String page = "home/home.jsp";
//				ViewResolve.foward(request, response, page);
					
					//response.sendRedirect("home.do");
//			        RequestDispatcher rd = request.getRequestDispatcher("/home.do");
//			        
//			        rd.forward(request, response);
				}
				
			}
			
		} 
		else {
			// msg = "아이디 또는 비밀번호가 틀렸습니다.";
			//request.setAttribute("loginmsg", msg);
			System.out.println("회원가입이동");
			session.setAttribute("block", false);
            session.setAttribute("kakaoEmail", request.getParameter("id"));
            session.setAttribute("kakaoNickname", request.getParameter("name"));

		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
