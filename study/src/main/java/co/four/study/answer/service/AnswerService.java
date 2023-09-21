package co.four.study.answer.service;

import java.util.List;

public interface AnswerService {
	
	List<AnswerVO> answerSelectList();
	
	AnswerVO answerSelect(AnswerVO vo);
	
	int answerInsert(AnswerVO vo);
	
	int answerUpdate(AnswerVO vo);
	
	int answerDelete(AnswerVO vo);
	
}
