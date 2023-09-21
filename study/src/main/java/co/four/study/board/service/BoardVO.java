package co.four.study.board.service;

import java.time.LocalDate;

import lombok.Data;

@Data
public class BoardVO {
	
	// 내부 필드
	private int boardId;
	
	private String memberId;
	
	private String boardTitle;
	
	private String boardContent;
	
	private LocalDate boardEnterDate;
	
	private LocalDate boardUpdateDate;
	
	private String boardImg;
	
	private int boardHit;
	
	private int boardLike;
	
	private int boardDislike;
	
	// 외부 필드
	private int replyCount;
	
}
