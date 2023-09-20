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

@WebServlet("/boardinsert.do")
public class BoardInsert extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardInsert() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardService dao = new BoardServiceImpl();
		
		BoardVO insertVO = new BoardVO();
		insertVO.setMemberId("uyeol"); // 나중에 로그인 세션의 id 값으로 바꿔줘야함
		insertVO.setBoardTitle(request.getParameter("boardTitle"));
		insertVO.setBoardContent(request.getParameter("boardContent"));
//		insertVO.setBoardImg(null); // 나중에 이미지 추가 기능도 넣어줘야함
		
		int numIns = dao.boardInsert(insertVO);
		if (numIns != 0) {
			request.setAttribute("menu", "community");
			String page = "community/communityFreePage";
			ViewResolve.foward(request, response, page);
		} else {
			System.out.println("추가 실패!!");
		}
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
