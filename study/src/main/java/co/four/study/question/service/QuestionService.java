package co.four.study.question.service;

import java.util.List;

import co.four.study.member.service.MemberVO;

public interface QuestionService {
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
