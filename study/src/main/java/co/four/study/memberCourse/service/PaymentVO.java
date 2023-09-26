package co.four.study.memberCourse.service;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class PaymentVO {
	
	private String courseName;
	
	private String coursePrice;
	
	private LocalDateTime enterDate;

}
