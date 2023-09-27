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
import co.four.study.recommend.service.RecommendService;
import co.four.study.recommend.service.etcvo.RecommendCountVO;
import co.four.study.recommend.serviceImpl.RecommendServiceImpl;

@WebServlet("/communityfreedetailpage.do")
public class CommunityFreeDetailPage extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

    public CommunityFreeDetailPage() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService boardDao = new BoardServiceImpl();
		RecommendService recommendDao = new RecommendServiceImpl();
		
		int boardId = Integer.parseInt(request.getParameter("boardId"));
		
		BoardVO dto = new BoardVO();
		dto.setBoardId(boardId);
		
		BoardVO selectedVO = boardDao.boardSelect(dto);
		if (selectedVO != null) {
			RecommendCountVO countVO = recommendDao.countRecommend(boardId);
			selectedVO.setBoardLike(countVO.getBoardLike());
			selectedVO.setBoardDislike(countVO.getBoardDislike());
			
			request.setAttribute("menu", "community");
			request.setAttribute("cid", "free");
			request.setAttribute("board", selectedVO);
			
			String page = "community/communityFreeDetailPage";
			ViewResolve.foward(request, response, page);
		} else {
			System.out.println("게시글 불러오기에 실패하였습니다.");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
