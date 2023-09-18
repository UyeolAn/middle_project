package co.four.study.board.service;

import java.time.LocalDate;

import lombok.Data;

@Data
public class BoardVO {
	
	private int boardId;
	
	private String memberId;
	
	private String boardTitle;
	
	private String boardContent;
	
	private LocalDate boardEnterDate;
	
	private LocalDate boardUpdateDate;
	
	private String boardImg;
	
	private String boardHit;
	
	private int boardLike;
	
	private int boardDislike;
	
}
