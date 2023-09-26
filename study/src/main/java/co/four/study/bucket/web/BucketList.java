package co.four.study.bucket.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.four.study.bucket.service.BucketService;
import co.four.study.bucket.service.BucketVO;
import co.four.study.bucket.serviceImpl.BucketServiceImpl;
import co.four.study.common.ViewResolve;
import co.four.study.course.service.CourseVO;
import co.four.study.member.service.MemberService;
import co.four.study.member.service.MemberVO;
import co.four.study.member.serviceImpl.MemberServiceImpl;
import co.four.study.packageBucket.service.PackageBucketService;
import co.four.study.packageBucket.service.PackageBucketVO;
import co.four.study.packageBucket.serviceImpl.PackageBucketServiceImpl;
import co.four.study.packages.service.PackageService;
import co.four.study.packages.service.PackageVO;
import co.four.study.packages.serviceImpl.PackageServiceImpl;

@WebServlet("/bucketlist.do")
public class BucketList extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public BucketList() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService mdao = new MemberServiceImpl();
		BucketService bdao = new BucketServiceImpl();
		PackageService pdao = new PackageServiceImpl();
		PackageBucketService pbdao = new PackageBucketServiceImpl();
		MemberVO mvo = new MemberVO();
		BucketVO bvo = new BucketVO();
		PackageVO pvo = new PackageVO();
		PackageBucketVO pbvo = new PackageBucketVO();
		HttpSession session = request.getSession();
		String memberId = request.getParameter("memberId");
		//마이페이지에서 장바구니 접근시 memberId null값 반환
		
		if (memberId == null) {
			memberId = (String) session.getAttribute("loginId");
		}
		bvo.setMemberId(memberId);
		mvo.setMemberId(memberId);

		// 해당멤버의 장바구니에 있는 강의정보 담기
		List<CourseVO> list = bdao.memberBucketList(bvo);
		request.setAttribute("courses", list);
		if (list.size() == 0) {
			request.setAttribute("message", "empty");
		}
		// 해당멤버의 장바구니에 있는 패키지 정보 담기
		List<PackageBucketVO> plist = pbdao.memberPackBucketList(pbvo);
		request.setAttribute("packages", plist);
		if (plist.size() == 0) {
			request.setAttribute("message", "package_empty");
		}

		// 장바구니 강의금액 합
		try {
			int sum = bdao.sumCoursesPrice(bvo);
			request.setAttribute("sum", sum);
		} catch (NullPointerException e) {
			request.setAttribute("sum", 0);
		}
		// 장바구니 패키지금액 합
		try {
			int sum = 0;
			for(int i=0; i<plist.size(); i++) {
				pvo.setPackageId(plist.get(i).getPackageId());
				System.out.println(i + "번째 패키지 가격:: " + pdao.salePrice(pvo));
				sum += pdao.salePrice(pvo);
				System.out.println(i + "번째 패키지 가격을 더한 결과:: " + sum);
			}
			request.setAttribute("psum", sum);
			System.out.println("패키지 가격 최종 합:: " + sum);
			
		} catch (NullPointerException e) {
			request.setAttribute("sum", 0);
		}

		// 회원정보 가져오기
		mvo = mdao.memberSelect(mvo);
		request.setAttribute("member", mvo);
		System.out.println(mvo);

		// 장바구니 페이지 포워딩
		String page = "bucket/bucketList";
		request.setAttribute("menu", "mypage");
		ViewResolve.foward(request, response, page);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
