package co.four.study.board.web.page;

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

@WebServlet("/communityfreeupdatepage.do")
public class CommunityFreeUpdatePage extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public CommunityFreeUpdatePage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService dao = new BoardServiceImpl();
		
		BoardVO dto = new BoardVO();
		dto.setBoardId(Integer.parseInt(request.getParameter("boardId")));
		
		BoardVO selectedVO = dao.boardSelect(dto);
		if (selectedVO != null) {
			String page = "community/communityFreeUpdatePage";
			request.setAttribute("menu", "community");
			request.setAttribute("cid", "free");
			request.setAttribute("board", selectedVO);
			ViewResolve.foward(request, response, page);
		} else {
			System.out.println("게시글 불러오기에 실패하였습니다.");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
