package co.four.study.question.service;

import java.time.LocalDate;

import lombok.Data;

@Data
public class QuestionVO {
	
	// 내부 필드
	private int questionId;
	
	private String memberId;
	
	private Integer courseId;
	
	private String questionTitle;
	
	private String questionContent;
	
	private LocalDate questionEnterDate;
	
	private LocalDate questionUpdateDate;
	
	private String questionImg;
	
	private int questionHit;
	
	private String questionSolve;
	
	// 외부 필드
	private String courseName;
	
	private int answerCount;
	
}
