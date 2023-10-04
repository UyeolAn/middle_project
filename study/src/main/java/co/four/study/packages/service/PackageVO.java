package co.four.study.packages.service;

import lombok.Data;

@Data
public class PackageVO {
	private int packageId;
	private String packageTitle;
	private String packageScript;
	private int packageDiscount = -1;
	private String packageThumbnail;
	private String packageImg;
	private String packageCategory;
	private String packageGrade;
	private int salePrice;
	private int coursesPrice;
}
