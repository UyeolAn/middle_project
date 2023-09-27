package co.four.study.packageBucket.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import co.four.study.common.ViewResolve;
import co.four.study.member.service.MemberService;
import co.four.study.member.service.MemberVO;
import co.four.study.member.serviceImpl.MemberServiceImpl;
import co.four.study.packageBucket.service.PackageBucketService;
import co.four.study.packageBucket.service.PackageBucketVO;
import co.four.study.packageBucket.serviceImpl.PackageBucketServiceImpl;
import co.four.study.packages.service.PackageService;
import co.four.study.packages.service.PackageVO;
import co.four.study.packages.serviceImpl.PackageServiceImpl;

@WebServlet("/packagebucketlist.do")
public class PackageBucketList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PackageBucketList() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberService mdao = new MemberServiceImpl();
		PackageService pdao = new PackageServiceImpl();
		PackageBucketService pbdao = new PackageBucketServiceImpl();
		MemberVO mvo = new MemberVO();
		PackageVO pvo = new PackageVO();
		PackageBucketVO pbvo = new PackageBucketVO();
		HttpSession session = request.getSession();
		String memberId = request.getParameter("memberId");
		
		//마이페이지에서 장바구니 접근시 memberId null값 반환
		if (memberId == null) {
			memberId = (String) session.getAttribute("loginId");
		}
		mvo.setMemberId(memberId);
		
		// 해당멤버의 장바구니에 있는 패키지 정보 담기
		pbvo.setMemberId(memberId);
		List<PackageBucketVO> plist = pbdao.memberPackBucketList(pbvo);
		if (plist.size() == 0) {
			request.setAttribute("pmessage", "package_empty");
		}
		System.out.println(memberId + "의 장바구니에 있는 패키지 번호 :: " + plist);
		
		// 장바구니 패키지금액 합, 패키지 정보
		List<PackageVO> packages = new ArrayList<PackageVO>();
		try {
			int sum = 0;
			for(int i=0; i<plist.size(); i++) {
				pvo.setPackageId(plist.get(i).getPackageId());
				
				int salePrice = pdao.salePrice(pvo);
				sum += salePrice; // 합계
				pvo = pdao.packageSelect(pvo); // 패키지 정보 조회
				pvo.setSalePrice(salePrice); // 패키지 정보에 할인가격 추가
				packages.add(pvo); //패키지 정보 리스트에 add
			}
			request.setAttribute("packages", packages);
			request.setAttribute("psum", sum);
		} catch (NullPointerException e) {
			request.setAttribute("psum", 0);
		}
		
		// 회원정보 가져오기
		mvo = mdao.memberSelect(mvo);
		request.setAttribute("member", mvo);
		System.out.println(mvo);
		
		// 장바구니 페이지 포워딩
		String page = "bucket/packageBucketList";
		request.setAttribute("menu", "mypage");
		ViewResolve.foward(request, response, page);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
