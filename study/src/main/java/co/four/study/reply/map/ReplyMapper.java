package co.four.study.reply.map;

import java.util.List;

import co.four.study.reply.service.ReplyVO;

public interface ReplyMapper {
	
	List<ReplyVO> replySelectList();
	
	ReplyVO replySelect(ReplyVO vo);
	
	int replyInsert(ReplyVO vo);
	
	int replyUpdate(ReplyVO vo);
	
	int replyDelete(ReplyVO vo);
	
}
