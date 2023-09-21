package co.four.study.recommend.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.four.study.common.DataSource;
import co.four.study.recommend.mapper.RecommendMapper;
import co.four.study.recommend.service.RecommendService;
import co.four.study.recommend.service.RecommendVO;
import co.four.study.recommend.service.etcvo.RecommendCountVO;

public class RecommendServiceImpl implements RecommendService {

	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	
	private RecommendMapper map = sqlSession.getMapper(RecommendMapper.class);
	
	@Override
	public List<RecommendVO> recommendSelectList(RecommendVO vo) {
		return map.recommendSelectList(vo);
	}

	@Override
	public RecommendVO recommendSelect(RecommendVO vo) {
		return map.recommendSelect(vo);
	}

	@Override
	public int recommendInsert(RecommendVO vo) {
		return map.recommendInsert(vo);
	}

	@Override
	public int recommendDelete(RecommendVO vo) {
		return map.recommendDelete(vo);
	}

	@Override
	public RecommendCountVO countRecommend(int id) {
		return map.countRecommend(id);
	}

}
