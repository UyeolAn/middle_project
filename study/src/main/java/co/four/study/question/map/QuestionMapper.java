package co.four.study.question.map;

import java.util.List;

import co.four.study.question.service.QuestionVO;

public interface QuestionMapper {
	List<QuestionVO> questionSelectList();
	QuestionVO questionSelect(QuestionVO vo);
	int questionInsert(QuestionVO vo);
	int questionDelete(QuestionVO vo);
	int questionUpdate(QuestionVO vo);
}
