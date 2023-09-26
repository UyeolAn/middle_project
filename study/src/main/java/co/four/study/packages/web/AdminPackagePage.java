package co.four.study.packages.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import co.four.study.common.ViewResolve;
import co.four.study.course.service.CourseService;
import co.four.study.course.service.CourseVO;
import co.four.study.course.serviceImpl.CourseServiceImpl;
import co.four.study.packageCourse.service.PackageCourseService;
import co.four.study.packageCourse.service.PackageCourseVO;
import co.four.study.packageCourse.serviceImpl.PackageCourseServiceImpl;
import co.four.study.packages.service.PackageService;
import co.four.study.packages.service.PackageVO;
import co.four.study.packages.serviceImpl.PackageServiceImpl;


@WebServlet("/adminpackagepage.do")
public class AdminPackagePage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminPackagePage() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PackageVO vo = new PackageVO();
		PackageService dao = new PackageServiceImpl();
		CourseService cdao = new CourseServiceImpl();
		PackageCourseVO pcvo = new PackageCourseVO();
		PackageCourseService pcdao = new PackageCourseServiceImpl();
		
		//패키지 정보 받아옴
		vo.setPackageId(Integer.parseInt(request.getParameter("pid")));
		vo = dao.packageSelect(vo);
		
		//패키지에 속한 강의리스트
		pcvo.setPackageId(Integer.parseInt(request.getParameter("pid")));
		List<CourseVO> clist = cdao.packageCourseList(pcvo);
		
		//해당 카테고리의 강의리스트들(패키지에 속하지 않음)
		PackageVO pvo = new PackageVO();
		pvo.setPackageCategory(vo.getPackageCategory());
		pvo.setPackageId(vo.getPackageId());
		List<CourseVO> catelist = cdao.ListNotInPackage(pvo);
		
		//패키지 정가 계산
		int priceOriginal = pcdao.priceSumByPackage(pcvo);
		
		
		//패키지 할인가격 계산
		int priceSale =(int) ((int) priceOriginal * (1 - (vo.getPackageDiscount()*0.01)));
		
		
		
		vo.setPackageCategory(vo.getPackageCategory().toUpperCase());
		
		request.setAttribute("p", vo);
		request.setAttribute("clist", clist);
		request.setAttribute("catelist", catelist);
		request.setAttribute("original", priceOriginal);
		request.setAttribute("sale", priceSale);
		
		String page = "admin/package/packagepage";
		
		
		System.out.println(vo);
		ViewResolve.foward(request, response, page);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
