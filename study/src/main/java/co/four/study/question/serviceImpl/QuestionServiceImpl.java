package co.four.study.question.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.four.study.common.DataSource;
import co.four.study.member.service.MemberVO;
import co.four.study.question.map.QuestionMapper;
import co.four.study.question.service.QuestionService;
import co.four.study.question.service.QuestionVO;
import co.four.study.question.service.etcvo.QuestionSearchVO;
import co.four.study.question.service.etcvo.QuestionSolveVO;

public class QuestionServiceImpl implements QuestionService{
	
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	
	private QuestionMapper map = sqlSession.getMapper(QuestionMapper.class);
	
	@Override
	public List<QuestionVO> questionSelectList(QuestionVO vo) {
		return map.questionSelectList(vo);
	}

	@Override
	public QuestionVO questionSelect(QuestionVO vo) {
		map.updateQuestionHit(vo.getQuestionId());
		return map.questionSelect(vo);
	}

	@Override
	public int questionInsert(QuestionVO vo) {
		return map.questionInsert(vo);
	}

	@Override
	public int questionDelete(QuestionVO vo) {
		return map.questionDelete(vo);
	}

	@Override
	public int questionUpdate(QuestionVO vo) {
		return map.questionUpdate(vo);
	}
	
	@Override
	public List<QuestionVO> searchQuestionsWithPaging(QuestionSearchVO vo) {
		return map.searchQuestionsWithPaging(vo);
	}
	
	@Override
	public int countQuestions(QuestionSearchVO vo) {
		return map.countQuestions(vo);
	}

	@Override
	public int countQuestion(MemberVO vo) {
		return map.countQuestion(vo);
	}

	@Override
	public int unanswerQuestion() {
		return map.unanswerQuestion();
	}

	@Override
	public String getQuestionCourseName(int id) {
		return map.getQuestionCourseName(id);
	}

	@Override
	public int updateQuestionSolve(QuestionSolveVO vo) {
		return map.updateQuestionSolve(vo);
	}

	@Override
	public List<QuestionVO> unanswerQuestionList() {
		return map.unanswerQuestionList();
	}

	@Override
	public List<QuestionVO> questionListBynotsolved() {
		return map.questionListBynotsolved();
	}

	@Override
	public List<QuestionVO> homeRecentQuestion() {
		return map.homeRecentQuestion();
	}

}
