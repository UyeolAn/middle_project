package co.four.study.answer.service;

import java.time.LocalDate;

import lombok.Data;

@Data
public class AnswerVO {
	
	// 외부 필드
	private int answerId;
	
	private int questionId;
	
	private String memberId;
	
	private String answerContent;
	
	private LocalDate answerEnterDate;
	
	private LocalDate answerUpdateDate;
	
	private String answerImg;
	
	private String answerSolve;
	
	// 외부 필드
	private String memberAuthor;
}
