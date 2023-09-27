package co.four.study.member.web.mypage.page;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.common.ViewResolve;

@WebServlet("/mypagemycommunitypage.do")
public class MypageMyCommunityPage extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public MypageMyCommunityPage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = "mypage/myPageMyCommunityPage";
		request.setAttribute("menu", "mypage");
		request.setAttribute("mid", "mycomm");
		ViewResolve.foward(request, response, page);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
