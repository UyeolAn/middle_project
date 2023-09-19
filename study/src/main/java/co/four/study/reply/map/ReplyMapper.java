package co.four.study.reply.map;

import java.util.List;

import co.four.study.member.service.MemberVO;
import co.four.study.reply.service.ReplyVO;

public interface ReplyMapper {
	
	List<ReplyVO> replySelectList();
	
	ReplyVO replySelect(ReplyVO vo);
	
	int replyInsert(ReplyVO vo);
	
	int replyUpdate(ReplyVO vo);
	
	int replyDelete(ReplyVO vo);
	
	
	int replyCnt(int id);
	
	//회원이 쓴 댓글 수 조회
    int countReply(MemberVO vo);
}
