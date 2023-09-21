package co.four.study.question.map;

import java.util.List;

import co.four.study.member.service.MemberVO;
import co.four.study.question.service.QuestionVO;

public interface QuestionMapper {
	List<QuestionVO> questionSelectList(QuestionVO vo);
	QuestionVO questionSelect(QuestionVO vo);
	int questionInsert(QuestionVO vo);
	int questionDelete(QuestionVO vo);
	int questionUpdate(QuestionVO vo);
	
	//회원이 쓴 질문수 조회
	int countQuestion(MemberVO vo);
	
	//답변안달린 질문수 조회
	int unanswerQuestion();
}
