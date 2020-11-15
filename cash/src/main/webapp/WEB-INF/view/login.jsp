<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>login</title>
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
	<!-- Preloader -->
	<div id="loader-wrapper">
		<div id="loader"></div>
		<div class="loader-section section-left"></div>
		<div class="loader-section section-right"></div>
	</div>
	<!-- End Preloader -->
	<div class="tm-top-header">
		<div class="row">
			<div class="tm-top-header-inner">
				<div class="tm-logo-container">

					<h1 class="tm-site-name tm-handwriting-font">
						<a class="tm-site-name tm-handwriting-font"
							href="${pageContext.request.contextPath }/admin/index">CASHBOOK</a>
					</h1>
				</div>
				<div class="mobile-menu-icon">
					<i class="fa fa-bars"></i>
				</div>
				<nav class="tm-nav">
					<ul>
						<li><a href="${pageContext.request.contextPath }/admin/index">홈</a></li>
						<li><a
							href="${pageContext.request.contextPath }/admin/noticeList/1">공지사항</a></li>
						<li><a
							href="${pageContext.request.contextPath }/admin/cashbookByMonth/now/-1/-1">가계부</a></li>
						<li><a
							href="${pageContext.request.contextPath }/admin/cashbookList/1">가계부리스트</a></li>
						<li><a
							href="${pageContext.request.contextPath }/admin/chartStrart.jsp">통계</a></li>
					</ul>
				</nav>
			</div>
		</div>
	</div>
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
				<a href="#main" class="tm-more-button tm-more-button-welcome">로그인</a>
				<p class="gray-text tm-welcome-description text-center">
					spring으로 만든 가계부 입니다. <br> <br> 로그인 이후 이용할수 있습니다.
				</p>
			</div>

			<img src="${pageContext.request.contextPath }/img/table-set.png"
				alt="Table Set" class="tm-table-set img-responsive">

		</div>

	</section>


	<div class="tm-main-section light-gray-bg">
		<div class="container" id="main">
			<section class="tm-section row ">
				<div class="col-lg-9 col-md-9 col-sm-8">
					<div class="row">
						<div class="col-lg-12 tm-section-header-container">
							<h2 class="tm-section-header gold-text tm-handwriting-font">
								로그인</h2>
							<div class="tm-hr-container">
								<hr class="tm-hr">
							</div>
						</div>
					</div>
					<div style="margin-left: 20px; margin-top: 20px; margin-left: 40%;">
						<form id="loginForm" method="post"
							action="${pageContext.request.contextPath}/login">
							<div>
								<span style="font-size: 20px; margin-right: 30px;">ID </span> <input
									id="id" type="text" name="id" class="form-control">
							</div>
							<span id="idCheck" class="text-danger" style="margin-left: 60px;"></span>
							<div style="margin-top: 20px;">
								<span style="font-size: 20px; margin-right: 20px;">PW </span> <input
									id="pw" type="password" name="pw" class="form-control">
							</div>
							<span id="pwCheck" class="text-danger" style="margin-left: 60px;"></span>

							<button id="btn" type="button"
								class="tm-more-button margin-top-30">로그인</button>

						</form>
					</div>
				</div>
			</section>
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
										<th class="text-center">notice_id</th>
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

<script>
	$('#btn').click(function() {
		if ($('#id').val() == "") {
			$('#idCheck').html("아이디를 입력해주세요.");

		} else {
			$('#idCheck').html("");
		}
		if ($('#pw').val() == "") {
			$('#pwCheck').html("비밀번호를 입력해주세요.");
		} else {
			$('#pwCheck').html("");
		}

		if ($('#id').val() != "" && $('#pw').val() != "") {
			$("#loginForm").submit();
		}

	});
</script>
</html>