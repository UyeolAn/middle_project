package co.four.study.reply.service;

import java.util.List;

public interface ReplyService {
	
	List<ReplyVO> replySelectList();
	
	ReplyVO replySelect(ReplyVO vo);
	
	int replyInsert(ReplyVO vo);
	
	int replyUpdate(ReplyVO vo);
	
	int replyDelete(ReplyVO vo);

}
