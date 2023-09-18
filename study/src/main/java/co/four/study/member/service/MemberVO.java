package co.four.study.member.service;

import java.time.LocalDate;

import lombok.Data;

@Data
public class MemberVO {
	
	private String memberId;
	
	private String memberPassword;
	
	private String memberName;
	
	private String memberTel;
	
	private String memberAddress;
	
	private String memberEamil;
	
	private LocalDate memberEnterDate;
	
	private LocalDate memberStopDate;
	
	private String memberAuthor;
	
}
