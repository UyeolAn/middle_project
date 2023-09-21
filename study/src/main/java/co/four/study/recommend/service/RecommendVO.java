package co.four.study.recommend.service;

import lombok.Data;

@Data
public class RecommendVO {
	
	private int recommendId;
	
	private String memberId;
	
	private int boardId;
	
	private String recommendValue;
	
}
