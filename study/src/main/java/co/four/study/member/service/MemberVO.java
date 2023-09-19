package co.four.study.member.service;

import java.time.LocalDate;
import java.util.Date;

import lombok.Data;


@Data
public class MemberVO {
	
	private String memberId;

	private String memberPassword;
	
	private String memberName;
	
	private String memberTel;
	
	private String memberAddress;
	
	private String memberEmail;
	
	private LocalDate memberEnterDate;
	
	private Date memberStopDate;
	
	private String Author;

}
