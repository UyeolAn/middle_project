package co.four.study.member.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.common.ViewResolve;
import co.four.study.member.service.MemberService;
import co.four.study.member.service.MemberVO;
import co.four.study.member.serviceImpl.MemberServiceImpl;


@WebServlet("/adminemployeelist.do")
public class AdminEmployeeList extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminEmployeeList() {
        super();

    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService dao = new MemberServiceImpl();
		
		List<MemberVO> elist = dao.employeeList();
		request.setAttribute("elist", elist);
		
		
		String page = "admin/employee/employeeList";
		
		ViewResolve.foward(request, response, page);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
