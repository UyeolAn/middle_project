package co.four.study.board.web.json;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		BoardVO updateVO = new BoardVO();
		updateVO.setBoardId(Integer.parseInt(request.getParameter("boardId")));
		updateVO.setBoardTitle(request.getParameter("boardTitle"));
		updateVO.setBoardContent(request.getParameter("boardContent"));
		
		int numUpd = dao.boardUpdate(updateVO);
		if (numUpd != 0) {
			request.setAttribute("menu", "community");
			String page = "community/communityFreePage";
			ViewResolve.foward(request, response, page);
		} else {
			System.out.println("수정 실패!!");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
