package co.four.study.packages.service;

import java.util.List;

public interface PackageService {

	List<PackageVO> packageSelectList(PackageVO vo); //패키지 전체조회
	PackageVO packageSelect(PackageVO vo); //패키지아이디별 조회
	int packageInsert(PackageVO vo); //패키지 등록
	int packageUpdate(PackageVO vo); //패키지 업데이트
	int packageDelete(PackageVO vo); //패키지 삭제
	
	/**
	 * packages_courses의 package_id를 받아서 할인율 반영한 금액 조회
	 * @param PackageCourseVO (packageId)
	 * @return 할인금액
	 */
	int salePrice(PackageVO vo);
	
}
