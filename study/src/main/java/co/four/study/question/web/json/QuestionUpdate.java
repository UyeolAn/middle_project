package co.four.study.question.web.json;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.four.study.question.service.QuestionService;
import co.four.study.question.service.QuestionVO;
import co.four.study.question.serviceImpl.QuestionServiceImpl;

@WebServlet("/questionupdate.do")
public class QuestionUpdate extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public QuestionUpdate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QuestionService dao = new QuestionServiceImpl();
		
		String saveDir = getServletContext().getRealPath("client/img/question");
		int maxSize = 1024*1024*100;
		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
		int questionId = Integer.parseInt(multi.getParameter("questionId"));
		
		QuestionVO updateVO = new QuestionVO();
		updateVO.setQuestionId(questionId);
		updateVO.setQuestionTitle(multi.getParameter("questionTitle"));
		updateVO.setQuestionContent(multi.getParameter("questionContent"));
		
		String updateImg = multi.getFilesystemName("questionImg"); //수정되는 파일명
		String currentImg = multi.getParameter("currentImg"); //현재 파일명
		if (updateImg != null) {
			updateVO.setQuestionImg(updateImg); //수정 이미지가 있을 경우
		} else if (currentImg != null) {
			updateVO.setQuestionImg(currentImg); //수정 이미지가 없을 경우
		} else {
			updateVO.setQuestionImg(null); //이미지 삭제를 요청한 경우
		}

		System.out.println(updateVO);
		int numUpd = dao.questionUpdate(updateVO);
		if (numUpd != 0) {
			response.sendRedirect("communityqnadetailpage.do?questionId=" + questionId);
		} else {
			System.out.println("수정 실패!!");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
