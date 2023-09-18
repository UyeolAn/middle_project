package co.four.study.review.service;

import java.util.Date;

import lombok.Data;

@Data
public class ReviewVO {
	private int reviewId;
	private String memberId;
	private int courseId;
	private String reviewContent;
	private int reviewStars = -1;
	private Date reviewEnterDate;
	private Date reviewUpdateDate;
}
