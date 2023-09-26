package co.four.study.packages.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import co.four.study.packages.service.PackageService;
import co.four.study.packages.service.PackageVO;
import co.four.study.packages.serviceImpl.PackageServiceImpl;

@WebServlet("/ajaxpackagelist.do")
public class AjaxPackageList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxPackageList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper objectMapper = new ObjectMapper().registerModule(new JavaTimeModule());
		PackageService dao = new PackageServiceImpl();
		PackageVO vo = new PackageVO();
		List<PackageVO> packages = new ArrayList<PackageVO>();
		
		String category = request.getParameter("category");
		String grade = request.getParameter("grade");
		vo.setPackageCategory(category);
		vo.setPackageGrade(grade);
		
		packages = dao.packageSelectList(vo);
		
		// 할인금액 구하기(반복문 돌아야함)
		for(int i=0; i<packages.size(); i++) {
			vo.setPackageId(packages.get(i).getPackageId()); //패키지아이디 set
			int salePrice = dao.salePrice(vo); //결과값을 packages.get(i).setSalePrice();해줘야함.
			packages.get(i).setSalePrice(salePrice);
		}
		
		String list = objectMapper.writeValueAsString(packages); // list형태의 데이터 => json형태로
		
		response.setContentType("text/json; charset=UTF-8"); // 한글깨짐 방지
		response.getWriter().append(list); //ajax를 return
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
