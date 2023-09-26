package co.four.study.board.web.json;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.four.study.board.service.BoardService;
import co.four.study.board.service.BoardVO;
import co.four.study.board.serviceImpl.BoardServiceImpl;

@WebServlet("/boardinsert.do")
public class BoardInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
		BoardService dao = new BoardServiceImpl();
		
		String saveDir = getServletContext().getRealPath("client/img/board");
		int maxSize = 1024*1024*100;
		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, "utf-8", new DefaultFileRenamePolicy());

		BoardVO insertVO = new BoardVO();
		insertVO.setMemberId((String)session.getAttribute("loginId"));
		insertVO.setBoardTitle(multi.getParameter("boardTitle"));
		insertVO.setBoardContent(multi.getParameter("boardContent"));
		
		String realImg = multi.getFilesystemName("boardImg"); //저장되는 파일명
		insertVO.setBoardImg(realImg); //이미지 파일 명을 저장한다.
		
		int numIns = dao.boardInsert(insertVO);
		if (numIns != 0) {
			response.sendRedirect("communityfreepage.do");
		} else {
			System.out.println("추가 실패!!");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
