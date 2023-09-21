package co.four.study.reply.service;

import java.time.LocalDate;

import lombok.Data;

@Data
public class ReplyVO {
	
	private int replyId;
	
	private int boardId;
	
	private String memberId;
	
	private String replyContent;
	
	private LocalDate replyEnterDate;
	
	private LocalDate replyUpdateDate;

}
