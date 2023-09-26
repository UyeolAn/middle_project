package co.four.study.question.web.json;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.four.study.question.service.QuestionService;
import co.four.study.question.service.QuestionVO;
import co.four.study.question.serviceImpl.QuestionServiceImpl;

@WebServlet("/questioninsert.do")
public class QuestionInsert extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public QuestionInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		QuestionService dao = new QuestionServiceImpl();
		
		String saveDir = getServletContext().getRealPath("client/img/question");
		int maxSize = 1024*1024*100;
		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
		String courseId = multi.getParameter("selectCourse");
		
		QuestionVO insertVO = new QuestionVO();
		insertVO.setMemberId((String)session.getAttribute("loginId"));
		insertVO.setQuestionTitle(multi.getParameter("questionTitle"));
		if (!courseId.equals("etc")) {
			insertVO.setCourseId(Integer.parseInt(courseId));
		}
		insertVO.setQuestionContent(multi.getParameter("questionContent"));
		
		String realImg = multi.getFilesystemName("questionImg"); //저장되는 파일명
		insertVO.setQuestionImg(realImg); //이미지 파일 명을 저장한다.
		
		int numIns = dao.questionInsert(insertVO);
		if (numIns != 0) {
			response.sendRedirect("communityqnapage.do");
		} else {
			System.out.println("추가 실패!!");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
