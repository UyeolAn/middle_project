package co.four.study.board.service.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.four.study.board.map.BoardMapper;
import co.four.study.board.service.BoardService;
import co.four.study.board.service.BoardVO;
import co.four.study.common.DataSource;

public class BoardServiceImpl implements BoardService {

	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	
	private BoardMapper map = sqlSession.getMapper(BoardMapper.class);
	
	@Override
	public List<BoardVO> boardSelectList() {
		return map.boardSelectList();
	}

	@Override
	public BoardVO boardSelect(BoardVO vo) {
		return map.boardSelect(vo);
	}

	@Override
	public int boardInsert(BoardVO vo) {
		return map.boardInsert(vo);
	}

	@Override
	public int boardUpdate(BoardVO vo) {
		return map.boardUpdate(vo);
	}

	@Override
	public int boardDelete(BoardVO vo) {
		return map.boardDelete(vo);
	}

}
