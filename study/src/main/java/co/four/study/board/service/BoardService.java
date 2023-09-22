package co.four.study.board.service;

import java.util.List;

import co.four.study.board.service.etcvo.BoardSearchVO;

public interface BoardService {
	
	List<BoardVO> boardSelectList(String sortType);
	
	BoardVO boardSelect(BoardVO vo);
	
	int boardInsert(BoardVO vo);
	
	int boardUpdate(BoardVO vo);
	
	int boardDelete(BoardVO vo);
	
	
	// 게시글 검색
	List<BoardVO> searchBoards(BoardSearchVO vo);
	
	// 게시글 페이징 검색
	List<BoardVO> searchBoardsWithPaging(BoardSearchVO vo);
	
	// 게시글 카운트
	int countBoards(BoardSearchVO vo);

}
