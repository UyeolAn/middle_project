package co.four.study.answer.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.four.study.answer.map.AnswerMapper;
import co.four.study.answer.service.AnswerService;
import co.four.study.answer.service.AnswerVO;
import co.four.study.answer.service.etcvo.AnswerSortVO;
import co.four.study.common.DataSource;

public class AnswerServiceImpl implements AnswerService{

	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private AnswerMapper map = sqlSession.getMapper(AnswerMapper.class);
	
	@Override
	public List<AnswerVO> answerSelectList() {
		return map.answerSelectList();
	}

	@Override
	public AnswerVO answerSelect(AnswerVO vo) {
		return map.answerSelect(vo);
	}

	@Override
	public int answerInsert(AnswerVO vo) {
		return map.answerInsert(vo);
	}

	@Override
	public int answerUpdate(AnswerVO vo) {
		return map.answerUpdate(vo);
	}

	@Override
	public int answerDelete(AnswerVO vo) {
		return map.answerDelete(vo);
	}
	
	@Override
	public List<AnswerVO> sortAnswersWithPaging(AnswerSortVO vo) {
		return map.sortAnswersWithPaging(vo);
	}

	@Override
	public int countQuestionAnswer(int id) {
		return map.countQuestionAnswer(id);
	}
	
	@Override
	public int countQuestionSolvedAnswer(int id) {
		return map.countQuestionSolvedAnswer(id);
	}
	
	@Override
	public int countMemberAnswer(String id) {
		return map.countMemberAnswer(id);
	}

	@Override
	public int setAnswerSolved(AnswerVO vo) {
		return map.setAnswerSolved(vo);
	}

	@Override
	public int setAnswerNotSolved(AnswerVO vo) {
		return map.setAnswerNotSolved(vo);
	}

	@Override
	public List<AnswerVO> answerSelectListbyQ(AnswerVO vo) {
		return map.answerSelectListbyQ(vo);
	}

}
