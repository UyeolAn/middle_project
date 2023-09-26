package co.four.study.packages.serviceImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import co.four.study.common.DataSource;
import co.four.study.packages.map.PackageMapper;
import co.four.study.packages.service.PackageService;
import co.four.study.packages.service.PackageVO;

public class PackageServiceImpl implements PackageService {
	
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private PackageMapper map = sqlSession.getMapper(PackageMapper.class);

	@Override
	public List<PackageVO> packageSelectList() {
		return map.packageSelectList();
	}

	@Override
	public PackageVO packageSelect(PackageVO vo) {
		return map.packageSelect(vo);
	}

	@Override
	public int packageInsert(PackageVO vo) {
		return map.packageInsert(vo);
	}

	@Override
	public int packageUpdate(PackageVO vo) {
		return map.packageUpdate(vo);
	}

	@Override
	public int packageDelete(PackageVO vo) {
		return map.packageDelete(vo);
	}

}
