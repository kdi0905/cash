<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>cashbookByMonth</title>
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

.tdbg {
	background-color: #c79c60;
}

.sunday {
	color: #FF0000;
}

.sumout {
	color: #FF0000;
}

.sumin {
	color: #47C83E;
}

th {
	width: ${100/7}%;
}
td {
	height: 90px;
	vertical-align: top;
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
					<img src="${pageContext.request.contextPath }/img/header-line.png" alt="Line" class="tm-header-line">&nbsp;cashbook&nbsp;&nbsp;
					<img src="${pageContext.request.contextPath }/img/header-line.png" alt="Line" class="tm-header-line">
				</h2>
				<h2 class="gold-text tm-welcome-header-2">가 계 부</h2>
				<a href="#notice" class="tm-more-button tm-more-button-welcome">cashbook</a>
				<p class="gray-text tm-welcome-description text-center">
					어서오세요. <br> <br> 가계부 게시판입니다.
				</p>
			</div>

			<img src="${pageContext.request.contextPath }/img/table-set.png" alt="Table Set" class="tm-table-set img-responsive">

		</div>
	</section>
	<div class="tm-main-section light-gray-bg">
		<div class="container" id="notice">
			<section class="tm-section">
				<div class="row">
					<div class="col-lg-12 tm-section-header-container">
						<h2 class="tm-section-header gold-text tm-handwriting-font">
							달력</h2>

						<div class="tm-hr-container">
							<hr class="tm-hr">
						</div>
					</div>
				</div>
				<div class="tm-daily-menu-container ">

					<!-- 다이어리 -->
					<table class="table table-bordered text-center"
						style="margin-top: 30px; width: 150px; font-size: 20px; float: left;">
						<tr>
							<td style="height: 30px" class="tdbg">이번달 수입</td>
						</tr>
						<tr>
							<td class="sumin">${sumIn}</td>
						</tr>
					</table>
					<table class="table table-bordered text-center"
						style="margin-top: 30px; width: 150px; font-size: 20px; float: right;">
						<tr>
							<td style="height: 30px" class="tdbg">이번달 지출</td>
						</tr>
						<tr>
							<td class="sumout">- ${sumOut}</td>
						</tr>
					</table>

					<div style="margin-top: 50px; text-align: center;">
						<h2>
							<div style="margin-bottom: 10px;">${currentYear}년</div>
							<a class="text-secondary" href="${pageContext.request.contextPath }/admin/cashbookByMonth/pre/${currentYear}/${currentMonth-1}">&nbsp;&nbsp; < &nbsp;&nbsp;</a> ${currentMonth} 월 
							<a class="text-secondary" href="${pageContext.request.contextPath }/admin/cashbookByMonth/next/${currentYear}/${currentMonth+1}">&nbsp;&nbsp; > &nbsp;&nbsp;</a>
						</h2>
					</div>
					<table class="table table-bordered text-center" style="margin: auto;">
						<thead>
							<tr>
								<th class="sunday text-center">일</th>
								<th class="text-center">월</th>
								<th class="text-center">화</th>
								<th class="text-center">수</th>
								<th class="text-center">목</th>
								<th class="text-center">금</th>
								<th class="text-center">토</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<c:forEach var="i" begin="1" end="${lastDay+(firstDayOfWeek-1)}" step="1">
									<c:if test="${i-(firstDayOfWeek-1) < 1}">
										<td>&nbsp;</td>
									</c:if>
									<c:if test="${i-(firstDayOfWeek-1) > 0}">
										<c:if test="${i%7 == 1}">
											<td>
												<div>
													<a class="sunday" href="${pageContext.request.contextPath }/admin/cashbookByDay/now/${currentYear}/${currentMonth}/${i-(firstDayOfWeek-1)}"> ${i-(firstDayOfWeek-1)} </a>
												</div> 
												<c:forEach var="c" items="${cashList}">
													<c:if test="${i-(firstDayOfWeek-1) == c.dday}">
														<c:if test="${c.cashbookKind =='수입'}">
															<div class="sumin">${c.cashbookPrice}</div>
														</c:if>
														<c:if test="${c.cashbookKind =='지출'}">
															<div class="sumout">- ${c.cashbookPrice}</div>
														</c:if>
													</c:if>
												</c:forEach>

											</td>
										</c:if>
										<c:if test="${i%7 !=1 }">
											<td>
												<!-- <a class="text-dark" href="/admin/cashbookByDay?currentYear=${currentYear}&currentMonth=${currentMonth}&currentDay=${i-(firstDayOfWeek-1)}"> -->
												<a class="text-dark" href="${pageContext.request.contextPath }/admin/cashbookByDay/now/${currentYear}/${currentMonth}/${i-(firstDayOfWeek-1)}">
													${i-(firstDayOfWeek-1)} </a> <!-- 지출/수입 목록이 있는 날짜를 cashList에서 검색 -->

												<c:forEach var="c" items="${cashList}">
													<c:if test="${i-(firstDayOfWeek-1) == c.dday}">
														<c:if test="${c.cashbookKind =='수입'}">
															<div class="sumin">${c.cashbookPrice}</div>
														</c:if>
														<c:if test="${c.cashbookKind =='지출'}">
															<div class="sumout">- ${c.cashbookPrice}</div>
														</c:if>
													</c:if>
												</c:forEach>
											</td>
										</c:if>
									</c:if>
									<c:if test="${i%7 == 0}">
										</tr>
										<tr>
									</c:if>
								</c:forEach>
								<c:if test="${(lastDay+(firstDayOfWeek-1)) % 7 != 0}">
									<c:forEach begin="1" end="${7- ((lastDay+(firstDayOfWeek-1)) % 7)}" step="1">
										<td>&nbsp;</td>
									</c:forEach>
								</c:if>
							</tr>
						</tbody>
					</table>
				</div>
			</section>
		</div>
	</div>
<jsp:include page="/WEB-INF/view/inc/lastMenu.jsp"></jsp:include>
</body>
</html>