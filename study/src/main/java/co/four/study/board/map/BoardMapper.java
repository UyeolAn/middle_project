package co.four.study.board.map;

import java.util.List;

import co.four.study.board.service.BoardVO;

public interface BoardMapper {
	
	List<BoardVO> boardSelectList();
	
	BoardVO boardSelect(BoardVO vo);
	
	int boardInsert(BoardVO vo);
	
	int boardUpdate(BoardVO vo);
	
	int boardDelete(BoardVO vo);
	
}
