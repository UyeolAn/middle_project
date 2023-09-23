package co.four.study.member.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.common.Sha256;
import co.four.study.member.service.MemberService;
import co.four.study.member.service.MemberVO;
import co.four.study.member.serviceImpl.MemberServiceImpl;


@WebServlet("/adminemployeeinsert.do")
public class AdminEmployeeInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminEmployeeInsert() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO vo = new MemberVO();
		MemberService dao = new MemberServiceImpl();
		
		vo.setMemberName(request.getParameter("name"));
		vo.setMemberId(request.getParameter("id"));
		vo.setMemberPassword(Sha256.encrypt(request.getParameter("password")));
		vo.setMemberTel(request.getParameter("tel"));
		vo.setMemberAddress(request.getParameter("address"));
		vo.setMemberAddress(request.getParameter("address1") +" "+request.getParameter("address2") + 
				request.getParameter("address3"));
		vo.setMemberEmail(request.getParameter("email"));

		
		if(dao.employeeInsert(vo) == 1) {
			response.sendRedirect("adminemployeelist.do");
		}
		else {
			request.setAttribute("retCode", "Fail");
		}
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
