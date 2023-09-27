package co.four.study.course.serviceImpl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;

import co.four.study.common.DataSource;
import co.four.study.course.map.CourseMapper;
import co.four.study.course.service.CourseService;
import co.four.study.course.service.CourseVO;
import co.four.study.packageCourse.service.PackageCourseVO;
import co.four.study.packages.service.PackageVO;

public class CourseServiceImpl implements CourseService {
	
	private SqlSession sqlSession = DataSource.getInstance().openSession(true);
	private CourseMapper map = sqlSession.getMapper(CourseMapper.class);

	@Override
	public List<CourseVO> courseSelectList(CourseVO vo) {
		return map.courseSelectList(vo);
	}

	@Override
	public CourseVO courseSelect(CourseVO vo) {
		return map.courseSelect(vo);
	}
	
	@Override
	public CourseVO courseReviewSelect(CourseVO vo) {
		return map.courseReviewSelect(vo);
	}

	@Override
	public int courseInsert(CourseVO vo) {
		return map.courseInsert(vo);
	}

	@Override
	public int courseUpdate(CourseVO vo) {
		return map.courseUpdate(vo);
	}

	@Override
	public int courseDelete(CourseVO vo) {
		return map.courseDelete(vo);
	}

	@Override
	public List<CourseVO> courseSubCategory(CourseVO vo) {
		return map.courseSubCategory(vo);
	}

	@Override
	public List<Map<String, Object>> courseMainCategory() {
		return map.courseMainCategory();
	}

	@Override
	public int courseTotalCount(CourseVO vo) {
		return map.courseTotalCount(vo);
	}

	@Override
	public List<CourseVO> coursePagingList(CourseVO vo) {
		return map.coursePagingList(vo);
	}

	@Override
	public String subcateCoursePagingTag(int startPage, int nowPage, int cntPerPage, int endPage, int lastPage, String subCate) {
		String tags = "";
		tags += "<div class='col-lg-12 col-paging'>";
		tags += "<div class='product__pagination p-result'>";
		if(startPage != 1) {
			tags += "<button class='active beforeBtn' onclick=\"courseList('subCate', '" + subCate + "'," + (startPage-1) + ", this)\">&lt;</button>";
		}
		for(int i=startPage; i<=endPage; i++) {
			if(nowPage == i) {
				tags += "<button class='active'>" + i + "</button>";    
			}
			if(nowPage != i) {
				tags += "<button onclick=\"courseList('subCate', '" + subCate + "'," + i + ", this)\">" + i + "</button>";
			}
		}
		if(endPage != lastPage) {
			tags += "<button class='active afterBtn' onclick=\"courseList('subCate', '" + subCate + "'," + (endPage + 1) + ", this)\">&gt;</button>";
		}
		tags += "</div>";    
		tags += "</div>";    

		return tags;
	}

	
	@Override
	public String gradeCoursePagingTag(int startPage, int nowPage, int cntPerPage, int endPage, int lastPage, String grade) {
		String tags = "";
		tags += "<div class='col-lg-12 col-paging'>";
		tags += "<div class='product__pagination p-result'>";
		if(startPage != 1) {
			tags += "<button class='active beforeBtn' onclick=\"courseList('grade', '" + grade + "'," + (startPage-1) + ", this)\">&lt;</button>";
		}
		for(int i=startPage; i<=endPage; i++) {
			if(nowPage == i) {
				tags += "<button class='active'>" + i + "</button>";    
			}
			if(nowPage != i) {
				tags += "<button onclick=\"courseList('grade', '" + grade + "'," + i + ", this)\">" + i + "</button>";
			}
		}
		if(endPage != lastPage) {
			tags += "<button class='active afterBtn' onclick=\"courseList('grade', '" + grade + "'," + (endPage + 1) + ", this)\">&gt;</button>";
		}
		tags += "</div>";    
		tags += "</div>";    

		return tags;
	}

	@Override
	public void makeSideMenu(HttpServletRequest request) {
		CourseService dao = new CourseServiceImpl();
		CourseVO vo = new CourseVO();
		List<CourseVO> subCategory;
		
		// it 관련
		vo.setCourseMainCategory("it"); 
		subCategory = dao.courseSubCategory(vo);
		request.setAttribute("it", subCategory);
		// english 관련
		vo.setCourseMainCategory("english"); 
		subCategory = dao.courseSubCategory(vo);
		request.setAttribute("english", subCategory);
	}

	@Override
	public List<CourseVO> itcourselist() {
		return map.itcourselist();
	}

	@Override
	public List<CourseVO> itcourseSub(CourseVO vo) {
		return map.itcourseSub(vo);
	}

	@Override
	public List<CourseVO> packageCourseList(PackageCourseVO vo) {
		return map.packageCourseList(vo);
	}

	@Override
	public List<CourseVO> ListNotInPackage(PackageVO vo) {
		return map.ListNotInPackage(vo);
	}

	@Override
	public List<Map<String, Object>> itCourse() {
		return map.itCourse();
	}


}
