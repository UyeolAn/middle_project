package co.four.study.packages.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.four.study.packages.service.PackageService;
import co.four.study.packages.service.PackageVO;
import co.four.study.packages.serviceImpl.PackageServiceImpl;


@WebServlet("/adminpackageupdate.do")
public class AdminPackageUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AdminPackageUpdate() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PackageVO vo = new PackageVO();
		PackageService dao = new PackageServiceImpl();
		String saveDir = getServletContext().getRealPath("client/img/product");//servletContext: prjdb, realPath: webapp/attech/notice 실제경로, 파일이 바로바로 보임 현업에서는 안씀
		int maxSize = 1024*1024*100;
		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, "utf-8", new DefaultFileRenamePolicy());//파일명이 동일할때 자동으로 1,2,3..
		
		
		vo.setPackageId(Integer.parseInt(multi.getParameter("packageId")));
		vo.setPackageTitle(multi.getParameter("packageTitle"));
		vo.setPackageScript(multi.getParameter("packageScript"));
		vo.setPackageDiscount(Integer.parseInt(multi.getParameter("packageDiscount")));
		vo.setPackageGrade(multi.getParameter("packageGrade"));
		vo.setPackageThumbnail(multi.getFilesystemName("packageThumbnail"));
		vo.setPackageImg(multi.getFilesystemName("packageImg"));
		
		if(dao.packageUpdate(vo) == 1) {
			response.sendRedirect("admincoursepage.do?cid="+vo.getPackageId());
		}

	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
