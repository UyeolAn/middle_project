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

@WebServlet("/boarddelete.do")
public class BoardDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService dao = new BoardServiceImpl();
		
		BoardVO deleteVO = new BoardVO();
		deleteVO.setBoardId(Integer.parseInt(request.getParameter("boardId")));
		
		int numDel = dao.boardDelete(deleteVO);
		if (numDel != 0) {
			request.setAttribute("menu", "community");
			String page = "community/communityFreePage";
			ViewResolve.foward(request, response, page);
		} else {
			System.out.println("삭제 실패!!");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
