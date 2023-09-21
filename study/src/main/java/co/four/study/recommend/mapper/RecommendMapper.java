package co.four.study.recommend.mapper;

import java.util.List;

import co.four.study.recommend.service.RecommendVO;
import co.four.study.recommend.service.etcvo.RecommendCountVO;

public interface RecommendMapper {
	
	List<RecommendVO> recommendSelectList(RecommendVO vo);
	
	RecommendVO recommendSelect(RecommendVO vo);
	
	int recommendInsert(RecommendVO vo);
	
//	int recommendUpdate(RecommendVO vo);
	
	int recommendDelete(RecommendVO vo);
	
	
	// 좋아요, 싫어요 개수를 반환함
	RecommendCountVO countRecommend(int id);

}
