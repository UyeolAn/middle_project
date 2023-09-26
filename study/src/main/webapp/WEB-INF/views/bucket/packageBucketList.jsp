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
			<!-- 패키지 바구니영역 start -->
			<div class="shopping__cart__table">
				<table>
					<thead>
						<tr>
							<th>패키지명</th>
							<th style="width: 140px;">금액</th>
							<th style="width: 50px;"></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${packages}" var="p">
							<tr>
								<td class="product__cart__item">
									<div class="product__cart__item__pic" style="background-image: url(client/img/product/${p.packageThumbnail });">
									</div>
									<div class="product__cart__item__text">
										<h6>${p.packageTitle }</h6>
									</div>
								</td>
								<td class="cart__price" style="width: 140px;">
									<fmt:formatNumber value="${p.salePrice }" pattern="#,###" />원
								</td>
								<td class="cart__close" style="width: 50px;"><i class="fa fa-close" onclick="bucketDelete('${member.memberId}', ${p.packageId }, this)"></i></td>
							</tr>
						</c:forEach>
						<!-- 장바구니가 비어있으면 show -->
						<tr class="empty_bucket_message <c:if test="${pmessage eq 'package_empty'}">bucket_empty_show</c:if>">
							<td colspan="3">
								<svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="#6c757d" class="bi bi-cart-x" viewBox="0 0 16 16">
								  <path d="M7.354 5.646a.5.5 0 1 0-.708.708L7.793 7.5 6.646 8.646a.5.5 0 1 0 .708.708L8.5 8.207l1.146 1.147a.5.5 0 0 0 .708-.708L9.207 7.5l1.147-1.146a.5.5 0 0 0-.708-.708L8.5 6.793 7.354 5.646z"/>
								  <path d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z"/>
								</svg>
								<span>담긴 패키지가 없습니다</span>
							</td>						
						</tr>
						<!-- 장바구니가 비어있으면 show -->
					</tbody>
				</table>
			</div>
			<!-- 패키지 바구니영역 start -->
		</div>
		<div class="col-lg-8">
			<div class="cart__total cart_member_info">
				<h6 class="cart_title">회원정보</h6>
				<ul>
					<li>이름 <span>${member.memberName }</span></li>
					<li>연락처 <span>${member.memberTel }</span></li>
					<li>주소 <span>${member.memberAddress }</span></li>
					<li>이메일 <span>${member.memberEmail }</span></li>
				</ul>
			</div>
			<div class="cart__total">
				<h6 class="cart_title">결제정보</h6>
				<ul>
					<li>총 결제금액 <span class="cart_sum_price"><fmt:formatNumber value="${sum + psum }" pattern="#,###" />원</span></li>
				</ul>
				<a href="#" class="primary-btn" onclick="payment('${member.memberId}')">결제하기</a>
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
						$(target).closest('tr').remove();
						$('.cart_sum_price').text(sum + '원');
						alert('선택하신 상품이 장바구니에서 삭제되었습니다.');
					} else {
						alert('죄송합니다, 오류가 발생했습니다. 다시 시도 부탁드립니다.\n오류가 지속적으로 반복된다면 고객센터로 연락바랍니다.');
					}
				}
			})
		}
		
		function payment(memberId) {
			//ajaxmembercourseinsert.do
			$.ajax({
				url: 'ajaxmembercourseinsert.do',
				method: 'post',
				data: {memberId: memberId},
				success: function(result) {
					console.log(result);
					
					if(result.message == 'success'){
						alert('정상적으로 결제되었습니다!');
					} else {
						alert('죄송합니다, 오류가 발생했습니다. 다시 시도 부탁드립니다.\n오류가 지속적으로 반복된다면 고객센터로 연락바랍니다.');
					}
					location.href = 'bucketlist.do?memberId=' + memberId;
				}
			})
		}
	</script>
</body>
</html>