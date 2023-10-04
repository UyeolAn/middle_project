package co.four.study.question.service;

import java.util.List;

import co.four.study.member.service.MemberVO;
import co.four.study.question.service.etcvo.QuestionSearchVO;
import co.four.study.question.service.etcvo.QuestionSolveVO;

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
	
	// 질문 해결여부 업데이트
	int updateQuestionSolve(QuestionSolveVO vo);
	
	//답변안한 질문 리스트
	List<QuestionVO> unanswerQuestionList();
	
	//답변안한 질문 먼저 출력되는 리스트
	List<QuestionVO> questionListBynotsolved();
	
	//최신 질문 5개
	List<QuestionVO> homeRecentQuestion();
}
