<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차트</title>
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
					<img src="${pageContext.request.contextPath }/img/header-line.png" alt="Line" class="tm-header-line">&nbsp;STATS&nbsp;&nbsp;
					<img src="${pageContext.request.contextPath }/img/header-line.png" alt="Line" class="tm-header-line">
				</h2>
				<h2 class="gold-text tm-welcome-header-2">통계</h2>
				<a href="#stats" class="tm-more-button tm-more-button-welcome">stats</a>
				<p class="gray-text tm-welcome-description text-center">
					어서오세요. <br> <br> 통계 페이지 입니다.
				</p>
			</div>
			<img src="${pageContext.request.contextPath }/img/table-set.png" alt="Table Set" class="tm-table-set img-responsive">
		</div>
	</section>
	<div class="tm-main-section light-gray-bg">
		<div class="container" id="stats">
			<section class="tm-section">
				<div class="row">
					<div class="col-lg-12 tm-section-header-container">
						<h2 class="tm-section-header gold-text tm-handwriting-font">통계</h2>
						<div class="tm-hr-container">
							<hr class="tm-hr">
						</div>
					</div>
				</div>
				<div class="tm-daily-menu-container ">
					<div class="container">
						<div class="row">
							<div class="from-group " style="margin: auto;">
								<a class="tm-more-button margin-top-30" href="${pageContext.request.contextPath }/admin/chart/totalOfMonthInByYear.jsp">년도별 월 수입</a>
								<a class="tm-more-button margin-top-30 " href="${pageContext.request.contextPath }/admin/chart/totalOfMonthOutByYear.jsp">년도별 월 지출</a>
							</div>
							<div class="from-group " style="margin: auto;">
								<a class="tm-more-button margin-top-30" href="${pageContext.request.contextPath }/admin/chart/totalOutAndInByYear.jsp">년도별 수입/지출</a>
								<a class="tm-more-button margin-top-30" href="${pageContext.request.contextPath }/admin/chart/categoryInByYear.jsp">년도별 카테고리 수입</a>
							</div>
						</div>
						<div class="row">
							<div class="from-group " style="margin: auto;">
								<a class="tm-more-button margin-top-30" href="${pageContext.request.contextPath }/admin/chart/chart5.jsp">chart5</a>
								<a class="tm-more-button margin-top-30" href="${pageContext.request.contextPath }/admin/chart/chart6.jsp">chart6</a>
							</div>
							<div class="from-group " style="margin: auto;">	
								
								<a class="tm-more-button margin-top-30" href="${pageContext.request.contextPath }/admin/chart/categoryOutByYear.jsp">년도별 카테고리 지출</a>
								<a class="tm-more-button margin-top-30" href="${pageContext.request.contextPath }/admin/chart/chart8.jsp">chart8</a>
							</div>
						</div>
						
						<a href="#" class="tm-more-button margin-top-30">Read More</a>
					</div>
				</div>
			</section>
		</div>
	</div>
	<jsp:include page="/WEB-INF/view/inc/lastMenu.jsp"></jsp:include>

</body>
</html>