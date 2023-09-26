package co.four.study.packages.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.common.ViewResolve;
import co.four.study.packages.service.PackageService;
import co.four.study.packages.service.PackageVO;
import co.four.study.packages.serviceImpl.PackageServiceImpl;


@WebServlet("/adminpackagemodify.do")
public class AdminPackageModify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminPackageModify() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PackageVO vo = new PackageVO();
		PackageService dao = new PackageServiceImpl();
		vo.setPackageId(Integer.parseInt(request.getParameter("pid")));
		vo = dao.packageSelect(vo);
		
		
		request.setAttribute("p", vo);
		
		String page = "admin/package/packageModify";
		ViewResolve.foward(request, response, page);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
