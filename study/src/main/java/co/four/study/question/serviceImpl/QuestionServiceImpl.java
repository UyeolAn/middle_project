package co.four.study.question.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.four.study.common.DataSource;
import co.four.study.member.service.MemberVO;
import co.four.study.question.map.QuestionMapper;
import co.four.study.question.service.QuestionService;
import co.four.study.question.service.QuestionVO;

public class QuestionServiceImpl implements QuestionService{
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	
	private QuestionMapper map = sqlSession.getMapper(QuestionMapper.class);
	@Override
	public List<QuestionVO> questionSelectList(QuestionVO vo) {
		return map.questionSelectList(vo);
	}

	@Override
	public QuestionVO questionSelect(QuestionVO vo) {
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
	public int countQuestion(MemberVO vo) {
		return map.countQuestion(vo);
	}

	@Override
	public int unanswerQuestion() {
		return map.unanswerQuestion();
	}

}
