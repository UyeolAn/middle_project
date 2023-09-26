package co.four.study.packages.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.common.ViewResolve;
import co.four.study.packages.service.PackageService;
import co.four.study.packages.service.PackageVO;
import co.four.study.packages.serviceImpl.PackageServiceImpl;

@WebServlet("/packagelist.do")
public class PackageList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PackageList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PackageService dao = new PackageServiceImpl();
		List<PackageVO> packages = new ArrayList<PackageVO>();
		
		packages = dao.packageSelectList();
		
		
		// 페이지 포워딩
		String page = "package/packageList";
		request.setAttribute("menu", "package");
		ViewResolve.foward(request, response, page);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
