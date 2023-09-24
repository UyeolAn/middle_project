package co.four.study.bucket.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ajaxbucketinsert.do")
public class AjaxBucketInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxBucketInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int courseId = Integer.valueOf(request.getParameter("courseId"));
		System.out.println("ajaxbucketinsert.do 받아온 강의 아이디 = " + courseId);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
