package co.four.study.answer.service;

import java.util.List;

public interface AnswerService {
	
	List<AnswerVO> answerSelectList();
	
	AnswerVO answerSelect(AnswerVO vo);
	
	int answerInsert(AnswerVO vo);
	
	int answerUpdate(AnswerVO vo);
	
	int answerDelete(AnswerVO vo);
	
	
	// 질문에 달린 답변 카운트
	int countQuestionAnswer(int id);
	
}
