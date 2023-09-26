package co.four.study.board.web.json;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import co.four.study.board.service.BoardService;
import co.four.study.board.service.BoardVO;
import co.four.study.board.serviceImpl.BoardServiceImpl;
import co.four.study.common.ViewResolve;

@WebServlet("/boardupdate.do")
public class BoardUpdate extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public BoardUpdate() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService dao = new BoardServiceImpl();
		
		String saveDir = getServletContext().getRealPath("client/img/board");
		int maxSize = 1024*1024*100;
		MultipartRequest multi = new MultipartRequest(request, saveDir, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
		int boardId = Integer.parseInt(multi.getParameter("boardId"));
		
		BoardVO updateVO = new BoardVO();
		updateVO.setBoardId(boardId);
		updateVO.setBoardTitle(multi.getParameter("boardTitle"));
		updateVO.setBoardContent(multi.getParameter("boardContent"));
		
		String realImg = multi.getFilesystemName("boardImg"); //저장되는 파일명
		updateVO.setBoardImg(realImg); //이미지 파일 명을 저장한다.
		
		int numUpd = dao.boardUpdate(updateVO);
		if (numUpd != 0) {
			response.sendRedirect("communityfreedetailpage.do?boardId=" + boardId);
		} else {
			System.out.println("수정 실패!!");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
