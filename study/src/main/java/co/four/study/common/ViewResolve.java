package co.four.study.common;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewResolve {
	
	public static void foward(HttpServletRequest request, HttpServletResponse response, String page) 
			throws ServletException, IOException {
		String prefix = "WEB-INF/views/";
		String subfix = ".tiles";
		String path = page + subfix;
		
		if(page.endsWith(".jsp")) { //타일즈 안탐
			path = prefix + page;
		}
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

}
