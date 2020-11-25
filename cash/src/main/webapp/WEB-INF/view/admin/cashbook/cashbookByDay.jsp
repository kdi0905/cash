<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>cashbookByDay</title>
<!-- JS -->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery-1.11.2.min.js"></script>
<!-- jQuery -->
<script type="text/javascript" src="${pageContext.request.contextPath }/js/templatemo-script.js"></script>
<!-- Templatemo Script -->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,700'	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Damion' rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/font-awesome.min.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/templatemo-style.css" rel="stylesheet">
<link rel="shortcut icon" href="${pageContext.request.contextPath }/img/favicon.ico" type="image/x-icon" />
<style>
thead {
	background-color: #c79c60;
}

tbody {
	background-color: white;
}
</style>
</head>
<body id="landing">

	<jsp:include page="/WEB-INF/view/inc/menu.jsp"></jsp:include>
	<!-- Preloader -->
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>
	</div>
	<!-- End Preloader -->
	<section class="tm-welcome-section">
		<div class="container tm-position-relative">
			<div class="tm-lights-container">
				<img src="${pageContext.request.contextPath }/img/light.png" alt="Light" class="light light-1">
				<img src="${pageContext.request.contextPath }/img/light.png" alt="Light" class="light light-2">
				<img src="${pageContext.request.contextPath }/img/light.png" alt="Light" class="light light-3">
			</div>
			<div class=" tm-welcome-content">
				<h2 class="white-text tm-handwriting-font tm-welcome-header">
					<img src="${pageContext.request.contextPath }/img/header-line.png"
						alt="Line" class="tm-header-line">&nbsp;cashbook&nbsp;&nbsp;
					<img src="${pageContext.request.contextPath }/img/header-line.png"
						alt="Line" class="tm-header-line">
				</h2>
				<h2 class="gold-text tm-welcome-header-2">가 계 부</h2>
				<a href="#cashbookList" class="tm-more-button tm-more-button-welcome">cashbook</a>
				<p class="gray-text tm-welcome-description text-center">
					어서오세요. <br> <br> 일 별 가계부 게시판입니다.
				</p>
			</div>
			<img src="${pageContext.request.contextPath }/img/table-set.png" alt="Table Set" class="tm-table-set img-responsive">
		</div>
	</section>
	<div class="tm-main-section light-gray-bg">
		<div class="container" id="#cashbookList">
			<section class="tm-section">
				<div class="row">
					<div class="col-lg-12 tm-section-header-container">
						<h2 class="tm-section-header gold-text tm-handwriting-font">
							일 별 가계부</h2>

						<div class="tm-hr-container">
							<hr class="tm-hr">
						</div>
					</div>
				</div>
				<div class="tm-daily-menu-container ">
					<h2 style="margin-top: 30px;">
						<div style="text-align: center;">${currentYear}년 ${currentMonth}월</div>
						<div style="text-align: center;">
							<a class="text-dark"href="${pageContext.request.contextPath }/admin/cashbookByDay/pre/${currentYear}/${currentMonth}/${currentDay}">&nbsp;&nbsp; < &nbsp;&nbsp;</a> ${currentDay}일 
							<a class="text-dark"href="${pageContext.request.contextPath }/admin/cashbookByDay/next/${currentYear}/${currentMonth}/${currentDay}">&nbsp;&nbsp; > &nbsp;&nbsp;</a>
						</div>
					</h2>
					<a class="tm-more-button" href="${pageContext.request.contextPath }/admin/addCashbook/${currentYear}/${currentMonth}/${currentDay}">추가</a>
					<table class="table " style="margin-top: 30px; text-align: center;">
						<thead>
							<tr>
								<th>cashbookId</th>
								<th>cashbookKind</th>
								<th>categoryName</th>
								<th>cashbookPrice</th>
								<th>cashbookContent</th>
								<th>수정</th>
								<th>삭제</th>
							</tr>

						</thead>
						<tbody>
							<c:forEach var="c" items="${cashbookList}">
								<tr>

									<td>${c.cashbookId }</td>
									<td>${c.cashbookKind }</td>
									<td>${c.categoryName }</td>
									<c:if test="${c.cashbookKind=='지출' }">
										<td class="text-danger">- ${c.cashbookPrice }</td>
									</c:if>
									<c:if test="${c.cashbookKind=='수입' }">
										<td class=" text-success">${c.cashbookPrice }</td>
									</c:if>
									<td>${c.cashbookContent }</td>

									<td><a class="text-secondary"
										href="${pageContext.request.contextPath }/admin/updateCashbook/${c.cashbookId}/${currentYear}/${currentMonth}/${currentDay}">수정</a></td>
									<td><a class="text-danger"
										href="${pageContext.request.contextPath }/admin/deleteCashbook/${c.cashbookId}/${currentYear}/${currentMonth}/${currentDay}">삭제</a></td>
								</tr>
							</c:forEach>
						</tbody>

					</table>
					<a href="#" class="tm-more-button margin-top-30">Read More</a>
				</div>
			</section>
		</div>
	</div>
<jsp:include page="/WEB-INF/view/inc/lastMenu.jsp"></jsp:include>
</body>
</html>