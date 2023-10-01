<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="client/css/bucket.css" type="text/css">
</head>
<body>
	<!-- 장바구니 페이지 start -->
	<section class="shopping-cart">
		<div class="col-lg-8">
			<!-- 일반강의 바구니영역 start -->
			<div class="shopping__cart__table">
				<div class="cart_title"><span>&#128216;</span>단과 강의</div>
				<div class="table">
					<div class="thead">
						<div class="tr">
							<div class="td_1">강의명</div>
							<div class="td_2">금액</div>
							<div class="td_3"></div>
						</div>
					</div>
					<div class="tbody">
						<c:forEach items="${courses}" var="c">
							<div class="tr">
								<div class="product__cart__item td_1">
									<div class="product__cart__item__pic" style="background-image: url(client/img/product/${c.courseImg })"></div>
									<div class="product__cart__item__text">
										<h6>${c.courseName }</h6>
									</div>
								</div>
								<div class="cart__price td_2">
									<fmt:formatNumber value="${c.coursePrice }" pattern="#,###" />원
								</div>
								<div class="cart__close td_3" onclick="bucketDelete('${member.memberId}', ${c.courseId }, this)"><i class="fa fa-close" ></i></div>
							</div>
						</c:forEach>
						<!-- 장바구니가 비어있으면 show -->
						<div class="empty_bucket_message tr <c:if test="${message eq 'empty'}">bucket_empty_show</c:if>">
							<div class="td_colspan3">
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#8b9299" class="bi bi-bag-x" viewBox="0 0 16 16">
								  <path fill-rule="evenodd" d="M6.146 8.146a.5.5 0 0 1 .708 0L8 9.293l1.146-1.147a.5.5 0 1 1 .708.708L8.707 10l1.147 1.146a.5.5 0 0 1-.708.708L8 10.707l-1.146 1.147a.5.5 0 0 1-.708-.708L7.293 10 6.146 8.854a.5.5 0 0 1 0-.708z"/>
								  <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z"/>
								</svg>
								<span style="color:#8b9299">담긴 강의가 없습니다</span>
							</div>
						</div>
						<!-- 장바구니가 비어있으면 show -->
					</div>
				</div>
			</div>
			<!-- 일반강의 바구니영역 end -->
			
			<!-- 패키지 바구니영역 start -->
			<div class="shopping__cart__table">
				<div class="cart_title"><span>&#128218;</span>패키지 강의</div>
				<div class="table">
					<div class="thead">
						<div class="tr">
							<div class="td_1">패키지명</div>
							<div class="td_2">금액</div>
							<div class="td_3"></div>
						</div>
					</div>
					<div class="tbody">
						<c:forEach items="${packages}" var="p">
							<div class="tr">
								<div class="product__cart__item td_1">
									<div class="product__cart__item__pic" style="background-image: url(client/img/product/${p.packageThumbnail });">
									</div>
									<div class="product__cart__item__text">
										<h6>${p.packageTitle }</h6>
									</div>
								</div>
								<div class="cart__price td_2">
									<fmt:formatNumber value="${p.salePrice }" pattern="#,###" />원
								</div>
								<div class="cart__close td_3" onclick="packageDelete('${member.memberId}', ${p.packageId }, this)"><i class="fa fa-close" ></i></div>
							</div>
						</c:forEach>
						<!-- 장바구니가 비어있으면 show -->
						<div class="empty_bucket_message tr <c:if test="${pmessage eq 'package_empty'}">bucket_empty_show</c:if>">
							<div class="td_colspan3">
								<svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#8b9299" class="bi bi-bag-x" viewBox="0 0 16 16">
								  <path fill-rule="evenodd" d="M6.146 8.146a.5.5 0 0 1 .708 0L8 9.293l1.146-1.147a.5.5 0 1 1 .708.708L8.707 10l1.147 1.146a.5.5 0 0 1-.708.708L8 10.707l-1.146 1.147a.5.5 0 0 1-.708-.708L7.293 10 6.146 8.854a.5.5 0 0 1 0-.708z"/>
								  <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1zm3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4h-3.5zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1V5z"/>
								</svg>
								<span style="color:#8b9299">담긴 패키지가 없습니다</span>
							</div>						
						</div>
						<!-- 장바구니가 비어있으면 show -->
					</div>
				</div>
			</div>
			<!-- 패키지 바구니영역 start -->
		</div>
		<div class="col-lg-8 cart_info_wrap">
			<div class="cart__total cart_member_info">
				<h6 class="cart_info_title">회원정보</h6>
				<ul>
					<li><span>이름</span> <span>${member.memberName }</span></li>
					<li><span>연락처</span> <span>${member.memberTel }</span></li>
					<li><span>주소</span> <span>${member.memberAddress }</span></li>
					<li><span>이메일</span> <span>${member.memberEmail }</span></li>
				</ul>
			</div>
			<div class="cart__total cart_price_info">
				<h6 class="cart_info_title">결제정보</h6>
				<ul>
					<li>단과 강의 <span class="cart_course_price"><fmt:formatNumber value="${sum }" pattern="#,###" />원</span></li>
					<li>패키지 강의 <span class="cart_package_price"><fmt:formatNumber value="${wonga }" pattern="#,###" />원</span></li>
					<li>패키지 할인액 <span class="cart_package_price"><fmt:formatNumber value="${wonga-psum }" pattern="#,###" />원</span></li>
					<li>총 결제금액 <span class="cart_sum_price"><fmt:formatNumber value="${sum + psum }" pattern="#,###" />원</span></li>
				</ul>
				<a href="#" class="primary-btn" onclick="kakaoapi('${member.memberId}','${bucketCount }')">결제하기</a>
			</div>
		</div>
	</section>
	<!-- 장바구니 페이지 end -->
	
	<!-- 장바구니 자바스크립트 -->
	<script type="text/javascript">
		function bucketDelete(memberId, courseId, target) {
			$.ajax({
				url: 'ajaxbucketdelete.do',
				method: 'post',
				data: {courseId: courseId, memberId: memberId},
				success: function(result) {
					console.log(result);
					if(result.message == 'success'){
						let sum = result.sum;
						sum = sum.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
						$(target).closest('.tr').remove();
						$('.cart_sum_price').text(sum + '원');
						alert('선택하신 상품이 장바구니에서 삭제되었습니다.');
						
						if(result.sum == '0') {
							$('.empty_bucket_message').addClass('bucket_empty_show');
						}
						
					} else {
						alert('죄송합니다, 오류가 발생했습니다. 다시 시도 부탁드립니다.\n오류가 지속적으로 반복된다면 고객센터로 연락바랍니다.');
					}
				}
			})
		}
		
		function packageDelete(memberId, packageId, target){
			$.ajax({
				url: 'ajaxpackagebucketdelete.do',
				method: 'post',
				data: {packageId: packageId, memberId: memberId},
				success: function(result) {
					console.log(result);
					if(result.message == 'success'){
						alert('선택하신 상품이 장바구니에서 삭제되었습니다.');
						location.href = 'bucketlist.do?memberId=' + memberId;
						
					} else {
						alert('죄송합니다, 오류가 발생했습니다. 다시 시도 부탁드립니다.\n오류가 지속적으로 반복된다면 고객센터로 연락바랍니다.');
						location.href = 'bucketlist.do?memberId=' + memberId;
					}
				}
			})
		}
		
		function payment(memberId, status) {
			//ajaxmembercourseinsert.do
			if(status == 'notEmpty' ) {
				$.ajax({
					url: 'ajaxmembercourseinsert.do',
					method: 'post',
					data: {memberId: memberId},
					success: function(result) {
						console.log(result);
						
						if(result.message == 'success' || result.pbmessage == 'success'){
							alert('정상적으로 결제되었습니다!');
							location.href = 'bucketlist.do?memberId=' + memberId;
						} else {
							console.log(result);
							alert('죄송합니다, 오류가 발생했습니다. 다시 시도 부탁드립니다.\n오류가 지속적으로 반복된다면 고객센터로 연락바랍니다.');
						}
					}
				})
			} else if(status == 'empty') {
				alert('장바구니에 담긴 상품이 없습니다!');
			}
		}
		
		function kakaoapi(memberId, status) {
			if(status == 'notEmpty' ) {
				$.ajax({
					url: 'ajaxkakaoapi.do',
					method: 'post',
					data: {memberId: memberId},
					dataType: 'json',
					success: function(result){
						let data = eval("("+ result +")");
						console.log(data);
						console.log(data.tid);
						let qrcode = data.next_redirect_pc_url;
						window.open(qrcode);
					},
					error: function(error) {
						alert("error");
						console.log(error);
					}
				})
			} else if(status == 'empty') {
				alert('장바구니에 담긴 상품이 없습니다!');
			}
		}
	</script>
</body>
</html>