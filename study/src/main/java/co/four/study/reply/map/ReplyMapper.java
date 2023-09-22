package co.four.study.reply.map;

import java.util.List;

import co.four.study.member.service.MemberVO;
import co.four.study.reply.service.ReplyVO;
import co.four.study.reply.service.etcvo.ReplySortVO;

public interface ReplyMapper {
	
	List<ReplyVO> replySelectList();
	
	ReplyVO replySelect(ReplyVO vo);
	
	int replyInsert(ReplyVO vo);
	
	int replyUpdate(ReplyVO vo);
	
	int replyDelete(ReplyVO vo);
	
	
	// 게시글 페이징 정렬 조회
	List<ReplyVO> sortRepliesWithPaging(ReplySortVO vo);
	
	// 한 게시글의 댓글 수 조회
	int countBoardReply(int id);
	
	// 회원이 쓴 댓글 수 조회
    int countReply(MemberVO vo);
}
