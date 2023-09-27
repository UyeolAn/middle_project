package co.four.study.packageBucket.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import co.four.study.packageBucket.service.PackageBucketService;
import co.four.study.packageBucket.service.PackageBucketVO;
import co.four.study.packageBucket.serviceImpl.PackageBucketServiceImpl;

@WebServlet("/ajaxpackagebucketdelete.do")
public class AjaxPackageBucketDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public AjaxPackageBucketDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ObjectMapper objectMapper = new ObjectMapper().registerModule(new JavaTimeModule());
		PackageBucketService pbdao = new PackageBucketServiceImpl();
		PackageBucketVO pbvo = new PackageBucketVO();
		int packageId = Integer.valueOf(request.getParameter("packageId"));
		String memberId = request.getParameter("memberId");
		
		pbvo.setPackageId(packageId);
		pbvo.setMemberId(memberId);
		
		int result = pbdao.pbucketDelete(pbvo);
		Map<String, String> message = new HashMap<String, String>();
		
		if(result > 0) { //삭제된게 있으면
			message.put("message", "success");
		} else {
			message.put("message", "fail");
		}
		
		String text = objectMapper.writeValueAsString(message); // list형태의 데이터 => json형태로
		
		response.setContentType("text/json; charset=UTF-8"); // 한글깨짐 방지
		response.getWriter().append(text); //ajax를 return
		return;
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
