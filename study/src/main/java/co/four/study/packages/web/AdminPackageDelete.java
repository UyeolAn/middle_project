package co.four.study.packages.web;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.four.study.packages.service.PackageService;
import co.four.study.packages.service.PackageVO;
import co.four.study.packages.serviceImpl.PackageServiceImpl;


@WebServlet("/adminpackagedelete.do")
public class AdminPackageDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminPackageDelete() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper objectMapper = new ObjectMapper();
		PackageVO vo = new PackageVO();
		PackageService dao = new PackageServiceImpl();
		
		vo.setPackageId(Integer.parseInt(request.getParameter("pid")));
		
		Map<String, Object> resultMap = new HashMap<>();
		
		if (dao.packageDelete(vo) == 1) {
			response.sendRedirect("adminpackagelist.do");
		}
		else {
			resultMap.put("retCode", "Fail");		
		}
		
		
		
		String json = objectMapper.writeValueAsString(resultMap);
		response.setContentType("text/json; charset=UTF-8");
		response.getWriter().print(json);
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
