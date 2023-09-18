package co.four.study.question.service;

import java.util.Date;

import lombok.Data;

@Data
public class QuestionVO {
	private int questionId;
	private String memberId;
	private int courseId;
	private String questionTitle;
	private String questionContent;
	private Date questionEnterDate;
	private Date questionUpdateDate;
	private String questionImg;
	private int questionHit;
}
