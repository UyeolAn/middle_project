package co.four.study.question.service;

import java.util.List;

import co.four.study.member.service.MemberVO;
import co.four.study.question.service.etcvo.QuestionSearchVO;

public interface QuestionService {
	
	List<QuestionVO> questionSelectList(QuestionVO vo);
	
	QuestionVO questionSelect(QuestionVO vo);
	
	int questionInsert(QuestionVO vo);
	
	int questionDelete(QuestionVO vo);
	
	int questionUpdate(QuestionVO vo);
	
	
	// 질문 페이징 검색
	List<QuestionVO> searchQuestionsWithPaging(QuestionSearchVO vo);
	
	//질문 카운트
	int countQuestions(QuestionSearchVO vo);
	
	//회원이 쓴 질문수 조회
	int countQuestion(MemberVO vo);
	
	//답변안달린 질문수 조회
	int unanswerQuestion();
	
	// 질문의 강의 이름 가져오기
	String getQuestionCourseName(int id);
	
}
