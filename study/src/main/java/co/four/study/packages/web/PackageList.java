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
		PackageVO vo = new PackageVO();
		List<PackageVO> packages = new ArrayList<PackageVO>();
		String grade = request.getParameter("grade");
		String category = request.getParameter("category");
		
		if(grade != null && category != null) {
			vo.setPackageGrade(grade);
			vo.setPackageCategory(category);
		}
		
		packages = dao.packageSelectList(vo); //(전체조회) : vo에 담긴 정보가 없어야함.
		
		// 할인금액,원가 구하기(반복문 돌아야함)
		for(int i=0; i<packages.size(); i++) {
			vo.setPackageId(packages.get(i).getPackageId()); //패키지아이디 set
			int salePrice = dao.salePrice(vo); //결과값을 packages.get(i).setSalePrice();해줘야함.
			packages.get(i).setSalePrice(salePrice);
			int coursesPrice = dao.coursesPrice(vo);
			packages.get(i).setCoursesPrice(coursesPrice);
		}
		
		if(packages.size() != 0) {
			request.setAttribute("packages", packages);
		} else if (packages.size() == 0) {
			request.setAttribute("result", "empty");
		}
		System.out.println(packages);
		
		
		
		// 페이지 포워딩
		String page = "package/packageList";
		request.setAttribute("menu", "package");
		ViewResolve.foward(request, response, page);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
