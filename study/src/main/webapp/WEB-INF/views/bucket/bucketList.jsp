<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
		<div class="container">
			<div class="row">
				<div class="col-lg-8">
					<div class="shopping__cart__table">
						<table>
							<thead>
								<tr>
									<th>강의명</th>
									<th>금액</th>
									<th></th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${courses}" var="c">
									<tr>
										<td class="product__cart__item">
											<div class="product__cart__item__pic" style="background-image: url(client/img/product/${c.courseImg });">
											</div>
											<div class="product__cart__item__text">
												<h6>${c.courseName }</h6>
											</div>
										</td>
										<td class="cart__price">${c.coursePrice }</td>
										<td class="cart__close"><i class="fa fa-close"></i></td>
									</tr>
								</c:forEach>
								
							</tbody>
						</table>
					</div>
				</div>
				<div class="col-lg-4">
					<div class="cart__total">
						<h6>결제정보</h6>
						<ul>
							<li>선택상품 금액 <span>${sum }원</span></li>
							<li>총 결제금액 <span>${sum }원</span></li>
						</ul>
						<a href="#" class="primary-btn">결제하기</a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- 장바구니 페이지 end -->
</body>
</html>