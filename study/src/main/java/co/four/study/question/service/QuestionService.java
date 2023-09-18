package co.four.study.question.service;

import java.util.List;

public interface QuestionService {
	List<QuestionVO> questionSelectList();
	QuestionVO questionSelect(QuestionVO vo);
	int questionInsert(QuestionVO vo);
	int questionDelete(QuestionVO vo);
	int questionUpdate(QuestionVO vo);
}
