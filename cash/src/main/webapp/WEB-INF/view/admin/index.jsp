<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>index</title>
<!-- JS -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/jquery-1.11.2.min.js"></script>
<!-- jQuery -->
<script type="text/javascript"
	src="${pageContext.request.contextPath }/js/templatemo-script.js"></script>
<!-- Templatemo Script -->

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link
	href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,400italic,600,700'
	rel='stylesheet' type='text/css'>
<link href='http://fonts.googleapis.com/css?family=Damion'
	rel='stylesheet' type='text/css'>
<link href="${pageContext.request.contextPath }/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath }/css/templatemo-style.css"
	rel="stylesheet">
<link rel="shortcut icon"
	href="${pageContext.request.contextPath }/img/favicon.ico"
	type="image/x-icon" />
<style>
thead {
	background-color: #E8E2AE;
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
				<img src="${pageContext.request.contextPath }/img/light.png"
					alt="Light" class="light light-1"> <img
					src="${pageContext.request.contextPath }/img/light.png" alt="Light"
					class="light light-2"> <img
					src="${pageContext.request.contextPath }/img/light.png" alt="Light"
					class="light light-3">
			</div>
			<div class=" tm-welcome-content">
				<h2 class="white-text tm-handwriting-font tm-welcome-header">
					<img src="${pageContext.request.contextPath }/img/header-line.png"
						alt="Line" class="tm-header-line">&nbsp;Welcome
					To&nbsp;&nbsp;<img
						src="${pageContext.request.contextPath }/img/header-line.png"
						alt="Line" class="tm-header-line">
				</h2>
				<h2 class="gold-text tm-welcome-header-2">가 계 부</h2>
				<a href="#index" class="tm-more-button tm-more-button-welcome">index</a>
				<p class="gray-text tm-welcome-description text-center">
					어서오세요. <br> <br> 가계부 게시판입니다.
				</p>
			</div>

			<img src="${pageContext.request.contextPath }/img/table-set.png"
				alt="Table Set" class="tm-table-set img-responsive">

		</div>

	</section>
	<div class="tm-main-section light-gray-bg">
		<div class="container" id="index">
			<section id="index" class="tm-section tm-section-margin-bottom-0 row">
				<div class="col-lg-12 tm-section-header-container">
					<h2 class="tm-section-header gold-text tm-handwriting-font">
						수입/지출</h2>
					<div class="tm-hr-container">
						<hr class="tm-hr">
					</div>
				</div>

				<div class="col-lg-12 tm-popular-items-container">

					<c:forEach var="io" items="${inOutList}">
						<div class="tm-popular-item ">

							<div class="tm-popular-item-description">
								<h3 class="tm-handwriting-font tm-popular-item-title">
									<span class="tm-handwriting-font bigger-first-letter"></span>${io["날짜"]}</h3>
								<hr class="tm-popular-item-hr">
								<p>
								<div class="text-success">수입 : ${io["수입"]}</div>
								<div class="text-danger">지출 : - ${io["지출"]}</div>
								<div>합계 : ${io["합계"]}</div>

							</div>
						</div>
					</c:forEach>
				</div>
			</section>
			<!-- 공지 -->
			<section class="tm-section">
				<div class="row">
					<div class="col-lg-12 tm-section-header-container">
						<h2 class="tm-section-header gold-text tm-handwriting-font">
							공지사항</h2>
						<div class="tm-hr-container">
							<hr class="tm-hr">
						</div>
					</div>
				</div>
				<div class="tm-daily-menu-container margin-top-60">
					<div class="col-lg-4 col-md-4">
						<div class="container">
							<table class="table table-bordered "
								style="margin-top: 20px; text-align: center;">
								<thead>
									<tr>
										<th class="text-center ">notice_id</th>
										<th class="text-center">notice_title</th>
										<th class="text-center">notice_date</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="n" items="${noticeList}">
										<tr>
											<td>${n.noticeId }</td>
											<td>${n.noticeTitle }</td>
											<td>${n.noticeDate }</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<a href="#" class="tm-more-button margin-top-30">Read More</a>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>
<jsp:include page="/WEB-INF/view/inc/lastMenu.jsp"></jsp:include>

</body>
</html>