package co.four.study.reply.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.four.study.common.DataSource;
import co.four.study.member.service.MemberVO;
import co.four.study.reply.map.ReplyMapper;
import co.four.study.reply.service.ReplyService;
import co.four.study.reply.service.ReplyVO;

public class ReplyServiceImpl implements ReplyService {

	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	
	private ReplyMapper map = sqlSession.getMapper(ReplyMapper.class);
	
	@Override
	public List<ReplyVO> replySelectList() {
		return map.replySelectList();
	}

	@Override
	public ReplyVO replySelect(ReplyVO vo) {
		return map.replySelect(vo);
	}

	@Override
	public int replyInsert(ReplyVO vo) {
		return map.replyInsert(vo);
	}

	@Override
	public int replyUpdate(ReplyVO vo) {
		return map.replyUpdate(vo);
	}

	@Override
	public int replyDelete(ReplyVO vo) {
		return map.replyDelete(vo);
	}

	@Override
	public int countBoardReply(int id) {
		return map.countBoardReply(id);
	}

	@Override
	public int countReply(MemberVO vo) {
		return map.countReply(vo);
	}

}
