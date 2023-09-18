package co.four.study.answer.map;

import java.util.List;

import co.four.study.answer.service.AnswerVO;

public interface AnswerMapper {
	List<AnswerVO> answerSelectList();
	AnswerVO answerSelect(AnswerVO vo);
	int answerInsert(AnswerVO vo);
	int answerUpdate(AnswerVO vo);
	int answerDelete(AnswerVO vo);
}
