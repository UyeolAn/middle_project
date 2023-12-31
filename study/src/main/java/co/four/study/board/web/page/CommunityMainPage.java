package co.four.study.board.web.page;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.common.ViewResolve;

@WebServlet("/communitymainpage.do")
public class CommunityMainPage extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CommunityMainPage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = "community/communityMainPage";
		request.setAttribute("menu", "community");
		ViewResolve.foward(request, response, page);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
