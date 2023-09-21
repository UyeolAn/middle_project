package co.four.study.member.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.common.ViewResolve;


@WebServlet("/searchpassword.do")
public class SearchPassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public SearchPassword() {
        super();
       
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String page = "common/serchpass.jsp";
		ViewResolve.foward(request, response, page);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
