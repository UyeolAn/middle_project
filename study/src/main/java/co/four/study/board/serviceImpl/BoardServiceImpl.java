package co.four.study.board.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.four.study.board.map.BoardMapper;
import co.four.study.board.service.BoardService;
import co.four.study.board.service.BoardVO;
import co.four.study.board.service.etcvo.BoardSearchVO;
import co.four.study.common.DataSource;

public class BoardServiceImpl implements BoardService {

	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	
	private BoardMapper map = sqlSession.getMapper(BoardMapper.class);

	
	@Override
	public List<BoardVO> boardSelectList(String sortType) {
		return map.boardSelectList(sortType);
	}

	@Override
	public BoardVO boardSelect(BoardVO vo) {
		map.updateBoardHit(vo.getBoardId());
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

	@Override
	public List<BoardVO> searchBoards(BoardSearchVO vo) {
		return map.searchBoards(vo);
	}

	@Override
	public List<BoardVO> searchBoardsWithPaging(BoardSearchVO vo) {
		return map.searchBoardsWithPaging(vo);
	}

	@Override
	public int countBoards(BoardSearchVO vo) {
		return map.countBoards(vo);
	}

	@Override
	public int countBoardMember(BoardVO vo) {
				return map.countBoardMember(vo);
	}

	@Override
	public List<BoardVO> homeRecentBoard() {
		return map.homeRecentBoard();
	}

}
