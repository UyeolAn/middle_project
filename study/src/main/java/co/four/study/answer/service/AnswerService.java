package co.four.study.answer.service;

import java.util.List;

import co.four.study.answer.service.etcvo.AnswerSortVO;

public interface AnswerService {
	
	List<AnswerVO> answerSelectList();
	
	AnswerVO answerSelect(AnswerVO vo);
	
	int answerInsert(AnswerVO vo);
	
	int answerUpdate(AnswerVO vo);
	
	int answerDelete(AnswerVO vo);
	
	
	// 게시글 페이징 정렬 조회
	List<AnswerVO> sortAnswersWithPaging(AnswerSortVO vo);
	
	// 질문에 달린 답변 카운트
	int countQuestionAnswer(int id);
	
	// 특정 질문의 해결된 답변수 카운트
	int countQuestionSolvedAnswer(int id);
	
	// 회원이 단 답변수 카운트
	int countMemberAnswer(String id);
	
	// 답변 해결여부 '해결'로 세팅
	int setAnswerSolved(AnswerVO vo);
	
	// 답변 해결여부 '미해결'로 세팅
	int setAnswerNotSolved(AnswerVO vo);
	
	//질문별 답변
	List<AnswerVO> answerSelectListbyQ(AnswerVO vo);
}
