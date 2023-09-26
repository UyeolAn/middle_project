package co.four.study.packages.service;

import java.util.List;

public interface PackageService {

	List<PackageVO> packageSelectList(); //패키지 전체조회
	PackageVO packageSelect(PackageVO vo); //패키지아이디별 조회
	int packageInsert(PackageVO vo); //패키지 등록
	int packageUpdate(PackageVO vo); //패키지 업데이트
	int packageDelete(PackageVO vo); //패키지 삭제
	
}
